module pllclk (input ext_clock, output pll_clock, input nrst, output lock);
   wire dummy_out1, dummy_out2, int_clk;
   wire bypass, lock1;

   assign bypass = 1'b0;

   /*
    Setup a 172 MHz PLL output from the 12 MHz external clock input.
    The exact 172 MHz clock is achieved by daisy-chaining two PLLs.
    The first PLL multiplies the input 12MHz to 64.5 MHz, which is then
    further multiplied by the second PLL up to the 172 MHz.
    */
   SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"), .PLLOUT_SELECT("GENCLK"),
		   .DIVR(4'd0), .DIVF(7'd85), .DIVQ(3'd4),
		   .FILTER_RANGE(3'b001)
   ) mypll1 (.REFERENCECLK(ext_clock),
	    .PLLOUTGLOBAL(dummy_out1), .PLLOUTCORE(int_clk), .LOCK(lock1),
	    .RESETB(nrst), .BYPASS(bypass));

   SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"), .PLLOUT_SELECT("GENCLK"),
		   .DIVR(4'd2), .DIVF(7'd31), .DIVQ(3'd2),
		   .FILTER_RANGE(3'b001)
   ) mypll2 (.REFERENCECLK(int_clk),
	    .PLLOUTGLOBAL(pll_clock), .PLLOUTCORE(dummy_out2), .LOCK(lock),
	    .RESETB(nrst), .BYPASS(bypass));

endmodule	    


module dff #(parameter W=1)
   (input wire[W-1:0] D, input clk, output reg[W-1:0] Q);

   always @(posedge clk)
     Q <= D;
endmodule // dff


module synchroniser #(parameter W=1)
   (input wire[W-1:0] D, input clk, output wire[W-1:0] Q);

   wire[W-1:0] M;

   dff #(W) first_reg(D, clk, M);
   dff #(W) last_reg(M, clk, Q);
endmodule


module edge_detector(input async_signal, input clk, output reg edge_detected);
   wire sync_signal;
   wire last_signal;

   synchroniser syncer(async_signal, clk, sync_signal);
   dff save_last(sync_signal, clk, last_signal);

   always @(posedge clk)
     edge_detected <= sync_signal ^ last_signal;
endmodule // edge_detector


module posedge_detector(input async_signal, input clk, output reg edge_detected);
   wire sync_signal;
   wire last_signal;

   synchroniser syncer(async_signal, clk, sync_signal);
   dff save_last(sync_signal, clk, last_signal);

   always @(posedge clk)
     edge_detected <= sync_signal & ~last_signal;
endmodule // posedge_detector


module posedge_counter #(parameter W=8)
   (input async_signal, input clk, output wire[W-1:0] count);

   wire gotedge;
   reg[W-1:0] counter;

   posedge_detector detector(async_signal, clk, gotedge);

   always @(posedge clk)
     if (gotedge)
       counter <= counter+1;

   assign count = counter;
endmodule // posedge_counter


module count_pulses_on_leds(input async_pulse_pin, clk, output wire[7:0] leds);
   wire[7:0] pulse_count;

   posedge_counter #(8) mycounter(async_pulse_pin, clk, pulse_count);
   assign leds = pulse_count;
endmodule // count_pulses_on_leds


module simple_write_bus_slave(input aNE, aNOE, aNWE, aA1, aD0,
			      input clk,
			      output reg do_write,
			      output reg w_adr,
			      output reg w_data);
   // Synchronised inputs.
   wire sNE, sNOE, sNWE, sA1, sD0;
   
   synchroniser sync_NE(aNE, clk, sNE);
   synchroniser sync_NOE(aNOE, clk, sNOE);
   synchroniser sync_NWE(aNWE, clk, sNWE);
   synchroniser sync_A1(aA1, clk, sA1);
   synchroniser sync_D0(aD0, clk, sD0);

   always @(*) begin
      if (~sNE & sNOE & ~sNWE) begin
	 do_write <= 1'b1;
	 w_adr <= sA1;
	 w_data <= sD0;
      end else begin
	 do_write <= 1'b0;
	 w_adr <= 1'b0;
	 w_data <= 1'b0;
      end
   end // always @ (*)
endmodule // simple_write_bus_slave


module clocked_bus_slave #(parameter ADRW=1, DATW=1)
  (input aNE, aNOE, aNWE,
   input wire [ADRW-1:0] aAn, input wire[DATW-1:0] aDn,
   input 		 clk,
   output wire 		 rw_adr,
   output reg 		 do_read, input wire[DATW-1:0] read_data,
   output reg 		 do_write, output reg w_data,
   output 		 io_output, output wire[DATW-1:0] io_data);

   wire sNE, sNOE, sNWE;
   reg[ADRW-1:0] sAn;
   reg[DATW-1:0] rDn;
   reg[DATW-1:0] wDn;
   wire[ADRW-1:0] next_sAn;
   wire[DATW-1:0] next_rDn;
   wire[DATW-1:0] next_wDn;
   wire next_do_write, next_do_read;

   // States for one-hot state machine.
   reg st_idle=1, st_write=0, st_read1=0, st_read2=0;
   wire next_st_idle, next_st_write, next_st_read1, next_st_read2;

   synchroniser sync_NE(aNE, clk, sNE);
   synchroniser sync_NOE(aNOE, clk, sNOE);
   synchroniser sync_NWE(aNWE, clk, sNWE);

   always @(posedge clk) begin
      st_idle <= next_st_idle;
      st_write <= next_st_write;
      st_read1 <= next_st_read1;
      st_read2 <= next_st_read2;

      do_write <= next_do_write;
      do_read <= next_do_read;

      sAn <= next_sAn;
      wDn <= next_wDn;
      rDn <= next_rDn;
   end

   /* Latch the address on the falling edge of NOE (read) or NWE (write).
      We can use the external address unsynchronised, as it will be stable
      when NOE/NWE toggles.
    */
   assign next_sAn = st_idle & ~sNE & (~sNOE | ~sNWE) ? aAn : sAn;

   /* Incoming write. */
   /* Latch the write data on the falling edge of NWE. NWE is synchronised,
      so the synchronisation delay is enough to ensure that the async external
      data signal is stable at this point.
    */
   assign next_wDn = st_idle & ~sNE & ~sNWE ? aDn : wDn;
   // Trigger a register write when NWE goes low.
   assign next_do_write = st_idle & ~sNE & ~sNWE;
   /* Remain (wait) in write mode until NE and NWE are both de-asserted. This
      wait helps avoid glitches on the address. If transactions would be spaced
      closely back-to-back, we might miss a short NE high-pulse, but timing
      constraints should ensure that we will not miss the high pulse on NEW.
    */
   assign next_st_write = (st_idle | st_write) & (~sNE | ~sNWE);

   /* Incoming read. */
   assign next_do_read = st_idle & ~sNE & ~sNOE;
   /* Wait one cycle for register read data to become available. */
   assign next_st_read1 = st_idle & ~sNE & ~sNOE;
   /* Put read data on the bus while NOE is asserted. */
   assign next_st_read2 = (st_read1 | st_read2) & ~sNE & ~sNOE;

   assign next_st_idle = ((st_read1 | st_read2) & (sNOE | sNE)) |
			 (st_write & (sNWE | sNE)) |
			 (st_idle & (sNE | (sNOE & sNWE)));

   /* Latch register read data one cycle after asserting do_read. */
   assign next_rDn = st_read1 ? read_data : rDn;
   /* Output data during read after latching read data. */
   assign io_output = st_read2 & next_st_read2;
   assign io_data = rDn;

   assign rw_adr = sAn;
   assign w_data = wDn;
endmodule // clocked_bus_slave


module writable_regs(input do_write, w_adr, w_data, clk,
		     output v1, v2);
   reg vreg1, vreg2;

   always @(posedge clk) begin
      if (do_write) begin
	 case (w_adr)
	   1'b0: vreg1 <= w_data;
	   1'b1: vreg2 <= w_data;
	 endcase // case (w_adr)
      end
   end
   assign v1 = vreg1;
   assign v2 = vreg2;
endmodule // writable_regs
   

module top (
	input crystal_clk,
	input STM32_PIN,
	input aNE, aNOE, aNWE, aA1,
	inout aD0,
	output LED0, output LED1, output LED2, output LED3,
	output LED4, output LED5, output LED6, output LED7
);

   wire clk;
   wire nrst, lock;
   wire [7:0] leddata;
   wire aD0_output, aD0_input, io_d_output;
   wire do_write, rw_adr, w_data;
   wire do_read, register_data;
   wire leddata1, leddata2;

   /* Type 101001 is output with tristate/enable and simple input. */
   SB_IO #(.PIN_TYPE(6'b1010_01), .PULLUP(1'b0))
     io_d0(.PACKAGE_PIN(aD0),
	   .OUTPUT_ENABLE(io_d_output),
	   .D_OUT_0(aD0_output),
	   .D_IN_0(aD0_input)
	   );

   assign nrst = 1'b1;
   pllclk my_pll(crystal_clk, clk, nrst, lock);
   count_pulses_on_leds my_ledshow(/*STM32_PIN*/aNWE, clk, leddata);

/*
   simple_write_bus_slave my_bus_slave(aNE, aNOE, aNWE, aA1, aD0,
				       clk,
				       do_write, w_adr, w_data);
*/
   clocked_bus_slave #(.ADRW(1), .DATW(1))
     my_bus_slave(aNE, aNOE, aNWE,
		  aA1, aD0_input,
		  clk, rw_adr,
		  do_read, register_data,
		  do_write, w_data,
		  io_d_output, aD0_output);

   writable_regs led_registers(do_write, rw_adr, w_data, clk, leddata1, leddata2);
   /* The clocked_bus_slave asserts do_read once per read transaction on the
      external bus (synchronous on clk). This can be used to have side effects
      on read (eg. clear "data ready" on read of data register). However, in
      this particular case we have no such side effects, so can just decode
      the read data continously (clocked_bus_slave latches the read value).
    */
   always @(*) begin
      case (rw_adr)
	1'b0: register_data <= leddata1;
	1'b1: register_data <= leddata2;
	default: register_data <= 0;
      endcase // case (rw_adr)
   end

   
   assign {LED0, LED1, LED2, LED3, LED4} = leddata[4:0];
   assign LED5 = 1'b0;
   assign LED6 = leddata1;
   assign LED7 = leddata2;
endmodule

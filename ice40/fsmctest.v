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
   

module top (
	input  crystal_clk,
	input STM32_PIN,  
	output LED0, output LED1, output LED2, output LED3,
	output LED4, output LED5, output LED6, output LED7,
	output TESTPIN
);

   wire clk;
   wire nrst, lock;
   wire [7:0] leddata;

   assign nrst = 1'b1;
   pllclk my_pll(crystal_clk, clk, nrst, lock);
   count_pulses_on_leds my_ledshow(STM32_PIN, clk, leddata);
   
   assign {LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7} = leddata;
endmodule

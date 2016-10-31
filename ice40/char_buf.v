module char_buf(input r_clk, w, w_clk, input [7:0] r_row, r_col, w_row, w_col, input [7:0] a_in, output reg [7:0] a_out);
  reg [7:0] buffer[0:255];

  //initial $readmemh("string.list", buffer); 

  always @(posedge r_clk) begin 
    a_out <= buffer[{r_col, r_row}];
  end

  always @(posedge w_clk) begin
    if (w) begin
      buffer[w_col] <= a_in;
    end
  end 
endmodule

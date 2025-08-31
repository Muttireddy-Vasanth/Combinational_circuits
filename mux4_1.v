// Author: Vasanth, 2022
// RTL for 4:1 multiplexer
module mux4_1(
  input [3:0] data_in,
  input [1:0] sel_in,
  output reg y_out
);
  // MUX behavior as parallel logic using case statement
  always @(*) begin
    case (sel_in)
      2'b00: y_out = data_in[0];
      2'b01: y_out = data_in[1];
      2'b10: y_out = data_in[2];
      2'b11: y_out = data_in[3];
      default: y_out = 1'b0;
    endcase
  end
endmodule

// Author: Vasanth, 2022
// RTL for 8:3 priority encoder
module priority_encoder8_3(
  input [7:0] in,
  output reg [2:0] out,
  output reg valid
);

  always @(*) begin
    if (in[7]) begin
      out = 3'b111;
      valid = 1'b1;
    end 
    else if (in[6]) begin
      out = 3'b110;
      valid = 1'b1;
    end 
    else if (in[5]) begin
      out = 3'b101;
      valid = 1'b1;
    end 
    else if (in[4]) begin
      out = 3'b100;
      valid = 1'b1;
    end 
    else if (in[3]) begin
      out = 3'b011;
      valid = 1'b1;
    end 
    else if (in[2]) begin
      out = 3'b010;
      valid = 1'b1;
    end 
    else if (in[1]) begin
      out = 3'b001;
      valid = 1'b1;
    end 
    else if (in[0]) begin
      out = 3'b000;
      valid = 1'b1;
    end 
    else begin
      out = 3'bxxx;  // unknown state when no input is high
      valid = 1'b0;
    end
  end

endmodule

// Author: Vasanth, 2022
module decoder_en(
  input a, b, en,
  output d0, d1, d2, d3
);
  // Continuous assignment of decoder outputs
  assign d0 = (~a) & (~b) & en;
  assign d1 = (~a) & b & en;
  assign d2 = a & (~b) & en;
  assign d3 = a & b & en;
endmodule

// Author: Vasanth, 2022
module mux_decoder4_1(
  input s1, s0,
  input I0, I1, I2, I3,
  input en,
  output tri y
);
  wire w1, w2, w3, w4;

  // Instantiation of decoder with ordered port mapping
  decoder d(s1, s0, en, w1, w2, w3, w4);

  // Instantiation of tri-state buffers with ordered port mapping
  bufif1 b1(y, I0, w1);
  bufif1 b2(y, I1, w2);
  bufif1 b3(y, I2, w3);
  bufif1 b4(y, I3, w4);

endmodule


// Author: Vasanth, 2022
module decoder(
  input a, b, en,
  output d0, d1, d2, d3
);
  // Continuous assignment of decoder outputs
  assign d0 = (~a) & (~b) & en;
  assign d1 = (~a) & b & en;
  assign d2 = a & (~b) & en;
  assign d3 = a & b & en;
endmodule

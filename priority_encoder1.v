// Author: Vasanth, 2022
module priority_encoder1(
  input I0, I1, I2, I3, I4, I5, I6, I7,
  output B0, B1, B2,
  output idle
);
  // Declaration of internal wires
  wire H0, H1, H2, H3, H4, H5, H6, H7;

  // Instantiate the priority_circuit with ordered port mapping
  priority_circuit P(I0, I1, I2, I3, I4, I5, I6, I7, H0, H1, H2, H3, H4, H5, H6, H7, idle);

  // Instantiate the Binary_encoder with ordered port mapping
  Binary_encoder B(H0, H1, H2, H3, H4, H5, H6, H7, B0, B1, B2);
endmodule


// Author: Vasanth, 2022
module Binary_encoder(
  input H0, H1, H2, H3, H4, H5, H6, H7,
  output B0, B1, B2
);
  // Continuous assignment of encoded outputs B0, B1, B2
  assign B0 = H1 | H3 | H5 | H7;
  assign B1 = H2 | H3 | H6 | H7;
  assign B2 = H4 | H5 | H6 | H7;
endmodule


// Author: Vasanth, 2022
module priority_circuit(
  input I0, I1, I2, I3, I4, I5, I6, I7,
  output H0, H1, H2, H3, H4, H5, H6, H7,
  output idle
);
  // Continuous assignment of priority outputs H7 to H0 and idle signal

  assign H7 = I7;
  assign H6 = I6 & (~I7);
  assign H5 = I5 & (~I6) & (~I7);
  assign H4 = I4 & (~I5) & (~I6) & (~I7);
  assign H3 = I3 & (~I4) & (~I5) & (~I6) & (~I7);
  assign H2 = I2 & (~I3) & (~I4) & (~I5) & (~I6) & (~I7);
  assign H1 = I1 & (~I2) & (~I3) & (~I4) & (~I5) & (~I6) & (~I7);
  assign H0 = I0 & (~I1) & (~I2) & (~I3) & (~I4) & (~I5) & (~I6) & (~I7);

  // Idle when all inputs are 0
  assign idle = (~I0) & (~I1) & (~I2) & (~I3) & (~I4) & (~I5) & (~I6) & (~I7);

endmodule

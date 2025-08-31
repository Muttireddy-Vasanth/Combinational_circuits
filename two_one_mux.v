// Author: Vasanth, 2022
module two_one_mux(
  input s, i0, i1,
  output y
);
  // Continuous assignment for 2-to-1 multiplexer output
  assign y = (~s & i0) | (s & i1);
endmodule

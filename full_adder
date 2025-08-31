// Author: Vasanth, 2022

module full_adder(
  input a, b, cin,
  output sum, cout
);
  // Declaration of internal wires
  wire w1, w2, w3;

  // Instantiate the Half-Adders using ordered port mapping
  half_adder ha1(a, b, w1, w2);
  half_adder ha2(w1, cin, sum, w3);

  // Instantiate OR gate
  or or1(cout, w2, w3);
endmodule



module half_adder(
  input a, b,
  output s, c
);
  // Data flow abstraction
  // s represents SUM output of Half Adder
  assign s = a ^ b;
  
  // c represents CARRY output of Half Adder
  assign c = a & b;
endmodule

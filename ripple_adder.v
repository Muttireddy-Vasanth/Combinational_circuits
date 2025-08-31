// Author: Vasanth, 2022
module ripple_adder(
  input [3:0] a, b,
  input cin,
  output [3:0] s,
  output c
);
  wire c1, c2, c3;

  // Instantiate full adders with ordered port mapping
  full_adder FA1(a[0], b[0], cin, s[0], c1);
  full_adder FA2(a[1], b[1], c1, s[1], c2);
  full_adder FA3(a[2], b[2], c2, s[2], c3);
  full_adder FA4(a[3], b[3], c3, s[3], c);

endmodule


// Author: Vasanth, 2022
module full_adder(
  input a, b, cin,
  output sum, cout
);
  // Continuous assignment of sum and cout (carry)
  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule



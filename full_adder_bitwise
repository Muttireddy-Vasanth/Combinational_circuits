// Author: Vasanth, 2022
//Full adder with continuos assignments

module full_adder_bitwise(
  input a, b, cin,
  output sum, cout
);
  // Continuous assignment of sum and cout (carry)
  // Performs bitwise XOR operation on a, b, and cin and assigns to sum
  assign sum = a ^ b ^ cin;

  // Performs bitwise AND operation on a, b, cin and assigns to cout (carry)
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule

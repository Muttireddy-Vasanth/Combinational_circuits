// Author: Vasanth, 2022
module bidirect_buffer(
  inout a, b,
  input en
);
  bufif0 B1(a, b, en);
  bufif1 B2(b, a, en);
endmodule

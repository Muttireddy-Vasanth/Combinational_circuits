// Author: Vasanth, 2022
module bidirect_buffer_tb();
  wire a, b;
  reg en;
  reg temp_a, temp_b;

  bidirect_buffer DUT(a, b, en);

  initial begin
    temp_a = 1'b0;
    temp_b = 1'b0;
    en = 1'b0;
  end

  always #10 temp_a = ~temp_a;
  always #20 temp_b = ~temp_b;
  always #40 en = ~en;

  assign a = (en) ? temp_a : 1'bz;
  assign b = (!en) ? temp_b : 1'bz;

  initial begin
    $monitor("a=%b, b=%b, en=%b", a, b, en);
  end

  initial begin
    #500;
    $finish;
  end
endmodule

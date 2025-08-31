// Author: Vasanth, 2022
module decoder_tb();
  // Testbench global variables
  reg a, b, en;
  wire d0, d1, d2, d3;

  // Variable for loop iteration
  integer i;

  // Instantiate the decoder with ordered port mapping
  decoder dut(a, b, en, d0, d1, d2, d3);

  // Initialize variables
  initial begin
    {a, b} = 2'b00;
    en = 1'b0;
  end

  // Generate stimulus using for loop
  initial begin
    en = 1'b1;
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end
    en = 1'b0;
  end

  // Monitor changes in variables
  initial begin
    $monitor("input a=%b b=%b enable=%b output d0=%b d1=%b d2=%b d3=%b", a, b, en, d0, d1, d2, d3);
  end

  // Terminate simulation after 50ns
  initial begin
    #50;
    $finish();
  end

endmodule

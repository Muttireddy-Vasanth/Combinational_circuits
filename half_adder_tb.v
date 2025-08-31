// Author: Vasanth, 2022
module half_adder_tb();
  // Testbench global variables
  reg a, b;
  wire sum, cout;

  // Variable for loop iteration
  integer i;

  // Instantiate the half adder with ordered port mapping
  half_adder dut (a, b, sum, cout);

  // Process to initialize the variables at 0s
  initial begin
    {a, b} = 2'b00;
  end

  // Process to generate stimulus using for loop
  initial begin
    for (i = 0; i < 4; i = i + 1) begin
      {a, b} = i;
      #10;
    end
  end

  // Process to monitor the changes in the variables
  initial begin
    $monitor("input %b %b output %b %b", a, b, sum, cout);
  end

  // Process to terminate simulation after 100ns
  initial begin
    #100;
    $finish();
  end

endmodule

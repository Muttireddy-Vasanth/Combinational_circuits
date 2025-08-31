// Author: Vasanth, 2022
module full_adder_tb();
  // Testbench global variables
  reg a, b, cin;
  wire sum, cout;

  // Variable for loop iteration
  integer i;

  // Instantiate the full adder with ordered port mapping
  full_adder dut(a, b, cin, sum, cout);

  // Initialize the variables at 0s
  initial begin
    {a, b, cin} = 3'b000;
  end

  // Generate stimulus using for loop
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      {a, b, cin} = i;
      #10;
    end
  end

  // Monitor the changes in the variables
  initial begin
    $monitor("inputs a = %b, b = %b, c = %b, outputs Sum = %b, carry = %b", a, b, cin, sum, cout);
  end

  // Terminate simulation after 100ns
  initial begin
    #100;
    $finish();
  end

endmodule

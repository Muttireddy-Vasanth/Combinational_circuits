// Author: Vasanth, 2022
// TESTBENCH for 8:3 priority encoder
module priority_encoder8_3_tb();
  // Variables required for testbench
  reg [7:0] in;
  wire [2:0] out;
  wire valid;

  // Instantiate the Design Under Test (DUT)
  priority_encoder8_3 DUT(in, out, valid);

  // Task to initialize inputs of DUT to 0
  task initialize;
    begin
      in = 0;
      #10;
    end
  endtask

  // Task with argument for driving stimulus to DUT
  task stimulus(input [7:0] i);
    begin
      in = i;
      #10;
    end
  endtask

  // Integer for loop iteration
  integer m;

  // Call the tasks from procedural process
  initial begin
    initialize;
    for (m = 0; m < 256; m = m + 1) begin
      stimulus(m);
    end
  end

  // Use $monitor task to display inputs and outputs
  initial begin
    $monitor("Values of input=%b, Output=%b, Valid=%b", in, out, valid);
  end

  // Use $finish task to terminate the simulation at 2600 time units
  initial begin
    #2600;
    $finish;
  end

endmodule

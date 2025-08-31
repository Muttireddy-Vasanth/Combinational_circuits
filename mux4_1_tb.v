// Author: Vasanth, 2022
// Testbench for 4:1 multiplexer
module mux4_1_tb();
  // Variables required for testbench
  reg [3:0] data_in;
  reg [1:0] sel_in;
  wire y_out;

  // Instantiate the design
  mux4_1 DUT(data_in, sel_in, y_out);

  // Task to initialize inputs of DUT to 0
  task initialise;
    begin
      {data_in, sel_in} = 0;
    end
  endtask

  // Task with arguments for driving stimulus to DUT
  task stimulus(input [3:0] i, input [1:0] j);
    begin
      #10;
      data_in = i;
      sel_in = j;
    end
  endtask

  integer m, n;

  // Call the tasks from procedural process
  initial begin
    initialise;
    for (m = 0; m < 4; m = m + 1) begin
      for (n = 0; n < 16; n = n + 1) begin
        stimulus(n, m);
      end
    end
  end

  // $monitor to display inputs and outputs
  initial begin
    $monitor("values of data_in=%b sel_in=%b y_out=%b", data_in, sel_in, y_out);
  end

  // $finish to terminate the simulation at 1000ns
  initial begin
    #1000;
    $finish;
  end

endmodule

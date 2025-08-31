// Author: Vasanth, 2022
// TESTBENCH for 3 to 8 decoder
module decoder3_8_tb();
  reg [2:0] in;
  reg en;
  wire [7:0] out;

  decoder3_8 DUT(in, en, out);

  // Task to initialize inputs
  task initialise;
    begin
      {in, en} = 0;
    end
  endtask

  // Task to apply stimulus inputs
  task stimulus(input [2:0] j, input k);
    begin
      in = j;
      en = k;
      #10;
    end
  endtask

  integer m;

  // Generate stimulus sequence
  initial begin
    initialise;
    for (m = 0; m < 8; m = m + 1) begin
      stimulus(m, 1);
    end
    en = 1'b0;  // Disable enable after test
  end

  // Monitor inputs and outputs
  initial begin
    $monitor("values of in=%b en=%b out=%b", in, en, out);
  end

  // End simulation after 100 time units
  initial begin
    #100;
    $finish;
  end

endmodule

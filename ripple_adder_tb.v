// Author: Vasanth, 2022
module ripple_adder_tb();
  // Testbench global variables
  reg [3:0] a, b;
  reg cin;
  wire [3:0] s;
  wire c;
  // Variable for loop iteration
  integer m;

  // Instantiate the ripple adder with ordered port mapping
  ripple_adder DUT(a, b, cin, s, c);

  // Task to initialize the variables at 0s
  task initialise;
    begin
      a = 4'b0000;
      b = 4'b0000;
      cin = 1'b0;
      #10;
    end
  endtask

  // Task to give stimulus to variables
  task stimulus(input [8:0] i);
    begin
      // Assigning bits of i to a, b, and cin accordingly:
      a = i[8:5]; // top 4 bits to a
      b = i[4:1]; // next 4 bits to b
      cin = i[0]; // LSB to cin
      #10;
    end
  endtask

  // Generate stimulus using for loop
  initial begin
    initialise;
    for (m = 0; m < 512; m = m + 1) begin
      stimulus(m);
    end
  end

  // Monitor changes in variables
  initial begin
    $monitor("values of a=%b b=%b cin=%b\n sum=%b carry=%b", a, b, cin, s, c);
  end

  // Terminate simulation after 150ns
  initial begin
    #150;
    $finish;
  end

endmodule

// Author: Vasanth, 2022
module four_one_mux_tb();
  reg s1, s0, I0, I1, I2, I3;
  wire y;
  integer i, j;

  four_one_mux dut(s1, s0, I0, I1, I2, I3, y);

  initial begin
    {s1, s0} = 2'b00;
    {I0, I1, I2, I3} = 4'b0000;
  end

  task data(input [1:0] sel, input [3:0] k);
    begin
      {s1, s0} = sel;
      {I0, I1, I2, I3} = k;
      #10;
    end
  endtask

  initial begin
    for (j = 0; j < 16; j = j + 1) begin
      for (i = 0; i < 4; i = i + 1) begin
        data(i, j);
      end
    end
  end

  initial begin
    $monitor("s1=%b s0=%b I0=%b I1=%b I2=%b I3=%b output y=%b", s1, s0, I0, I1, I2, I3, y);
  end

  initial begin
    #700;
    $finish;
  end

endmodule

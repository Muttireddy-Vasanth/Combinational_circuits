// Author: Vasanth, 2022
module mux_decoder4_1_tb();
  reg s1, s0, I0, I1, I2, I3, en;
  wire y;
  integer i, j;

  mux_decoder4_1 DUT(s1, s0, I0, I1, I2, I3, en, y);

  initial begin
    {s1, s0} = 2'b00;
    en = 1'b1;
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
    en = 1'b1;
    for (j = 0; j < 16; j = j + 1) begin
      for (i = 0; i < 4; i = i + 1) begin
        data(i, j);
      end
    end
    en = 1'b0;
  end

  initial begin
    $monitor("enable=%b lines s1s0=%b data I0I1I2I3=%b output=%b", en, {s1, s0}, {I0, I1, I2, I3}, y);
  end

endmodule

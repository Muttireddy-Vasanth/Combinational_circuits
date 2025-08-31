module four_one_mux(s1,s0,10,11,12,13,y);
//port declarations
input s1,s0,I0,11,12,13;
output y;
//Declaration of internal wire
wire w1,w2;
//Instantiate the two one mux's using order based mapping
two_one_mux tl(s0,I0,I1,wl);
two_one_mux t2 (s0, I2,I3,w2);
two_one_mux t3(s1,w1,w2,y);
endmodule

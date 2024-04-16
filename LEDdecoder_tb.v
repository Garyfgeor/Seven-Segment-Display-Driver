`timescale 1ns/1ps
module LEDdecoder_tb;
reg [3:0] char;
wire [6:0] LED;

LEDdecoder LEDdec_test(char, LED);

//parameters for its char ofour message "1oProject2022-23"
parameter zero = 4'b0000;
parameter one = 4'b0001;
parameter two = 4'b0010;
parameter three = 4'b0011;
parameter c = 4'b0100;
parameter e = 4'b0101;
parameter j = 4'b0110;
parameter o = 4'b0111;
parameter P = 4'b1000;
parameter r = 4'b1001;
parameter t = 4'b1010;
parameter dash = 4'b1011;

initial 
begin  
 $monitor( "CHAR=%b, LED=%b ", char, LED);
  #1 char = one;
  #1 char = o;
  #1 char = P;
  #1 char = r;
  #1 char = o;
  #1 char = j;
  #1 char = e;
  #1 char = c;
  #1 char = t;
  #1 char = two;
  #1 char = zero;
  #1 char = two;
  #1 char = two;
  #1 char = dash;
  #1 char = two;
  #1 char = three;
end
endmodule
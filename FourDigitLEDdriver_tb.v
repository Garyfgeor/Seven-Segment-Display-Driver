`timescale 1ns/1ps
`define period 10
module FourDigitLEDdriver_tb;
reg clk, reset, button;
reg [3:0] char;

wire an3, an2, an1, an0;
wire a, b, c, d, e, f, g, dp;

parameter one = 4'b0000;
parameter letter_o = 4'b0001;
parameter letter_P = 4'b0010;
parameter letter_r = 4'b0011;
parameter letter_O = 4'b0100;
parameter letter_j = 4'b0101;
parameter letter_e = 4'b0110;
parameter letter_c = 4'b0111;
parameter letter_t = 4'b1000;
parameter two = 4'b1001;
parameter zero = 4'b1010;
parameter Two = 4'b1011;
parameter TWo = 4'b1100;
parameter dash = 4'b1101;
parameter TWO = 4'b1110;
parameter three = 4'b1111;

//instantion of the top module
FourDigitLEDdriver_partC FourDigitLEDdriver_partC_inst(reset, clk, button, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
//FourDigitLEDdriver_partD FourDigitLEDdriver_partD_inst(reset, clk, button, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
//FourDigitLEDdriver FourDigitLEDdriver_inst(reset, clk, button, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);
//FourDigitLEDdriver_partB FourDigitLEDdriver_partB_inst(reset, clk, button, an3, an2, an1, an0, a, b, c, d, e, f, g, dp);

initial 
begin
reset = 1'b0;
button = 1'b0;
clk = 1'b0;

//reset and button take get values to test their functionality
#400 reset = 1'b1;
#5 reset = 1'b0;

#2000 button = 1'b1;
#10000 button = 1'b0;
#2000 button = 1'b1;

#(500*`period)reset = 1'b1;
#(5*`period)reset = 1'b0;
end

always
begin
   #(`period/2)clk = ~clk;
end

endmodule
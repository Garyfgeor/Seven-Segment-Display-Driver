`timescale 1ns/1ps
module FourBitCounterAnodes_tb;
reg clk;
wire [3:0] q;
wire [3:0] anodes;

FourBitCounter FourBitCounter_test(clk, q);
always #1 clk = ~clk; 
initial
begin 
    clk <= 0;
    $monitor( "q=%b, anodes=%b ", q, anodes);
end

endmodule
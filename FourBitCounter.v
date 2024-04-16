`timescale 1ns/1ps
module FourBitCounter(clk, reset, q);
input clk, reset;
output reg [3:0] q;

//q is a counter that goes from 15 to 0 and iths used for the anodes display
always@(posedge clk or posedge reset)
begin
    if(reset)
        begin
        q <= 4'b1111;
        end
    else
        q <= (q == 0) ? (4'b1111):(q - 4'b0001);
end

endmodule
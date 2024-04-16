`timescale 1ns/1ps
module D_FlipFlop(clk, D, Q);
input clk, D;
output reg Q;

//gives in the output, the value from the input in the positive edge of the clock
always@(posedge clk)
begin
    Q <= D;
end    
endmodule
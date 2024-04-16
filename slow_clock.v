module slow_clock(clk, clk_out);
input clk; //clock of the FPGA 100MHz
output reg clk_out; //slow clock with 4Hz freq.
//reg [25:0] counter = 0;
reg [3:0] counter = 4'b0000;
reg clk_initial = 0;

always@(posedge clk)
begin
    if (clk_initial == 0)
    begin
        clk_out = 0;
    end
    
    counter <= counter + 4'b0001;
    clk_initial = 1;
    if(counter == 4'b1111)
    begin
        counter <= 4'b0000;
        clk_out =~ clk_out;
    end
end
endmodule


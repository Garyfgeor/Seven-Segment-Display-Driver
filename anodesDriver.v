module anodesDriver(q, anodes);
input [3:0] q;
output reg [3:0] anodes; 

always@(q)
begin
    case(q)
        //Τhe series of the anodes is an3, an2, an1, an0. Τhe value of q and the corresponding value of the anodes are given from the instructions  
        4'b1110: anodes = 4'b0111;
        4'b1010: anodes = 4'b1011;
        4'b0110: anodes = 4'b1101;
        4'b0010: anodes = 4'b1110;
        default: anodes = 4'b1111;
    endcase
end
endmodule
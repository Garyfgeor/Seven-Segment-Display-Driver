module charToAnodes(q, char);
input [3:0] q;
output reg [3:0] char;

parameter one = 4'b0000;
parameter letter_o = 4'b0001;
parameter letter_P = 4'b0010;
parameter letter_r = 4'b0011;

//display of "1oPr" for the partB of the project, with the suitable anodes, depending on the q that is calculated in module "FourBitCounter"
always@(q)
begin
    case(q)
        4'b1111:char = one;
        4'b1110:char = one;
        4'b1101:char = one;
        4'b1100:char = letter_o;
        4'b1011:char = letter_o;
        4'b1010:char = letter_o;
        4'b1001:char = letter_o;
        4'b1000:char = letter_P;
        4'b0111:char = letter_P;
        4'b0110:char = letter_P;
        4'b0101:char = letter_P;
        4'b0100:char = letter_r;
        4'b0011:char = letter_r;
        4'b0010:char = letter_r;
        4'b0001:char = letter_r;
        4'b0000:char = one;
    endcase
end
endmodule
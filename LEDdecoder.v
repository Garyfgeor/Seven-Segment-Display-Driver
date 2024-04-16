module LEDdecoder(char, LED);
input [3:0] char;
output reg [6:0] LED;

//parameters for its char ofour message "1oProject2022-23"
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

always@(char)
begin
    case(char)//display of the characters "1oProject2022-23"
    //the sequence of the parts of its LED is ca,cb,cc,cd,ce,cf,cg
    zero: LED = 7'b0000001;//0
    one: LED = 7'b1001111;//1
    two: LED = 7'b0010010;//2
    Two: LED = 7'b0010010;//2
    TWo: LED = 7'b0010010;//2
    TWO: LED = 7'b0010010;//2
    three: LED = 7'b0000110;//3
    letter_c: LED = 7'b1110010;//c
    letter_e: LED = 7'b0010000;//e
    letter_j: LED = 7'b1000111;//j
    letter_o: LED = 7'b1100010;//o 
    letter_O: LED = 7'b1100010;//o 
    letter_P: LED = 7'b0011000;//P
    letter_r: LED = 7'b1111010;//r
    letter_t: LED = 7'b1110000;//t
    dash: LED = 7'b1111110;//-
    default: LED = 7'b1111111;//all the parts of the LED are off
    endcase
end
endmodule
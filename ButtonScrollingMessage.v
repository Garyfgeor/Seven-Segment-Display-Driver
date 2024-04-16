//module for scrolling the message to the left one by one character using button
module ButtonScrollingMessage(clk, reset, button, q, char_button);
input clk, button, reset;
input [3:0] q;
output reg [3:0] char_button;
reg [3:0] counter_button;
reg [3:0] message [0:15];
reg button_old = 0;
reg button_raise = 0;

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

//memory initialization with the message "1oProject2022-23"
always@(posedge clk)
begin
    message[0] <= one;
    message[1] <= letter_o;
    message[2] <= letter_P;
    message[3] <= letter_r;
    message[4] <= letter_O;
    message[5] <= letter_j;
    message[6] <= letter_e;
    message[7] <= letter_c;
    message[8] <= letter_t;
    message[9] <= two;
    message[10] <= zero;
    message[11] <= Two;
    message[12] <= TWo;
    message[13] <= dash;
    message[14] <= TWO;
    message[15] <= three;
end

//creation of the signal button_raise that activates the counter_button when its equal to 1
always@(posedge clk)
begin
    if (button_old != button && button == 1'b1)
    begin
        button_raise <= 1'b1;
    end
    else
    begin
        button_raise <= 1'b0;
    end
    button_old <= button;
end

//creation of the counter_button that counts the position of its char in the memory
always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
            counter_button <= 4'b0000;
    end
    else if(button_raise == 1'b1)
    begin
        if(counter_button == 4'b1111)
        begin
            counter_button <= 4'b0000;
        end
        else
        begin
           counter_button <= counter_button + 1;
        end   
    end
end

//display of the chars from the memory that depends on the value of "q"
always@(q)
begin
    case(q)
        4'b1111:char_button <= message[counter_button];
        4'b1110:char_button <= message[counter_button];
        4'b1101:char_button <= message[counter_button];
        4'b1100:char_button <= message[counter_button + 1];
        4'b1011:char_button <= message[counter_button + 1];
        4'b1010:char_button <= message[counter_button + 1];
        4'b1001:char_button <= message[counter_button + 1];
        4'b1000:char_button <= message[counter_button + 2];
        4'b0111:char_button <= message[counter_button + 2];
        4'b0110:char_button <= message[counter_button + 2];
        4'b0101:char_button <= message[counter_button + 2];
        4'b0100:char_button <= message[counter_button + 3];
        4'b0011:char_button <= message[counter_button + 3];
        4'b0010:char_button <= message[counter_button + 3];
        4'b0001:char_button <= message[counter_button + 3];
        4'b0000:char_button <= message[counter_button];
    endcase
end
endmodule
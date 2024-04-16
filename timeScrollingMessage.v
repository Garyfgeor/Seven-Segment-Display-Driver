////module for scrolling the message to the left one by one character with a time delay
module timeScrollingMessage(clk, reset, q, char_button);
input clk, reset;
input [3:0] q;
output reg [3:0] char_button;
reg [22:0] counter = 23'b111_11111_11111_11111_11111;
reg [3:0] counter_pos;
reg [3:0] message [0:15];
reg [22:0] counter_old = 23'b000_00000_00000_00000_00000;
reg counter_raise = 0;

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

//23 bit counter for counting 1,6777214 seconds
always@(posedge clk or posedge reset)
begin
    if(reset == 1 || counter == 23'b000_00000_00000_00000_00000)
    begin
        counter <= 23'b111_11111_11111_11111_11111;
    end
    else if(counter != 23'b000_00000_00000_00000_00000)
    begin
        counter <= counter - 23'b000_00000_00000_00001;
    end
end 

//creation of the signal counter_raise that activates the counter_pos when its equal to 1
always@(posedge clk)
begin
    if (counter_old != counter && counter == 23'b000_00000_00000_00000_00000)
    begin
        counter_raise <= 1'b1;
    end
    else
    begin
         counter_raise <= 1'b0;
    end
    counter_old <= counter;
end
//counter_pos for counting the position of its display character in the message
always@(posedge clk or posedge reset)
begin
    if (reset)
    begin
        counter_pos <= 4'b0000;
    end
    else if(counter_raise == 1'b1)
    begin
        if(counter_pos == 4'b1111)
        begin
            counter_pos <= 4'b0000;
        end
        else
        begin
            counter_pos <= counter_pos + 1;
        end
    end
end

//display of the chars from the memory that depends on the value of "q"
always@(q)
begin
    case(q)
        4'b1111:char_button <= message[counter_pos];
        4'b1110:char_button <= message[counter_pos];
        4'b1101:char_button <= message[counter_pos];
        4'b1100:char_button <= message[counter_pos + 1];
        4'b1011:char_button <= message[counter_pos + 1];
        4'b1010:char_button <= message[counter_pos + 1];
        4'b1001:char_button <= message[counter_pos + 1];
        4'b1000:char_button <= message[counter_pos + 2];
        4'b0111:char_button <= message[counter_pos + 2];
        4'b0110:char_button <= message[counter_pos + 2];
        4'b0101:char_button <= message[counter_pos + 2];
        4'b0100:char_button <= message[counter_pos + 3];
        4'b0011:char_button <= message[counter_pos + 3];
        4'b0010:char_button <= message[counter_pos + 3];
        4'b0001:char_button <= message[counter_pos + 3];
        4'b0000:char_button <= message[counter_pos];
    endcase
end

endmodule
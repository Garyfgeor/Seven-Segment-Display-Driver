//filtering of the button (or reset) to avoid the bouncing of the signal 
module anti_bounce(button, clk, new_button);
input button, clk;
output new_button;
//wire reset_counter;
wire clk_out;
wire q1, q2, q2_bar;

slow_clock slow_clock_inst(clk, clk_out);
D_FlipFlop D_FF_1_inst(clk_out, button, q1);
D_FlipFlop D_FF_2_inst(clk_out, q1, q2);

//D_FlipFlop D_FF_1_inst(clk, button, q1);
//D_FlipFlop D_FF_2_inst(clk, q1, q2);
//assign reset_counter = q1 ^ q2;

//slow_clock slow_clock_inst(clk, reset_counter, clk_out);

assign q2_bar = ~q2;
assign new_button = q1 & q2_bar;
endmodule
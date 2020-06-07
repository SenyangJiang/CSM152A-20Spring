`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:37:33 06/06/2020 
// Design Name: 
// Module Name:    parking_meter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module parking_meter(
input add1,
input add2,
input add3,
input add4,
input rst1,
input rst2,
input clk,
input rst,
output [6:0] seg_vector,
output a1,
output a2,
output a3,
output a4,
output [3:0] val1,
output [3:0] val2,
output [3:0] val3,
output [3:0] val4
    );
reg activate;
reg [13:0] timer;
reg [6:0] counter;
reg [1:0] curr_state;

// states
parameter INIT = 0;
parameter LESS = 1;
parameter MORE = 2;

// assign four digits
assign val1 = timer / 1000;
assign val2 = (timer % 1000) / 100;
assign val3 = (timer % 100) / 10;
assign val4 = timer % 10;

// seven segment display module
seven_seg_display ssd(
.time1(val1),
.time2(val2),
.time3(val3),
.time4(val4),
.activate(activate),
.clk(clk),
.seg_vector(seg_vector),
.a1(a1),
.a2(a2),
.a3(a3),
.a4(a4)
);

// update states
always@(posedge clk) begin
	if (rst)
		curr_state <= INIT;
	else if (timer == 0)
		curr_state <= INIT;
	else if (timer < 180)
		curr_state <= LESS;
	else
		curr_state <= MORE;
end

// update counter and activate/deactivate seven_seg display
always@(posedge clk) begin
	if(rst) begin
		counter <= 0;
		activate <= 0;
	end
	else begin
		if (curr_state == LESS) begin
			if (timer % 2 == 1)
				activate <= 0;
			else
				activate <= 1;
			if (counter == 99)
				counter <= 0;
			else
				counter <= counter + 1'b1;
		end
		else begin
			if (counter == 49) begin
				counter <= counter + 1'b1;
				activate <= ~activate;
			end
			else if (counter == 99) begin
				counter <= 0;
				activate <= ~activate;
			end
			else
				counter <= counter + 1'b1;
		end
	end
end

// update timer
always@(posedge clk) begin
	if (add1) begin
		if (timer + 60 > 9999)
			timer <= 9999;
		else
			timer <= timer + 60;
	end
	if (add2) begin
		if (timer + 120 > 9999)
			timer <= 9999;
		else
			timer <= timer + 120;
	end
	if (add3) begin
		if (timer + 180 > 9999)
			timer <= 9999;
		else
			timer <= timer + 180;
	end
	if (add4) begin
		if (timer + 300 > 9999)
			timer <= 9999;
		else
			timer <= timer + 300;
	end
	if (rst)
		timer <= 0;
	if (rst1)
		timer <= 16;
	if (rst2)
		timer <= 150;
	if (counter == 99)
		if (timer > 0)
			timer <= timer - 1'b1;
end
endmodule

module seven_seg_display(
input [3:0] time1,
input [3:0] time2,
input [3:0] time3,
input [3:0] time4,
input activate,
input clk,
output reg [6:0] seg_vector,
output reg a1,
output reg a2,
output reg a3,
output reg a4
);
reg [1:0] state;

initial begin
	state <= 0;
end

function [6:0] seven_seg_encoder;
input [3:0] digit;
case(digit)
0: seven_seg_encoder = 7'b0000001;
1: seven_seg_encoder = 7'b1001111;
2: seven_seg_encoder = 7'b0010010;
3: seven_seg_encoder = 7'b0000110;
4: seven_seg_encoder = 7'b1001100;
5: seven_seg_encoder = 7'b0100100;
6: seven_seg_encoder = 7'b0100000;
7: seven_seg_encoder = 7'b0001111;
8: seven_seg_encoder = 7'b0000000;
9: seven_seg_encoder = 7'b0000100;
endcase
endfunction

always@(posedge clk) begin
if(activate) begin
	case(state)
	0: begin
		a1 <= 0; a2 <= 1; a3 <= 1; a4 <= 1;
		end
	1: begin
		a1 <= 1; a2 <= 0; a3 <= 1; a4 <= 1;
		end
	2: begin
		a1 <= 1; a2 <= 1; a3 <= 0; a4 <= 1;
		end
	3: begin
		a1 <= 1; a2 <= 1; a3 <= 1; a4 <= 0;
		end
	default: begin
		a1 <= 1; a2 <= 1; a3 <= 1; a4 <= 1;
		end
	endcase

	case(state)
	0: seg_vector <= seven_seg_encoder(time1);
	1: seg_vector <= seven_seg_encoder(time2);
	2: seg_vector <= seven_seg_encoder(time3);
	3: seg_vector <= seven_seg_encoder(time4);
	endcase
end
else begin
	a1 <= 1; a2 <= 1; a3 <= 1; a4 <= 1;
	seg_vector <= 7'b1111111;
end
state <= state + 1'b1;
end
endmodule

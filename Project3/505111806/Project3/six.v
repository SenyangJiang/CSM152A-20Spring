`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:56:00 05/10/2020 
// Design Name: 
// Module Name:    six 
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
module six(
	input clk_in,
	input rst,
	output logical_or_clk
    );
wire pos;
wire neg;
assign logical_or_clk = pos || neg;
four pos_clk(
	.clk_in (clk_in),
	.rst (rst),
	.clk_33_duty_cycle(pos)
);

five neg_clk(
	.clk_in (clk_in),
	.rst (rst),
	.clk_33_duty_cycle(neg)
);
endmodule

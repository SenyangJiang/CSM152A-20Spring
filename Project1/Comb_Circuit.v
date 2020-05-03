`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:39:25 04/15/2020 
// Design Name: 
// Module Name:    Comb_Circuit 
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
module Comb_Circuit(SW, LED
	);
input [4:0] SW;
output reg LED;

wire [1:0] Switch = SW[1:0];
wire [3:0] SelectIn = SW[4:2];

wire NOT_Gate = ~Switch[0];
wire Buffer = Switch[0];
wire XNOR_Gate = Switch[0]~^Switch[1];
wire XOR_Gate = Switch[0]^Switch[1];
wire OR_Gate = Switch[0]|Switch[1];
wire NOR_Gate = ~(Switch[0]|Switch[1]);
wire AND_Gate = Switch[0]&Switch[1];
wire NAND_Gate = ~(Switch[0]&Switch[1]);

wire [7:0] MuxIn = {NAND_Gate, AND_Gate, NOR_Gate, OR_Gate, XOR_Gate, XNOR_Gate, Buffer, NOT_Gate};

always @(SelectIn, MuxIn) begin
	LED = MuxIn[SelectIn];
end
endmodule

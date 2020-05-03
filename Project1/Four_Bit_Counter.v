`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:46:32 04/16/2020 
// Design Name: 
// Module Name:    Four_Bit_Counter 
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
module Four_Bit_Counter(rst, clk, Q
    );
input rst;
input clk;
output reg [3:0] Q;

always @(posedge clk) begin
if(rst == 1'b1) begin
	Q <= 4'b0000;
	end
else begin
	Q[0] <= ~Q[0];
	Q[1] <= Q[0]^Q[1];
	Q[2] <= (Q[0]&Q[1])^Q[2];
	Q[3] <= (Q[0]&Q[1]&Q[2])^Q[3];
	end
end

endmodule

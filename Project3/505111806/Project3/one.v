`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:07:18 05/09/2020 
// Design Name: 
// Module Name:    one 
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
module one(
	input clk_in,
	input rst, 
	output clk_div_2, 
	output clk_div_4, 
	output clk_div_8, 
	output clk_div_16
);
reg [3:0] counter;
assign clk_div_2 = counter[0];
assign clk_div_4 = counter[1];
assign clk_div_8 = counter[2];
assign clk_div_16 = counter[3];
always @(posedge clk_in) begin
	if (rst)
		counter <= 0;
	else
		counter <= counter + 1;
end

endmodule

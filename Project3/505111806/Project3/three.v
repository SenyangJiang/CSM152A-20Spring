`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:12:31 05/09/2020 
// Design Name: 
// Module Name:    three 
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
module three(
	input clk_in, 
	input rst, 
	output reg clk_div_28
);
reg [3:0] counter;
always @(posedge clk_in) begin
	if (rst) begin
		counter <= 4'b0000;
		clk_div_28 <= 0;
	end
	else begin
		if(counter == 13) begin
			counter <= 0;
			clk_div_28 <= ~clk_div_28;
		end
		else
			counter <= counter + 1'b1;
	end
end
endmodule

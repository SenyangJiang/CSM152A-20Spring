`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:33:01 05/09/2020 
// Design Name: 
// Module Name:    two 
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
module two(
	input clk_in, 
	input rst, 
	output reg [3:0] counter,
	output reg clk_div_thirty_two
    );
always @(posedge clk_in) begin
	if (rst) begin
		counter <= 0;
		clk_div_thirty_two <= 0;
	end
	else begin
		if(counter == 15)
			clk_div_thirty_two <= ~clk_div_thirty_two;
		counter <= counter + 1;
	end
end

endmodule

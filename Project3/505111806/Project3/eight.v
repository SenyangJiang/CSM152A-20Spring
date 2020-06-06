`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:28:52 05/10/2020 
// Design Name: 
// Module Name:    eight 
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
module eight(
	input clk_in,
	input rst,
	output reg clk_out
    );
reg pulse;
reg [6:0] counter;
always @(posedge clk_in) begin
	if (rst) begin
		counter <= 0;
		pulse <= 0;
	end
	else begin
		if(counter == 98) begin
			counter <= counter + 1'b1;
			pulse <= ~pulse;
		end
		else if (counter == 99) begin
			counter <= 0;
			pulse <= ~pulse;
		end
		else
			counter <= counter + 1'b1;
	end
end

always @(posedge clk_in) begin
	if (rst) begin
		clk_out <= 0;
	end
	else begin
		if (pulse == 1)
			clk_out <= ~clk_out;
	end
end
endmodule

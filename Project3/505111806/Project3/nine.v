`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:39:47 05/10/2020 
// Design Name: 
// Module Name:    nine 
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
module nine(
	input clk_in,
	input rst,
	output reg [7:0] glitchy_counter
    );
wire strobe_clock;

strobe sb(
	.clk_in (clk_in),
	.rst (rst),
	.clk_out (strobe_clock)
);

always @(posedge clk_in) begin
	if (rst)
		glitchy_counter <= 0;
	else if (strobe_clock == 1)
		glitchy_counter <= glitchy_counter - 5;
	else
		glitchy_counter <= glitchy_counter + 2;
end
endmodule

module strobe(
	input clk_in,
	input rst,
	output reg clk_out
);
reg [1:0] counter;
always @(posedge clk_in) begin
	if (rst) begin
		counter <= 0;
		clk_out <= 0;
	end
	else begin
		if(counter == 2) begin
			counter <= counter + 1'b1;
			clk_out <= ~clk_out;
		end
		else if (counter == 3) begin
			counter <= 0;
			clk_out <= ~clk_out;
		end
		else
			counter <= counter + 1'b1;
	end
end
endmodule

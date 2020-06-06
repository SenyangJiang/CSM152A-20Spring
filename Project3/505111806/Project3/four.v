`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:18:34 05/09/2020 
// Design Name: 
// Module Name:    four 
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
module four(
	input clk_in,
	input rst,
	output reg clk_33_duty_cycle
    );
reg [3:0] counter;
always @(posedge clk_in) begin
	if (rst) begin
		counter <= 0;
		clk_33_duty_cycle <= 0;
	end
	else begin
		if(counter == 3) begin
			counter <= counter + 1'b1;
			clk_33_duty_cycle <= ~clk_33_duty_cycle;
		end
		else if (counter == 5) begin
			counter <= 0;
			clk_33_duty_cycle <= ~clk_33_duty_cycle;
		end
		else
			counter <= counter + 1'b1;
	end
end
endmodule

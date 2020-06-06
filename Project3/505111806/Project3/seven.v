`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:07:22 05/10/2020 
// Design Name: 
// Module Name:    seven 
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
module seven(
	input clk_in,
	input rst,
	output clk_div_5
    );
wire pos;
wire neg;
assign clk_div_5 = pos || neg;
pos_2_outof_5 pos_clk(
	.clk_in (clk_in),
	.rst (rst),
	.clk_out(pos)
);

neg_2_outof_5 neg_clk(
	.clk_in (clk_in),
	.rst (rst),
	.clk_out(neg)
);
endmodule

module pos_2_outof_5(
	input clk_in,
	input rst,
	output reg clk_out
    );
reg [3:0] counter;
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
		else if (counter == 4) begin
			counter <= 0;
			clk_out <= ~clk_out;
		end
		else
			counter <= counter + 1'b1;
	end
end
endmodule

module neg_2_outof_5(
	input clk_in,
	input rst,
	output reg clk_out
    );
reg [3:0] counter;
always @(negedge clk_in) begin
	if (rst) begin
		counter <= 0;
		clk_out <= 0;
	end
	else begin
		if(counter == 2) begin
			counter <= counter + 1'b1;
			clk_out <= ~clk_out;
		end
		else if (counter == 4) begin
			counter <= 0;
			clk_out <= ~clk_out;
		end
		else
			counter <= counter + 1'b1;
	end
end
endmodule

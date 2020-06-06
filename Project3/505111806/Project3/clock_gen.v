`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:08:24 05/09/2020 
// Design Name: 
// Module Name:    clock_gen 
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
module clock_gen(
	input clk_in,
	input rst,
	output clk_div_2,
	output clk_div_4,
	output clk_div_8,
	output clk_div_16,
	output clk_div_28,
	output clk_div_5,
	output [7:0] glitchy_counter
);
clock_div_two task_one(
.clk_in (clk_in),
.rst (rst),
.clk_div_2(clk_div_2),
.clk_div_4(clk_div_4),
.clk_div_8(clk_div_8),
.clk_div_16(clk_div_16)
);
clock_div_twenty_eight task_two(
.clk_in (clk_in),
.rst (rst),
.clk_div_28(clk_div_28)
);
clock_div_five task_three(
.clk_in (clk_in),
.rst (rst),
.clk_div_5(clk_div_5)
);
clock_strobe task_four(
.clk_in (clk_in),
.rst (rst),
.glitchy_counter (glitchy_counter)
);
endmodule

module clock_div_two(
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

module clock_div_twenty_eight(
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

module clock_div_five (
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

module clock_strobe (
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

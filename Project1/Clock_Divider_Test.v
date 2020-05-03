`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:26:37 04/16/2020
// Design Name:   Clock_Divider
// Module Name:   /home/ise/Project1/Clock_Divider_Test.v
// Project Name:  Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Clock_Divider
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Clock_Divider_Test;

	// Inputs
	reg clk;

	// Outputs
	wire LED;

	// Instantiate the Unit Under Test (UUT)
	Clock_Divider uut (
		.clk(clk), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#2000000000 $finish;
	end
	always begin
		#50000 clk = ~clk;
	end
endmodule


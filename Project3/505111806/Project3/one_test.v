`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:09:55 05/09/2020
// Design Name:   one
// Module Name:   /home/ise/Project3/one_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: one
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module one_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire clk_div_2;
	wire clk_div_4;
	wire clk_div_8;
	wire clk_div_16;

	// Instantiate the Unit Under Test (UUT)
	one uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_div_2(clk_div_2), 
		.clk_div_4(clk_div_4), 
		.clk_div_8(clk_div_8), 
		.clk_div_16(clk_div_16)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 1;
		#15 rst = 0;
		#200 $finish;

	end
   always begin
		#5 clk_in = ~clk_in; // 10ns clock
	end
      
endmodule


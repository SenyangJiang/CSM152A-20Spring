`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:05:17 05/10/2020
// Design Name:   six
// Module Name:   /home/ise/Project3/six_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: six
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module six_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire logical_or_clk;

	// Instantiate the Unit Under Test (UUT)
	six uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.logical_or_clk(logical_or_clk)
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


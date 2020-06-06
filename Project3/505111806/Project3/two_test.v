`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:56:59 05/09/2020
// Design Name:   two
// Module Name:   /home/ise/Project3/two_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire [3:0] counter;
	wire clk_div_thirty_two;

	// Instantiate the Unit Under Test (UUT)
	two uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.counter(counter), 
		.clk_div_thirty_two(clk_div_thirty_two)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// add stimulus here
      rst = 1;
		#15 rst = 0;
		#200 $finish;

	end
   always begin
		#5 clk_in = ~clk_in; // 10ns clock
	end
      
endmodule


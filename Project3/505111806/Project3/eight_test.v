`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:43:57 05/10/2020
// Design Name:   eight
// Module Name:   /home/ise/Project3/eight_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire clk_out;

	// Instantiate the Unit Under Test (UUT)
	eight uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_out(clk_out)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rst = 1;
		#100 rst = 0;
		#400 $finish;

	end
   always begin
		#5 clk_in = ~clk_in; // 10ns clock
	end
      
endmodule


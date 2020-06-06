`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:35:56 05/09/2020
// Design Name:   five
// Module Name:   /home/ise/Project3/five_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: five
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module five_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire clk_33_duty_cycle;

	// Instantiate the Unit Under Test (UUT)
	five uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_33_duty_cycle(clk_33_duty_cycle)
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


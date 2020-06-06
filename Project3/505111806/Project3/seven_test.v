`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:19:24 05/10/2020
// Design Name:   seven
// Module Name:   /home/ise/Project3/seven_test.v
// Project Name:  Project3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_test;

	// Inputs
	reg clk_in;
	reg rst;

	// Outputs
	wire clk_div_5;

	// Instantiate the Unit Under Test (UUT)
	seven uut (
		.clk_in(clk_in), 
		.rst(rst), 
		.clk_div_5(clk_div_5)
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


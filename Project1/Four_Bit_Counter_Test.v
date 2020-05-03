`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:17:28 04/16/2020
// Design Name:   Four_Bit_Counter
// Module Name:   /home/ise/Project1/Four_Bit_Counter_Test.v
// Project Name:  Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Four_Bit_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Four_Bit_Counter_Test;

	// Inputs
	reg rst;
	reg clk;

	// Outputs
	wire [3:0] Q;

	// Instantiate the Unit Under Test (UUT)
	Four_Bit_Counter uut (
		.rst(rst), 
		.clk(clk), 
		.Q(Q)
	);

	initial begin
		// Initialize Inputs
		rst = 1;
		clk = 0;
		#20 rst = 0;
		#200 $finish;
	end
   always begin
		#5 clk = ~clk;
	end
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:41:36 04/18/2020
// Design Name:   Comb_Circuit
// Module Name:   /home/ise/Project1/Comb_Circuit_Test.v
// Project Name:  Project1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Comb_Circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Comb_Circuit_Test;

	// Inputs
	reg [4:0] SW;

	// Outputs
	wire LED;

	// Instantiate the Unit Under Test (UUT)
	Comb_Circuit uut (
		.SW(SW), 
		.LED(LED)
	);

	initial begin
		// test NOT gate
		SW = 5'b00000; // 1
		#20 SW = 5'b00001; // 0
		// test buffer
		#20 SW = 5'b00100; // 0
		#20 SW = 5'b00101; // 1
		// test XNOR
		#20 SW = 5'b01000; // 1
		#20 SW = 5'b01001; // 0
		// test XOR
		#20 SW = 5'b01100; // 0
		#20 SW = 5'b01101; // 1
		// test OR
		#20 SW = 5'b10000; // 0
		#20 SW = 5'b10001; // 1
		// test NOR
		#20 SW = 5'b10100; // 1
		#20 SW = 5'b10101; // 0
		// test AND
		#20 SW = 5'b11000; // 0
		#20 SW = 5'b11011; // 1
		// test NAND
		#20 SW = 5'b11100; // 1
		#20 SW = 5'b11111; // 0
	end
	initial begin
		#320 $finish;
	end
      
endmodule


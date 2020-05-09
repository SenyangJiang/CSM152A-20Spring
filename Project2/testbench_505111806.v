`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:33:44 05/03/2020
// Design Name:   FPCVT
// Module Name:   /home/ise/Project2/testbench_505111806.v
// Project Name:  Project2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FPCVT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_505111806;

	// Inputs
	reg [12:0] D;

	// Outputs
	wire S;
	wire [2:0] E;
	wire [4:0] F;

	// Instantiate the Unit Under Test (UUT)
	FPCVT uut (
		.D(D), 
		.S(S), 
		.E(E), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		
		// check if correctly handles equal or more than 8 leading zeros
		D = 13'b0000000000000; // 0 000 00000
		#20 D = 13'b0000000000010; // 0 000 00010
		#20 D = 13'b0000000011111; // 0 000 11111

		// general rounding test
		#20 D = 13'b0000001101100; // 0 010 11011
		#20 D = 13'b0000001101101; // 0 010 11011
		#20 D = 13'b0000001101110; // 0 010 11100
		#20 D = 13'b0000001101111; // 0 010 11100

		// overflow rounding test
		#20 D = 13'b0000011111101; // 0 100 10000
		#20 D = 13'b0000000111111; // 0 010 10000

		// negative test
		#20 D = 13'b1111001011010; // 1 100 11010
		#20 D = 13'b1111111111111; // 1 000 00001

		// corner case test
		// -4096
		#20 D = 13'b1000000000000; // 1 111 11111
		// larger than max representation
		#20 D = 13'b0111111101010; // 0 111 11111
		#20 D = 13'b1000000000111; // 1 111 11111
	end
   initial begin
		#280 $finish;
	end
endmodule

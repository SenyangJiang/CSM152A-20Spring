`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:51:57 06/06/2020
// Design Name:   parking_meter
// Module Name:   /home/ise/Project5/testbench_505111806.v
// Project Name:  Project5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parking_meter
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
	reg add1;
	reg add2;
	reg add3;
	reg add4;
	reg rst1;
	reg rst2;
	reg clk;
	reg rst;

	// Outputs
	wire [6:0] seg_vector;
	wire a1;
	wire a2;
	wire a3;
	wire a4;
	wire [3:0] val1;
	wire [3:0] val2;
	wire [3:0] val3;
	wire [3:0] val4;

	// Instantiate the Unit Under Test (UUT)
	parking_meter uut (
		.add1(add1), 
		.add2(add2), 
		.add3(add3), 
		.add4(add4), 
		.rst1(rst1), 
		.rst2(rst2), 
		.clk(clk), 
		.rst(rst), 
		.seg_vector(seg_vector), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.a4(a4), 
		.val1(val1), 
		.val2(val2), 
		.val3(val3), 
		.val4(val4)
	);

	initial begin
		// Initialize Inputs
		add1 = 0;
		add2 = 0;
		add3 = 0;
		add4 = 0;
		rst1 = 0;
		rst2 = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// set the FSM to initial state
      rst = 1;
		#20000000 rst = 0;
		
		// test1: at initial state, flash with 0000 with period 1 sec
		#1000000000; // 4 seconds
		#1000000000;
		#1000000000;
		#1000000000;
		
		// test2: check each add button and reset button
		add1 = 1; // add 60 seconds
		#10000000;
		add1 = 0; add2 = 1; // add 120 seconds
		#10000000;
		add2 = 0; add3 = 1; // add 180 seconds
		#10000000;
		add3 = 0; add4 = 1; // add 300 seconds
		#10000000;
		add4 = 0; rst1 = 1; // reset time to 16 seconds
		#10000000;
		rst1 = 0; rst2 = 1; // reset time to 150 seconds
		#10000000;
		rst2 = 0;
		
		// test3: When less than 180 seconds,
		// the display should flash with a period of 2 seconds
		// we are currently at 150 seconds
		#1000000000; // 6 seconds
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		
		// test4: When more than 180 seconds,
		// the display should flash with a period of 1 second
		add4 = 1;
		#10000000 add4 = 0;
		#1000000000; // 6 seconds
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		#1000000000;
		
		// test5: max value of time will be 9999
		add4 = 1;
		#400000000; add4 = 0; // check if  latched at 9999
		

	end
   always begin
		#5000000 clk = ~clk; // a 100 Hz clock
	end
endmodule


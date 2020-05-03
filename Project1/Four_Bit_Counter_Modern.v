`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:49:47 04/16/2020 
// Design Name: 
// Module Name:    Four_Bit_Counter_Modern 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Four_Bit_Counter_Modern(rst, clk, a
    );
input rst, clk;
output reg [3:0] a;
always @(posedge clk) begin
	if (rst)
		a <= 4'b0000;
	else
		a <= a + 1'b1;
end

endmodule

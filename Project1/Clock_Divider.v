`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:08:09 04/16/2020 
// Design Name: 
// Module Name:    Clock_Divider 
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
module Clock_Divider(clk, LED
    );
input clk;
output reg LED = 0;

reg [12:0] counter = 0;

always @(posedge clk) begin
	counter <= counter + 1;
	if(counter == 5000) begin
		counter <= 0;
		LED = ~LED;
	end
end

endmodule

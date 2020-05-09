`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:06 05/03/2020 
// Design Name: 
// Module Name:    FPCVT 
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
module FPCVT(D, S, E, F
    );
input [12:0] D; // input 13 bit number in two's complement representation
output S; // output sign bit
output [2:0] E; // output 3-bit exponent
output [4:0] F; // output 5-bit significand

wire [12:0] M;
wire [2:0] raw_E;
wire [5:0] ex;

To_sign_mag tsm(.twos_comp(D),
				.sign(S),
				.mag(M));

Raw_exp_mantissa rem(.mag(M),
							.raw_exp(raw_E),
							.extract(ex));

Final_exp_mantissa fem(.raw_exp(raw_E),
								.extract(ex),
								.exp(E),
								.mantissa(F));
endmodule

module To_sign_mag(twos_comp, sign, mag
);
input [12:0] twos_comp;
output sign;
output reg [12:0] mag;

assign sign = twos_comp[12];

always @* begin
	if (sign == 1) begin
		mag = ~twos_comp + 1;
		if(mag[12] == 1) // if this is true, then D is -4096
			mag = 'b0111111111111;
	end
	else
		mag = twos_comp;
end
endmodule


module Raw_exp_mantissa(mag, raw_exp, extract
);
input [12:0] mag;
output reg [2:0] raw_exp;
output reg [5:0] extract; // stores 6 bits after the leading zeros

always @* begin
	// check leading zeros and find raw_exponent
	if (mag[11] == 1)
		raw_exp = 'b111;
	else if (mag[10] == 1)
		raw_exp = 'b110;
	else if (mag[9] == 1)
		raw_exp = 'b101;
	else if (mag[8] == 1)
		raw_exp = 'b100;
	else if (mag[7] == 1)
		raw_exp = 'b011;
	else if (mag[6] == 1)
		raw_exp = 'b010;
	else if (mag[5] == 1)
		raw_exp = 'b001;
	else
		raw_exp = 'b000;
	
	// extract leading 6 bits
	case (raw_exp)
		7: extract = mag[11:6];
		6: extract = mag[10:5];
		5: extract = mag[9:4];
		4: extract = mag[8:3];
		3: extract = mag[7:2];
		2: extract = mag[6:1];
		1: extract = mag[5:0];
		0: extract = mag[5:0] << 1; // actually there is no 6th bit, fill 6th bit with 0
	endcase
end
endmodule

module Final_exp_mantissa(raw_exp, extract, exp, mantissa
);
input [2:0] raw_exp;
input [5:0] extract;
output reg [2:0] exp;
output reg [4:0] mantissa;

always @* begin
	exp = raw_exp;
	mantissa = extract[5:1];
	if (extract == 'b111111) begin // handles overflow case
		if (raw_exp != 'b111) begin
			mantissa = 'b10000;
			exp = exp + 1;
		end
	end
	else if(extract[0] == 1) begin // if no overflow, look at 6th bit
		mantissa = mantissa + 1;
	end
end
endmodule

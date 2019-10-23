`timescale 1ns / 1ps

module S_block2(input [1:6] initial_bits, output reg [1:4] output_bits
    );
	 
always @(initial_bits)
begin
if(initial_bits[1] == 0 && initial_bits[6] == 0)
case (initial_bits[2:5])
	  4'b0000: output_bits <= 15;
	  4'b0001: output_bits <= 1;
	  4'b0010: output_bits <= 8;
	  4'b0011: output_bits <= 14;
	  4'b0100: output_bits <= 6;
	  4'b0101: output_bits <= 11;
	  4'b0110: output_bits <= 3;
	  4'b0111: output_bits <= 4;
	  4'b1000: output_bits <= 9;
	  4'b1001: output_bits <= 7;
	  4'b1010: output_bits <= 2; 
	  4'b1011: output_bits <= 13;
	  4'b1100: output_bits <= 12;
	  4'b1101: output_bits <= 0;
	  4'b1110: output_bits <= 5;
	  4'b1111: output_bits <= 10;
	  default: output_bits <= 4'b1111;
endcase	  

if(initial_bits[1] == 0 && initial_bits[6] == 1)
case (initial_bits[2:5])
	  4'b0000: output_bits <= 3;
	  4'b0001: output_bits <= 13;
	  4'b0010: output_bits <= 4;
	  4'b0011: output_bits <= 7;
	  4'b0100: output_bits <= 15;
	  4'b0101: output_bits <= 2;
	  4'b0110: output_bits <=8;
	  4'b0111: output_bits <= 14;
	  4'b1000: output_bits <= 12;
	  4'b1001: output_bits <= 0;
	  4'b1010: output_bits <= 1; 
	  4'b1011: output_bits <= 10;
	  4'b1100: output_bits <= 6;
	  4'b1101: output_bits <= 9;
	  4'b1110: output_bits <= 11;
	  4'b1111: output_bits <= 5;
	  default: output_bits <= 4'b1111;
endcase	  

if(initial_bits[1] == 1 && initial_bits[6] == 0)
case (initial_bits[2:5])
	  4'b0000: output_bits <= 0;
	  4'b0001: output_bits <= 14;
	  4'b0010: output_bits <= 7;
	  4'b0011: output_bits <= 11;
	  4'b0100: output_bits <= 10;
	  4'b0101: output_bits <= 4;
	  4'b0110: output_bits <=13;
	  4'b0111: output_bits <= 1;
	  4'b1000: output_bits <= 5;
	  4'b1001: output_bits <= 8;
	  4'b1010: output_bits <= 12; 
	  4'b1011: output_bits <= 6;
	  4'b1100: output_bits <= 9;
	  4'b1101: output_bits <= 3;
	  4'b1110: output_bits <= 2;
	  4'b1111: output_bits <= 15;
	  default: output_bits <= 4'b1111;
endcase	  

if(initial_bits[1] == 1 && initial_bits[6] == 1)
case (initial_bits[2:5])
	  4'b0000: output_bits <= 13;
	  4'b0001: output_bits <= 8;
	  4'b0010: output_bits <= 10;
	  4'b0011: output_bits <= 1;
	  4'b0100: output_bits <= 3;
	  4'b0101: output_bits <= 15;
	  4'b0110: output_bits <= 4;
	  4'b0111: output_bits <= 2;
	  4'b1000: output_bits <= 11;
	  4'b1001: output_bits <= 6;
	  4'b1010: output_bits <= 7; 
	  4'b1011: output_bits <= 12;
	  4'b1100: output_bits <= 0;
	  4'b1101: output_bits <= 5;
	  4'b1110: output_bits <= 14;
	  4'b1111: output_bits <= 9;
	  default: output_bits <= 4'b1111;
endcase	  
end




endmodule

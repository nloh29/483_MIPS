`timescale 1ns / 1ps

module round(input [1:32] leftHalf, input [1:32] rightHalf, input [1:48] round_key,output [1:32]new_left,output [1:32] new_right
    );

wire [1:32] f_block1;

F_block f1(.key(round_key),.half_block(rightHalf),.f_block_output(f_block1));

assign new_left = leftHalf ^ f_block1;
assign new_right = rightHalf;
	 

endmodule



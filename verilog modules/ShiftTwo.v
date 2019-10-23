`timescale 1ns / 1ps

module shiftTwo(input [1:28] leftHalf, input[1:28] rightHalf, 
	         output [1:28] newLeft, output [1:28] newright);

assign newLeft[1] = leftHalf[3];
assign newLeft[2] = leftHalf[4];
assign newLeft[3] = leftHalf[5];
assign newLeft[4] = leftHalf[6];
assign newLeft[5] = leftHalf[7];
assign newLeft[6] = leftHalf[8];
assign newLeft[7] = leftHalf[9];
assign newLeft[8] = leftHalf[10];
assign newLeft[9] = leftHalf[11];
assign newLeft[10] = leftHalf[12];
assign newLeft[11] = leftHalf[13];
assign newLeft[12] = leftHalf[14];
assign newLeft[13] = leftHalf[15];
assign newLeft[14] = leftHalf[16];
assign newLeft[15] = leftHalf[17];
assign newLeft[16] = leftHalf[18];
assign newLeft[17] = leftHalf[19];
assign newLeft[18] = leftHalf[20];
assign newLeft[19] = leftHalf[21];
assign newLeft[20] = leftHalf[22];
assign newLeft[21] = leftHalf[23];
assign newLeft[22] = leftHalf[24];
assign newLeft[23] = leftHalf[25];
assign newLeft[24] = leftHalf[26];
assign newLeft[25] = leftHalf[27];
assign newLeft[26] = leftHalf[28];
assign newLeft[27] = leftHalf[1];
assign newLeft[28] = leftHalf[2];

assign newright[1] = rightHalf[3];
assign newright[2] = rightHalf[4];
assign newright[3] = rightHalf[5];
assign newright[4] = rightHalf[6];
assign newright[5] = rightHalf[7];
assign newright[6] = rightHalf[8];
assign newright[7] = rightHalf[9];
assign newright[8] = rightHalf[10];
assign newright[9] = rightHalf[11];
assign newright[10] = rightHalf[12];
assign newright[11] = rightHalf[13];
assign newright[12] = rightHalf[14];
assign newright[13] = rightHalf[15];
assign newright[14] = rightHalf[16];
assign newright[15] = rightHalf[17];
assign newright[16] = rightHalf[18];
assign newright[17] = rightHalf[19];
assign newright[18] = rightHalf[20];
assign newright[19] = rightHalf[21];
assign newright[20] = rightHalf[22];
assign newright[21] = rightHalf[23];
assign newright[22] = rightHalf[24];
assign newright[23] = rightHalf[25];
assign newright[24] = rightHalf[26];
assign newright[25] = rightHalf[27];
assign newright[26] = rightHalf[28];
assign newright[27] = rightHalf[1];
assign newright[28] = rightHalf[2];



endmodule

`timescale 1ns / 1ps

module finalPermutation(input [1:32] leftHalf, input [1:32] rightHalf, output [1:64] finalOutput
    );
wire [1:64] tempArray;

assign tempArray[1:32] = leftHalf;
assign tempArray[33:64] = rightHalf;

assign finalOutput[1] = tempArray[40];
assign finalOutput[2] = tempArray[8];
assign finalOutput[3] = tempArray[48];
assign finalOutput[4] = tempArray[16];
assign finalOutput[5] = tempArray[56];
assign finalOutput[6] = tempArray[24];
assign finalOutput[7] = tempArray[64];
assign finalOutput[8] = tempArray[32];
assign finalOutput[9] = tempArray[39];
assign finalOutput[10] = tempArray[7];
assign finalOutput[11] = tempArray[47];
assign finalOutput[12] = tempArray[15];
assign finalOutput[13] = tempArray[55];
assign finalOutput[14] = tempArray[23];
assign finalOutput[15] = tempArray[63];
assign finalOutput[16] = tempArray[31];
assign finalOutput[17] = tempArray[38];
assign finalOutput[18] = tempArray[6];
assign finalOutput[19] = tempArray[46];
assign finalOutput[20] = tempArray[14];
assign finalOutput[21] = tempArray[54];
assign finalOutput[22] = tempArray[22];
assign finalOutput[23] = tempArray[62];
assign finalOutput[24] = tempArray[30];
assign finalOutput[25] = tempArray[37];
assign finalOutput[26] = tempArray[5];
assign finalOutput[27] = tempArray[45];
assign finalOutput[28] = tempArray[13];
assign finalOutput[29] = tempArray[53];
assign finalOutput[30] = tempArray[21];
assign finalOutput[31] = tempArray[61];
assign finalOutput[32] = tempArray[29];
assign finalOutput[33] = tempArray[36];
assign finalOutput[34] = tempArray[4];
assign finalOutput[35] = tempArray[44];
assign finalOutput[36] = tempArray[12];
assign finalOutput[37] = tempArray[52];
assign finalOutput[38] = tempArray[20];
assign finalOutput[39] = tempArray[60];
assign finalOutput[40] = tempArray[28];
assign finalOutput[41] = tempArray[35];
assign finalOutput[42] = tempArray[3];
assign finalOutput[43] = tempArray[43];
assign finalOutput[44] = tempArray[11];
assign finalOutput[45] = tempArray[51];
assign finalOutput[46] = tempArray[19];
assign finalOutput[47] = tempArray[59];
assign finalOutput[48] = tempArray[27];
assign finalOutput[49] = tempArray[34];
assign finalOutput[50] = tempArray[2];
assign finalOutput[51] = tempArray[42];
assign finalOutput[52] = tempArray[10];
assign finalOutput[53] = tempArray[50];
assign finalOutput[54] = tempArray[18];
assign finalOutput[55] = tempArray[58];
assign finalOutput[56] = tempArray[26];
assign finalOutput[57] = tempArray[33];
assign finalOutput[58] = tempArray[1];
assign finalOutput[59] = tempArray[41];
assign finalOutput[60] = tempArray[9];
assign finalOutput[61] = tempArray[49];
assign finalOutput[62] = tempArray[17];
assign finalOutput[63] = tempArray[57];
assign finalOutput[64] = tempArray[25];


endmodule

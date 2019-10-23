`timescale 1ns / 1ps



module initialKeyPerm(input [1:64] initialKey, output [1:56] outputKey);


assign outputKey[1] = initialKey[57]; 
assign outputKey[2] = initialKey[49];
assign outputKey[3] = initialKey[41];
assign outputKey[4] = initialKey[33];
assign outputKey[5] = initialKey[25];
assign outputKey[6] = initialKey[17];
assign outputKey[7] = initialKey[9];
assign outputKey[8] = initialKey[1];
assign outputKey[9] = initialKey[58];
assign outputKey[10] = initialKey[50];
assign outputKey[11] = initialKey[42];
assign outputKey[12] = initialKey[34];
assign outputKey[13] = initialKey[26];
assign outputKey[14] = initialKey[18];
assign outputKey[15] = initialKey[10];
assign outputKey[16] = initialKey[2];
assign outputKey[17] = initialKey[59];
assign outputKey[18] = initialKey[51];
assign outputKey[19] = initialKey[43];
assign outputKey[20] = initialKey[35];
assign outputKey[21] = initialKey[27];
assign outputKey[22] = initialKey[19];
assign outputKey[23] = initialKey[11];
assign outputKey[24] = initialKey[3];
assign outputKey[25] = initialKey[60];
assign outputKey[26] = initialKey[52];
assign outputKey[27] = initialKey[44];
assign outputKey[28] = initialKey[36];
assign outputKey[29] = initialKey[63];
assign outputKey[30] = initialKey[55];
assign outputKey[31] = initialKey[47];
assign outputKey[32] = initialKey[39];
assign outputKey[33] = initialKey[31];
assign outputKey[34] = initialKey[23];
assign outputKey[35] = initialKey[15];
assign outputKey[36] = initialKey[7];
assign outputKey[37] = initialKey[62];
assign outputKey[38] = initialKey[54];
assign outputKey[39] = initialKey[46];
assign outputKey[40] = initialKey[38];
assign outputKey[41] = initialKey[30];
assign outputKey[42] = initialKey[22];
assign outputKey[43] = initialKey[14];
assign outputKey[44] = initialKey[6];
assign outputKey[45] = initialKey[61];
assign outputKey[46] = initialKey[53];
assign outputKey[47] = initialKey[45];
assign outputKey[48] = initialKey[37];
assign outputKey[49] = initialKey[29];
assign outputKey[50] = initialKey[21];
assign outputKey[51] = initialKey[13];
assign outputKey[52] = initialKey[5];
assign outputKey[53] = initialKey[28];
assign outputKey[54] = initialKey[20];
assign outputKey[55] = initialKey[12];
assign outputKey[56] = initialKey[4];






endmodule

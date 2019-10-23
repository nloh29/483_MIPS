`timescale 1ns / 1ps

module keyPC2(input [1:28] leftHalf, input [1:28] rightHalf, output [1:48] subKey
		

    );
wire [1:56] newArray;


assign newArray[1:28] = leftHalf;
assign newArray[29:56] = rightHalf;

assign subKey[1] = newArray[14];
assign subKey[2] = newArray[17];
assign subKey[3] = newArray[11];
assign subKey[4] = newArray[24];
assign subKey[5] = newArray[1];
assign subKey[6] = newArray[5];
assign subKey[7] = newArray[3];
assign subKey[8] = newArray[28];
assign subKey[9] = newArray[15];
assign subKey[10] = newArray[6];
assign subKey[11] = newArray[21];
assign subKey[12] = newArray[10];
assign subKey[13] = newArray[23];
assign subKey[14] = newArray[19];
assign subKey[15] = newArray[12];
assign subKey[16] = newArray[4];
assign subKey[17] = newArray[26];
assign subKey[18] = newArray[8];
assign subKey[19] = newArray[16];
assign subKey[20] = newArray[7];
assign subKey[21] = newArray[27];
assign subKey[22] = newArray[20];
assign subKey[23] = newArray[13];
assign subKey[24] = newArray[2];
assign subKey[25] = newArray[41];
assign subKey[26] = newArray[52];
assign subKey[27] = newArray[31];
assign subKey[28] = newArray[37];
assign subKey[29] = newArray[47];
assign subKey[30] = newArray[55];
assign subKey[31] = newArray[30];
assign subKey[32] = newArray[40];
assign subKey[33] = newArray[51];
assign subKey[34] = newArray[45];
assign subKey[35] = newArray[33];
assign subKey[36] = newArray[48];
assign subKey[37] = newArray[44];
assign subKey[38] = newArray[49];
assign subKey[39] = newArray[39];
assign subKey[40] = newArray[56];
assign subKey[41] = newArray[34];
assign subKey[42] = newArray[53];
assign subKey[43] = newArray[46];
assign subKey[44] = newArray[42];
assign subKey[45] = newArray[50];
assign subKey[46] = newArray[36];
assign subKey[47] = newArray[29];
assign subKey[48] = newArray[32];

endmodule

module InitialPerm(input [1:64] plaintext, output [1:64] IP_out);

assign IP_out[1] = plaintext[58];
assign IP_out[2] = plaintext[50];
assign IP_out[3] = plaintext[42];
assign IP_out[4] = plaintext[34];
assign IP_out[5] = plaintext[26];
assign IP_out[6] = plaintext[18];
assign IP_out[7] = plaintext[10];
assign IP_out[8] = plaintext[2];
assign IP_out[9] = plaintext[60];
assign IP_out[10] = plaintext[52];
assign IP_out[11] = plaintext[44];
assign IP_out[12] = plaintext[36];
assign IP_out[13] = plaintext[28];
assign IP_out[14] = plaintext[20];
assign IP_out[15] = plaintext[12];
assign IP_out[16] = plaintext[4];
assign IP_out[17] = plaintext[62];
assign IP_out[18] = plaintext[54];
assign IP_out[19] = plaintext[46];
assign IP_out[20] = plaintext[38];
assign IP_out[21] = plaintext[30];
assign IP_out[22] = plaintext[22];
assign IP_out[23] = plaintext[14];
assign IP_out[24] = plaintext[6];
assign IP_out[25] = plaintext[64];
assign IP_out[26] = plaintext[56];
assign IP_out[27] = plaintext[48];
assign IP_out[28] = plaintext[40];
assign IP_out[29] = plaintext[32];
assign IP_out[30] = plaintext[24];
assign IP_out[31] = plaintext[16];
assign IP_out[32] = plaintext[8];
assign IP_out[33] = plaintext[57];
assign IP_out[34] = plaintext[49];
assign IP_out[35] = plaintext[41];
assign IP_out[36] = plaintext[33];
assign IP_out[37] = plaintext[25];
assign IP_out[38] = plaintext[17];
assign IP_out[39] = plaintext[9];
assign IP_out[40] = plaintext[1];
assign IP_out[41] = plaintext[59];
assign IP_out[42] = plaintext[51];
assign IP_out[43] = plaintext[43];
assign IP_out[44] = plaintext[35];
assign IP_out[45] = plaintext[27];
assign IP_out[46] = plaintext[19];
assign IP_out[47] = plaintext[11];
assign IP_out[48] = plaintext[3];
assign IP_out[49] = plaintext[61];
assign IP_out[50] = plaintext[53];
assign IP_out[51] = plaintext[45];
assign IP_out[52] = plaintext[37];
assign IP_out[53] = plaintext[29];
assign IP_out[54] = plaintext[21];
assign IP_out[55] = plaintext[13];
assign IP_out[56] = plaintext[5];
assign IP_out[57] = plaintext[63];
assign IP_out[58] = plaintext[55];
assign IP_out[59] = plaintext[47];
assign IP_out[60] = plaintext[39];
assign IP_out[61] = plaintext[31];
assign IP_out[62] = plaintext[23];
assign IP_out[63] = plaintext[15];
assign IP_out[64] = plaintext[7];


endmodule


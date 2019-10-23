`timescale 1ns / 1ps

module F_block( input [1:48] key, input [1:32] half_block, output [1:32] f_block_output
    );
wire [1:48] perm_halfblock;
wire [1:48] xor_block;

assign perm_halfblock[1] =  half_block[32];
assign perm_halfblock[2] =  half_block[1];
assign perm_halfblock[3] =  half_block[2];
assign perm_halfblock[4] =  half_block[3];
assign perm_halfblock[5] =  half_block[4];
assign perm_halfblock[6] =  half_block[5];
assign perm_halfblock[7] =  half_block[4];
assign perm_halfblock[8] =  half_block[5];
assign perm_halfblock[9] =  half_block[6];
assign perm_halfblock[10] =  half_block[7];
assign perm_halfblock[11] =  half_block[8];
assign perm_halfblock[12] =  half_block[9];
assign perm_halfblock[13] =  half_block[8];
assign perm_halfblock[14] =  half_block[9];
assign perm_halfblock[15] =  half_block[10];
assign perm_halfblock[16] =  half_block[11];
assign perm_halfblock[17] =  half_block[12];
assign perm_halfblock[18] =  half_block[13];
assign perm_halfblock[19] =  half_block[12];
assign perm_halfblock[20] =  half_block[13];
assign perm_halfblock[21] =  half_block[14];
assign perm_halfblock[22] =  half_block[15];
assign perm_halfblock[23] =  half_block[16];
assign perm_halfblock[24] =  half_block[17];
assign perm_halfblock[25] =  half_block[16];
assign perm_halfblock[26] =  half_block[17];
assign perm_halfblock[27] =  half_block[18];
assign perm_halfblock[28] =  half_block[19];
assign perm_halfblock[29] =  half_block[20];
assign perm_halfblock[30] =  half_block[21];
assign perm_halfblock[31] =  half_block[20];
assign perm_halfblock[32] =  half_block[21];
assign perm_halfblock[33] =  half_block[22];
assign perm_halfblock[34] =  half_block[23];
assign perm_halfblock[35] =  half_block[24];
assign perm_halfblock[36] =  half_block[25];
assign perm_halfblock[37] =  half_block[24];
assign perm_halfblock[38] =  half_block[25];
assign perm_halfblock[39] =  half_block[26];
assign perm_halfblock[40] =  half_block[27];
assign perm_halfblock[41] =  half_block[28];
assign perm_halfblock[42] =  half_block[29];
assign perm_halfblock[43] =  half_block[28];
assign perm_halfblock[44] =  half_block[29];
assign perm_halfblock[45] =  half_block[30];
assign perm_halfblock[46] =  half_block[31];
assign perm_halfblock[47] =  half_block[32];
assign perm_halfblock[48] =  half_block[1];


assign xor_block = perm_halfblock ^ key;
wire [1:4] s1_output;
wire [1:4] s2_output;
wire [1:4] s3_output;
wire [1:4] s4_output;
wire [1:4] s5_output;
wire [1:4] s6_output;
wire [1:4] s7_output;
wire [1:4] s8_output;
wire [1:32] sub_arr;
/*
S_block s1(.initial_bits(xor_block[48:43]),.output_bits(s1_output));
S_block s2(.initial_bits(xor_block[42:37]),.output_bits(s2_output));
S_block s3(.initial_bits(xor_block[36:31]),.output_bits(s3_output));
S_block s4(.initial_bits(xor_block[30:25]),.output_bits(s4_output));
S_block s5(.initial_bits(xor_block[24:19]),.output_bits(s5_output));
S_block s6(.initial_bits(xor_block[18:13]),.output_bits(s6_output));
S_block s7(.initial_bits(xor_block[12:7]),.output_bits(s7_output));
S_block s8(.initial_bits(xor_block[6:1]),.output_bits(s8_output));
*/

S_block s1(.initial_bits(xor_block[1:6]),.output_bits(s1_output));
S_block2 s2(.initial_bits(xor_block[7:12]),.output_bits(s2_output));
S_block3 s3(.initial_bits(xor_block[13:18]),.output_bits(s3_output));
S_block4 s4(.initial_bits(xor_block[19:24]),.output_bits(s4_output));
S_block5 s5(.initial_bits(xor_block[25:30]),.output_bits(s5_output));
S_block6 s6(.initial_bits(xor_block[31:36]),.output_bits(s6_output));
S_block7 s7(.initial_bits(xor_block[37:42]),.output_bits(s7_output));
S_block8 s8(.initial_bits(xor_block[43:48]),.output_bits(s8_output));




assign sub_arr[1:4] = s1_output;
assign sub_arr[5:8] = s2_output;
assign sub_arr[9:12] = s3_output;
assign sub_arr[13:16] = s4_output;
assign sub_arr[17:20] = s5_output;
assign sub_arr[21:24] = s6_output;
assign sub_arr[25:28] = s7_output;
assign sub_arr[29:32] = s8_output;
/*
assign sub_arr[32:29] = s1_output;
assign sub_arr[28:25] = s2_output;
assign sub_arr[24:21] = s3_output;
assign sub_arr[20:17] = s4_output;
assign sub_arr[16:13] = s5_output;
assign sub_arr[12:9] = s6_output;
assign sub_arr[8:5] = s7_output;
assign sub_arr[4:1] = s8_output;
*/
//this is the final permutation of the f block
assign f_block_output[1] = sub_arr[16];
assign f_block_output[2] = sub_arr[7];
assign f_block_output[3] = sub_arr[20];
assign f_block_output[4] = sub_arr[21];
assign f_block_output[5] = sub_arr[29];
assign f_block_output[6] = sub_arr[12];
assign f_block_output[7] = sub_arr[28];
assign f_block_output[8] = sub_arr[17];
assign f_block_output[9] = sub_arr[1];
assign f_block_output[10] = sub_arr[15];
assign f_block_output[11] = sub_arr[23];
assign f_block_output[12] = sub_arr[26];
assign f_block_output[13] = sub_arr[5];
assign f_block_output[14] = sub_arr[18];
assign f_block_output[15] = sub_arr[31];
assign f_block_output[16] = sub_arr[10];
assign f_block_output[17] = sub_arr[2];
assign f_block_output[18] = sub_arr[8];
assign f_block_output[19] = sub_arr[24];
assign f_block_output[20] = sub_arr[14];
assign f_block_output[21] = sub_arr[32];
assign f_block_output[22] = sub_arr[27];
assign f_block_output[23] = sub_arr[3];
assign f_block_output[24] = sub_arr[9];
assign f_block_output[25] = sub_arr[19];
assign f_block_output[26] = sub_arr[13];
assign f_block_output[27] = sub_arr[30];
assign f_block_output[28] = sub_arr[6];
assign f_block_output[29] = sub_arr[22];
assign f_block_output[30] = sub_arr[11];
assign f_block_output[31] = sub_arr[4];
assign f_block_output[32] = sub_arr[25];

endmodule
n
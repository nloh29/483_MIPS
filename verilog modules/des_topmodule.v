`timescale 1ns / 1ps

module des_topmodule(input [1:64] plaintext,input [1:64] primaryKey,output  [1:64] desOutput);

wire [1:64] IP_output;
wire [1:64] IP_output2;
wire [1:32] thisLeftHalf1,thisRightHalf1,thisLeftHalf2,thisRightHalf2,thisLeftHalf3,thisRightHalf3,thisLeftHalf4,thisRightHalf4,thisLeftHalf5,thisRightHalf5,thisLeftHalf6,thisRightHalf6,thisLeftHalf7,thisRightHalf7,thisLeftHalf8,thisRightHalf8,thisLeftHalf9,thisRightHalf9,thisLeftHalf10,thisRightHalf10,thisLeftHalf11,thisRightHalf11,thisLeftHalf12,thisRightHalf12,thisLeftHalf13,thisRightHalf13,thisLeftHalf14,thisRightHalf14,thisLeftHalf15,thisRightHalf15,thisLeftHalf16,thisRightHalf16;

wire [1:32] leftHalf;
wire [1:32] rightHalf;
wire [1:28] newRightKey1, newLeftKey1,newRightKey2, newLeftKey2,newRightKey3, newLeftKey3,newRightKey4, newLeftKey4,newRightKey5, newLeftKey5,newRightKey6, newLeftKey6,newRightKey7, newLeftKey7,newRightKey8, newLeftKey8,newRightKey9, newLeftKey9,newRightKey10, newLeftKey10,newRightKey11, newLeftKey11,newRightKey12, newLeftKey12,newRightKey13, newLeftKey13,newRightKey14, newLeftKey14,newRightKey15, newLeftKey15,newRightKey16, newLeftKey16;
wire [1:48] key1,key2,key3,key4,key5,key6,key7,key8,key9,key10,key11,key12,key13,key14,key15,key16;
wire [1:32] new_left1,new_left2,new_left3,new_left4,new_left5,new_left6,new_left7,new_left8,new_left9,new_left10,new_left11,new_left12,new_left13,new_left14,new_left15,new_left16;
wire [1:32] new_right1,new_right2,new_right3,new_right4,new_right5,new_right6,new_right7,new_right8,new_right9,new_right10,new_right11,new_right12,new_right13,new_right14,new_right15,new_right16;
wire [1:56] keyIP_output;
wire [1:28]leftKeyHalf;
wire [29:56] rightKeyHalf;




InitialPerm IP(.plaintext(plaintext),.IP_out(IP_output));

assign thisLeftHalf1 = IP_output[1:32];
assign thisRightHalf1 = IP_output[33:64];
//assign thisLeftHalf1 = IP_output[1:32];
//assign thisRightHalf1 = IP_output[33:64];

initialKeyPerm keyIP(.initialKey(primaryKey),.outputKey(keyIP_output));

assign leftKeyHalf = keyIP_output[1:28];
assign rightKeyHalf = keyIP_output[29:56];



/////round 1////
shiftOne s1(.leftHalf(leftKeyHalf),.rightHalf(rightKeyHalf),.newLeft(newLeftKey1),.newright(newRightKey1));
keyPC2 PC1(.leftHalf(newLeftKey1),.rightHalf(newRightKey1),.subKey(key1));
round rnd1(.leftHalf(thisLeftHalf1),.rightHalf(thisRightHalf1),.round_key(key1),.new_left(new_left1),.new_right(new_right1));

////round 2///
shiftOne s2(.leftHalf(newLeftKey1),.rightHalf(newRightKey1),.newLeft(newLeftKey2),.newright(newRightKey2));
keyPC2 PC2(.leftHalf(newLeftKey2),.rightHalf(newRightKey2),.subKey(key2));
assign thisRightHalf2 = new_left1;
assign thisLeftHalf2 = new_right1;
round rnd2(.leftHalf(thisLeftHalf2),.rightHalf(thisRightHalf2),.round_key(key2),.new_left(new_left2),.new_right(new_right2));

///round 3///////////
shiftTwo s3(.leftHalf(newLeftKey2),.rightHalf(newRightKey2),.newLeft(newLeftKey3),.newright(newRightKey3));
keyPC2 PC3(.leftHalf(newLeftKey3),.rightHalf(newRightKey3),.subKey(key3));
assign thisRightHalf3 = new_left2;
assign thisLeftHalf3 = new_right2;
round rnd3(.leftHalf(thisLeftHalf3),.rightHalf(thisRightHalf3),.round_key(key3),.new_left(new_left3),.new_right(new_right3));


///round 4//////
shiftTwo s4(.leftHalf(newLeftKey3),.rightHalf(newRightKey3),.newLeft(newLeftKey4),.newright(newRightKey4));
keyPC2 PC4(.leftHalf(newLeftKey4),.rightHalf(newRightKey4),.subKey(key4));

assign thisRightHalf4 = new_left3;
assign thisLeftHalf4 = new_right3;
round rnd4(.leftHalf(thisLeftHalf4),.rightHalf(thisRightHalf4),.round_key(key4),.new_left(new_left4),.new_right(new_right4));


//round 5//
shiftTwo s5(.leftHalf(newLeftKey4),.rightHalf(newRightKey4),.newLeft(newLeftKey5),.newright(newRightKey5));
keyPC2 PC5(.leftHalf(newLeftKey5),.rightHalf(newRightKey5),.subKey(key5));
assign thisRightHalf5 = new_left4;
assign thisLeftHalf5 = new_right4;
round rnd5(.leftHalf(thisLeftHalf5),.rightHalf(thisRightHalf5),.round_key(key5),.new_left(new_left5),.new_right(new_right5));


//round 6 //
shiftTwo s6(.leftHalf(newLeftKey5),.rightHalf(newRightKey5),.newLeft(newLeftKey6),.newright(newRightKey6));
keyPC2 PC6(.leftHalf(newLeftKey6),.rightHalf(newRightKey6),.subKey(key6));

assign thisRightHalf6 = new_left5;
assign thisLeftHalf6 = new_right5;
round rnd6(.leftHalf(thisLeftHalf6),.rightHalf(thisRightHalf6),.round_key(key6),.new_left(new_left6),.new_right(new_right6));

/////round 7////
shiftTwo s7(.leftHalf(newLeftKey6),.rightHalf(newRightKey6),.newLeft(newLeftKey7),.newright(newRightKey7));
keyPC2 PC7(.leftHalf(newLeftKey7),.rightHalf(newRightKey7),.subKey(key7));
assign thisRightHalf7 = new_left6;
assign thisLeftHalf7 = new_right6;
round rnd7(.leftHalf(thisLeftHalf7),.rightHalf(thisRightHalf7),.round_key(key7),.new_left(new_left7),.new_right(new_right7));


////round 8////
shiftTwo s8(.leftHalf(newLeftKey7),.rightHalf(newRightKey7),.newLeft(newLeftKey8),.newright(newRightKey8));
keyPC2 PC8(.leftHalf(newLeftKey8),.rightHalf(newRightKey8),.subKey(key8));

assign thisRightHalf8 = new_left7;
assign thisLeftHalf8 = new_right7;
round rnd8(.leftHalf(thisLeftHalf8),.rightHalf(thisRightHalf8),.round_key(key8),.new_left(new_left8),.new_right(new_right8));


////round 9////
shiftOne s9(.leftHalf(newLeftKey8),.rightHalf(newRightKey8),.newLeft(newLeftKey9),.newright(newRightKey9));
keyPC2 PC9(.leftHalf(newLeftKey9),.rightHalf(newRightKey9),.subKey(key9));
assign thisRightHalf9 = new_left8;
assign thisLeftHalf9 = new_right8;
round rnd9(.leftHalf(thisLeftHalf9),.rightHalf(thisRightHalf9),.round_key(key9),.new_left(new_left9),.new_right(new_right9));


////round 10////
shiftTwo s10(.leftHalf(newLeftKey9),.rightHalf(newRightKey9),.newLeft(newLeftKey10),.newright(newRightKey10));
keyPC2 PC10(.leftHalf(newLeftKey10),.rightHalf(newRightKey10),.subKey(key10));

assign thisRightHalf10 = new_left9;
assign thisLeftHalf10 = new_right9;
round rnd10(.leftHalf(thisLeftHalf10),.rightHalf(thisRightHalf10),.round_key(key10),.new_left(new_left10),.new_right(new_right10));


////round 11////
shiftTwo s11(.leftHalf(newLeftKey10),.rightHalf(newRightKey10),.newLeft(newLeftKey11),.newright(newRightKey11));
keyPC2 PC11(.leftHalf(newLeftKey11),.rightHalf(newRightKey11),.subKey(key11));

assign thisRightHalf11 = new_left10;
assign thisLeftHalf11 = new_right10;
round rnd11(.leftHalf(thisLeftHalf11),.rightHalf(thisRightHalf11),.round_key(key11),.new_left(new_left11),.new_right(new_right11));


////round 12////
shiftTwo s12(.leftHalf(newLeftKey11),.rightHalf(newRightKey11),.newLeft(newLeftKey12),.newright(newRightKey12));
keyPC2 PC12(.leftHalf(newLeftKey12),.rightHalf(newRightKey12),.subKey(key12));

assign thisRightHalf12 = new_left11;
assign thisLeftHalf12 = new_right11;
round rnd12(.leftHalf(thisLeftHalf12),.rightHalf(thisRightHalf12),.round_key(key12),.new_left(new_left12),.new_right(new_right12));


////round 13////
shiftTwo s13(.leftHalf(newLeftKey12),.rightHalf(newRightKey12),.newLeft(newLeftKey13),.newright(newRightKey13));
keyPC2 PC13(.leftHalf(newLeftKey13),.rightHalf(newRightKey13),.subKey(key13));

assign thisRightHalf13 = new_left12;
assign thisLeftHalf13 = new_right12;
round rnd13(.leftHalf(thisLeftHalf13),.rightHalf(thisRightHalf13),.round_key(key13),.new_left(new_left13),.new_right(new_right13));

////round 14////
shiftTwo s14(.leftHalf(newLeftKey13),.rightHalf(newRightKey13),.newLeft(newLeftKey14),.newright(newRightKey14));
keyPC2 PC14(.leftHalf(newLeftKey14),.rightHalf(newRightKey14),.subKey(key14));
assign thisRightHalf14 = new_left13;
assign thisLeftHalf14 = new_right13;
round rnd14(.leftHalf(thisLeftHalf14),.rightHalf(thisRightHalf14),.round_key(key14),.new_left(new_left14),.new_right(new_right14));

////round 15////
shiftTwo s15(.leftHalf(newLeftKey14),.rightHalf(newRightKey14),.newLeft(newLeftKey15),.newright(newRightKey15));
keyPC2 PC15(.leftHalf(newLeftKey15),.rightHalf(newRightKey15),.subKey(key15));

assign thisRightHalf15 = new_left14;
assign thisLeftHalf15 = new_right14;
round rnd15(.leftHalf(thisLeftHalf15),.rightHalf(thisRightHalf15),.round_key(key15),.new_left(new_left15),.new_right(new_right15));


////round 16////
shiftOne s16(.leftHalf(newLeftKey15),.rightHalf(newRightKey15),.newLeft(newLeftKey16),.newright(newRightKey16));
keyPC2 PC16(.leftHalf(newLeftKey16),.rightHalf(newRightKey16),.subKey(key16));
assign thisRightHalf16 = new_left15;
assign thisLeftHalf16 = new_right15;
round rnd16(.leftHalf(thisLeftHalf16),.rightHalf(thisRightHalf16),.round_key(key16),.new_left(new_left16),.new_right(new_right16));


finalPermutation f1(.leftHalf(new_left16),.rightHalf(new_right16),.finalOutput(desOutput));


endmodule



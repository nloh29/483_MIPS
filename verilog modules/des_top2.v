////top top module for the DES this will connect to the CPU and then we will send the information into the DES module from here

`timescale 1ns / 1ps

module des_top2(input [1:32] data, input [0:2] decision, output reg [1:32] data_out);

reg [1:64] data_reg;
reg [1:64]key_reg;
wire [1:64] des_wire;
reg [1:32] dumb;
initial data_reg = 64'd0;
initial key_reg = 64'd0;

always@(decision or data)
begin
 if(decision == 3'b000)
 begin
	data_reg [1:32]<= data; 
	
 end
 else if(decision == 3'b001)
 begin
	data_reg[33:64] <= data;
	
 end
 else if(decision == 3'b010)
begin
	key_reg [1:32] <= data;
	
end

else if(decision == 3'b011)
begin
	key_reg[33:64] <= data;
	
end
else
begin
	dumb = 0;
end

end //always end

des_topmodule des2(.plaintext(data_reg),.primaryKey(key_reg),.desOutput(des_wire));
always@(decision or des_wire)
begin

if(decision == 3'b000)
 begin
	
	data_out <= des_wire[1:32];
 end
 else if(decision == 3'b001)
 begin
	
	data_out <= des_wire[33:64];
 end
 else if(decision == 3'b010)
begin
	
	data_out <= des_wire[1:32];
end

else if(decision == 3'b011)
begin
	
	data_out <= des_wire[33:64];
end
else
begin
	dumb = 0;
end


end




endmodule

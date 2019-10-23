//I'm including the MUX here for deciding which of
//the modules gets to drive the DATA line back
//to the CPU on a read
module data_read_mux(
    input [31:0] A, B, C, D,E,
    input [4:0] Sel,
    output reg [31:0] Y
);
    always @(Sel or A or B or C or D or E) begin
        case(Sel)
            1: Y <= A; //Rom Sel
            2: Y <= B; //Ram Sel
            4: Y <= C; //Port0 Sel
				8: Y <= D; //SPI Module
				16: Y <= E; 
            default: Y <= 32'h0000_0000;
        endcase
    end

endmodule


//This is the acutal MMU. It controls which device gets control of
//the DATA line back into the processor based on the address.
//The Memory Map of the MIPS SoC Looks like this:
//  0x0000_0000 - 0x0000_7FFF --> ROM for program/constants
//  0x0000_8000 - 0x0000_BFFF --> RAM
//  0x0000_C000 - 0x0000_FFFF --> Registers/HW Modules (Space for hardcoded) addresses
//
//  The inputs from the CPU are the Address and the rdWR (0 for Read, 1 for Write) signal
//  The DATA line is bidirectional, based on the rdWR line. It is the job of the MMU to
//  sort out which part of memory gets or drives data.
//  The MMU will also have clk as in input to the sub modules derived from the master clock.
module mmu(
    input [31:0] ADDR,
    input rdWR,
    input clk,
    inout [31:0] DATA,
    inout [7:0] PORT0_PHYS,
	 input MOSI,
    output MISO,
    input SCK,
    input nCS 
);

//Output Wires From The Modules
wire [31:0] ROM_DATA_OUT, RAM_DATA_OUT, mmu_data_out,des_data_out;
wire [7:0] PORT0_DATA_OUT, SPI_DATA_OUT;
reg [0:2] decision;
//Input wire for DATA
wire [31:0] data_in;
wire [7:0] port0_data_in;
wire [7:0] spi_data_in;

//Wires for picking the modules
wire rom_sel, ram_sel, port0_sel, port0_update, spi_sel;
wire rdWR_RAM, rdWR_PORT0,rdWR_SPI;

//Handles the bidirectionality of the DATA line. 
assign data_in = DATA; //data_in will always have the current value of DATA
assign DATA = (rdWR) ? 32'hZZZZ_ZZZZ : mmu_data_out; //IF the CPU is issuing a write
//rdWR == 1, then it is generating DATA so the DATA line should be high-impedance.
//Otherwise, the CPU is reading, and therefore the MMU will generate the DATA for
//the CPU, which will come from the MUX which, itself, picks the ROM, RAM, or
//other modules as the data source based on the current address

//Assigns for implementing the memory map.
assign rom_sel = ((ADDR >= 32'h0000_0000) & (ADDR < 32'h0000_8000));
assign ram_sel = ((ADDR >= 32'h0000_8000) & (ADDR < 32'h0000_C000));
assign port0_sel = ((ADDR == 32'h0000_C000) | (ADDR == 32'h0000_C004));
assign port0_update = (ADDR == 32'h0000_C004);
assign spi_sel =  ((ADDR == 32'h0000_C100) | (ADDR ==  32'h0000_C104));
assign des_sel = ((ADDR == 32'h0000_C200) | (ADDR == 32'h0000_C204) | (ADDR == 32'h0000_C208) | (ADDR == 32'h0000_C20C));



//MUX for handling which of the modules drives the data back into the CPU
data_read_mux DATA_MUX(
    .A(ROM_DATA_OUT),
    .B(RAM_DATA_OUT),
    .C({24'd0, PORT0_DATA_OUT}),
	 .D({24'd0, SPI_DATA_OUT}),
	 .E({des_data_out}),
    .Sel({des_sel,spi_sel,port0_sel, ram_sel, rom_sel}),
    .Y(mmu_data_out)
);

//ROM Instantiation
mips_rom ROM(
    .address(ADDR), //Address also gets passed through here
    .data(ROM_DATA_OUT) //Data goes to the MUX for selection of address is in range of ROM
);

//RAM Instantiation
// --- WIRES --- //
assign rdWR_RAM = rdWR & ram_sel;
mips_ram RAM(
    .address(ADDR), //Address is just passed through from CPU
    .data_in(data_in), //Get data from CPU
    .rdWR_RAM(rdWR_RAM), // read/Write signal for RAM
    .clk(clk), //Clock, same as CPU, derived from master on board clock
    .data_out(RAM_DATA_OUT) //Data goes to the MUX for selection of address is in range of RAM
);

//PORT0 Instantiation
assign rdWR_PORT0 = rdWR & port0_sel;
gpio_port PORT0(
    .data_in(data_in[7:0]), //Only last 8-bits of data in are valid for an 8-bit port
    .UPDATE(port0_update), //Port0 Update
    .clk(clk), //Input clock, same as CPU and MMU, derived from board
    .rdWR(rdWR_PORT0), //Read/Write signal for PORT
    .data_out(PORT0_DATA_OUT), //Output to the DATA mux for the CPU (Only 8-bits so padded in MMU)
    .PORT(PORT0_PHYS) //Map to the physical port
);


assign rdWR_SPI = rdWR & spi_sel;
mips_spi_module SPI(.spi_data_in(data_in), .rdWR(rdWR_SPI),.clk(clk),.spi_data_out(data_out),.MOSI(MOSI),.MISO(MISO),.SCK(SCK),.nCS(nCS));

always @ (ADDR)
begin
if(ADDR == 32'h0000_C200)
begin
	decision =  3'b000;

end
else if(ADDR == 32'h0000_C204)
begin
	decision = 3'b001;

end 
else if(ADDR == 32'h0000_C208)
begin 
	decision = 3'b010;


end
else if(ADDR == 32'h0000_C20C)
begin 
	decision = 3'b011;

end
else 
begin
decision = 3'b110;

end

end


assign rdWR_DES = rdWR & des_sel;
des_top2 des1(.data(data_in),.decision(decision),.data_out(des_data_out));



endmodule

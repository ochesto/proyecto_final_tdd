`timescale 1ns / 1ps
module top_v(
input
	wire CLK,
	wire RESET,
output 
	wire [31:0]  DataAdr, WriteData,
	wire MemWrite
);
	
	wire [31:0] Instr, ReadData, PC;
	
	//Instancia Controlador ARM
	arm_v ARM( .clk(CLK), .reset(RESET),
				  .Instr(Instr), .ReadData(ReadData),
				  .MemWrite(MemWrite), .PC(PC),
				  .ALUResult(DataAdr), .WriteData(WriteData));
	
	//Instancia de memoria de instrucciones
	ROM_v instrucciones(CLK, RESET, PC, Instr);
	
	//Instancia RAM
	RAM_v RAM(CLK, MemWrite, DataAdr, WriteData, ReadData);
endmodule

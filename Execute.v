`timescale 1ns / 1ps
module EXE(zero,Muxout,Aluout,incadded,ALUSrc,RegDest,aluc,addr1,addr2,Read_out1,Read_out2,signExtended,incinst);
	input ALUSrc,RegDest;
	input [2:0] aluc;
	input [4:0] addr1,addr2;
	input [31:0] Read_out1,Read_out2,signExtended,incinst;
	output reg zero;
	output [4:0] Muxout;
	output [31:0] Aluout,incadded;

wire [31:0] signshifted,Aluin2;
assign signshifted= signExtended<<2;
Adder adder(incadded,incinst,signshifted);
Mux Mux1(Aluin2,Read_out2,signExtended,ALUSrc);
ALU Alu(Aluout,Read_out1,Aluin2,aluc,zero);
5BitMux Mux2(Muxout,addr1,addr2,RegDest);

endmodule
`timescale 1ns / 1ps

module ID(Signextended, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,aluc,Read_out1,
 Read_out2,clk, instruction, write_data );
    input [31:0] instruction, write_data;
    input clk, write_enable;
    output Branch, MemRead ,MemtoReg, MemWrite, ALUSrc;
    output [2:0] aluc;
    output reg [31:0] Read_out1, Read_out2,Signextended;
wire RegDest,RegWrite;
wire [4:0] Muxout;
SignExtender SignExtender( Signextended,instruction[15:0]);
ControlUnit ControlUnit(instruction[31:26], instruction[5:0], RegDest, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc, RegWrite,aluc);
5BitMux Mux(Muxout,instruction[20:16],instruction[15:11],RegDest);
RegisterFile RegFile(Read_out1,Read_out2,clk,RegWrite,write_data,instruction[25:21],instruction[20:16],Muxout);

endmodule

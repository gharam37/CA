`timescale 1ns / 1ps

module ID(Signextended, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,aluc,Read_out1,
 Read_out2,addr1,addr2,clk, instruction, write_data,write_address,write_enable);
    input [31:0] instruction, write_data;
    input clk, write_enable;
    input [4:0] write_address;
    output Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest;
    output [2:0] aluc;
    output reg [31:0] Read_out1, Read_out2,Signextended;
    output [4:0] addr1,addr2;
SignExtender SignExtender( Signextended,instruction[15:0]);
ControlUnit ControlUnit(instruction[31:26], instruction[5:0], RegDest, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc, RegWrite,aluc);

RegisterFile RegFile(Read_out1,Read_out2,clk,write_enable,write_data,instruction[25:21],instruction[20:16],write_address);
assign addr1 = instruction[20:16];
assign addr2 = instruction[15:11];
endmodule

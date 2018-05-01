`timescale 1ns / 1ps

module IDEXERegister(BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut, ALUSrcOut,RegWriteOut,RegDestOut,
alucOut,Read_out1Out, Read_out2Out,SignextendedOut,incinstOut,addr1Out,addr2Out,Branch, MemRead ,MemtoReg, MemWrite,
ALUSrc,RegWrite,RegDest,clk,aluc,Read_out1,Read_out2,Signextended,incinst,addr1,addr2);
    input Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,clk;
    input [2:0] aluc;
    input [31:0] Read_out1, Read_out2,Signextended,incinst; 
	input [4:0] addr1,addr2;
    output reg BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut, ALUSrcOut,RegWriteOut,RegDestOut;
    output reg [2:0] alucOut;
    output reg [31:0] Read_out1Out, Read_out2Out,SignextendedOut,incinstOut;
	output reg [4:0] addr1Out,addr2Out;


always @ (posedge clk)
begin
	BranchOut<=Branch;//mem
	MemReadOut<=MemRead;//mem
	MemWriteOut<=MemWrite;//mem
	MemtoRegOut<=MemtoReg;//wb
	
	RegWriteOut<=RegWrite;//dec
	
	ALUSrcOut<=ALUSrc;//exec
	RegDestOut<=RegDest;//exec
	alucOut<=aluc;//exec
	Read_out1Out<=Read_out1;//exec
	Read_out2Out<=Read_out2;//exec
	SignextendedOut<=Signextended;//exec
	incinstOut<=incinst;//exec
	addr1Out<=addr1;//exec
	addr2Out<=addr2;//exec
end

endmodule
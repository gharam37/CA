`timescale 1ns / 1ps

module cpu();
	
reg clk;
integer i = 0;

wire branchresult,write_enable,Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,
BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,RegWriteIDOut,RegDestIDOut,zeroExeout,
BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,RegWriteEXEOut,zeroEXEOut,MemtoRegWBOut ,
RegWriteWBOut;
wire [2:0] aluc,alucIDOut;
wire [4:0] write_address,addr1,addr2,addr1IDOut,addr2IDOut,Muxout,write_addressEXEOut;
wire [31:0] nextAddress,newAddress,incinst,pcout,inst,instOut, incinstOut,Read_out1IDOut, Read_out2IDOut,
SignextendedIDOut,incinstIDOut,Aluout,incInstadded,aluresultEXEout, Read_out2EXEOut,incinstEXEOut,
write_data,Read_out1, Read_out2,Signextended,aluresultWBout, memdataWBout,dataout;

initial begin
clk = 0;

forever begin
#5 clk = ~clk;
end
end

Mux Mux(nextAddress,newAddress,incinstEXEOut,branchresult);
PCRegister PCRegister(pcout,nextAddress,clk);
IF iF(inst,newAddress,pcout);
IFIDReg IFIDRegister(instOut, incinstOut,newAddress,inst,clk);

ID ID(Signextended, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,aluc,Read_out1,
 Read_out2,addr1,addr2,clk, instOut, write_data,write_address,RegWriteWBOut);
IDEXERegister IDEXERegister(BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,
RegWriteIDOut,RegDestIDOut,alucIDOut,Read_out1IDOut, Read_out2IDOut,SignextendedIDOut,incinstIDOut,
addr1IDOut,addr2IDOut,Branch, MemRead ,MemtoReg, MemWrite,
ALUSrc,RegWrite,RegDest,clk,aluc,Read_out1,Read_out2,Signextended,incinstOut,addr1,addr2);
 
EXE EXE(zeroExeout,Muxout,Aluout,incInstadded,ALUSrcIDOut,RegDestIDOut,alucIDOut,addr1IDOut,addr2IDOut,
Read_out1IDOut,Read_out2IDOut,SignextendedIDOut,incinstIDOut);
EXEMEMRegister EXEMEMRegister(BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,RegWriteEXEOut,
zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut,clk,BranchIDOut, MemReadIDOut,
MemtoRegIDOut, MemWriteIDOut,RegWriteIDOut,zeroExeout,Muxout,Aluout,Read_out2IDOut,incInstadded);
	
MEM MEM(branchresult,dataout,BranchEXEOut,MemReadEXEOut,MemWriteEXEOut,zeroEXEOut,aluresultEXEout,Read_out2EXEOut);
MEMWBRegister MEMWBRegister(MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout,clk,
MemtoRegEXEOut,RegWriteEXEOut,write_addressEXEOut,aluresultEXEout,dataout);
	
 WB wb(write_data,MemtoRegWBOut,aluresultWBout,memdataWBout);
initial begin
		
		for (i = 0; i < 10; i = i + 1) begin
			@(posedge clk);
            $display("cycle %d", i) ;
			$display("next address") ;
            $display("%b", nextAddress);
            $display("pcout") ;
			$display("%b", pcout);
			$display("if/id reg instOut incinstOut");
			$display("%b %b",instOut, incinstOut);
			$display("id/exe BranchIDOut MemReadIDOut MemtoRegIDOut MemWriteIDOut ALUSrcIDOut RegWriteIDOut RegDestIDOut alucIDOut Read_out1IDOut  Read_out2IDOut SignextendedIDOut incinstIDOut addr1IDOut addr2IDOut");
			$display("%b %b %b %b %b %b %b %b %b %b %b %b %b %b",BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,RegWriteIDOut,RegDestIDOut,alucIDOut,Read_out1IDOut, Read_out2IDOut,SignextendedIDOut,incinstIDOut,addr1IDOut,addr2IDOut);
			$display("exe/exe BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut, RegWriteEXEOut,zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut");
			$display("%b %b %b %b %b",MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout);
			$display("%b %b %b %b %b %b %b %b %b %b",BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,
			RegWriteEXEOut,zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut);
			$display("mwm/wb MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout");
			$display("%b %b %b %b %b",MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout);
		end

		$finish;
	end
endmodule
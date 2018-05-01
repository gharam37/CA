module MEM(branchRes,dataout,Branch,MemRead,MemWrite,zero,aluresultin,Read_out2);
	input Branch,MemRead,MemWrite,zero;
	input [31:0] aluresultin,Read_out2;
	output branchRes;
	output [31:0] dataout;

assign branchRes = Branch &zero;

dataMemory dataMemory(Read_out2,aluresultin,MemRead,MemWrite,dataout);

endmodule
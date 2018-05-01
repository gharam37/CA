module WB(result,MemtoReg,aluresultin,memdatain
	input MemtoReg;
	input [31:0] aluresultin, memdatain;
	output [31:0] result;


Mux Mux(result,memdatain,aluresultin,MemtoReg);
endmodule
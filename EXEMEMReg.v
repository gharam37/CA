
module EXEMEMRegister(BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut,RegWriteOut,zeroOut,write_addressOut,aluresultout,
Read_out2Out,incinstOut,clk,Branch, MemRead ,MemtoReg, MemWrite,RegWrite,zero,write_address,aluresultin,Read_out2,
incinst);
	input clk,Branch, MemRead ,MemtoReg, MemWrite,RegWrite,zero;
	input [4:0] write_address;
	input [31:0] aluresultin,Read_out2,incinst;
	output reg BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut,RegWriteOut,zeroOut;
	output reg [4:0] write_addressOut;
	output reg [31:0] aluresultout, Read_out2Out,incinstOut;

always @ (posedge clk) begin
	BranchOut<=Branch;
    MemReadOut<=MemRead;
    MemWriteOut<=MemWrite;
	aluresultout <= aluresultin;
    Read_out2Out<=Read_out2;
    write_addressOut<=write_address;
    zeroOut<=zero;
    incinstOut<=incinst;
    MemtoRegOut<=MemtoReg;
    RegWriteOut<=RegWrite;


end

endmodule
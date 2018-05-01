module MEMWBRegister(MemtoRegOut ,RegWriteOut,Write_addressOut,aluresultout,memdataout,clk,MemtoReg,RegWrite,Write_address,
aluresultin,memdatain);
	input clk,MemtoReg,RegWrite;
	input [4:0] Write_address;
	input [31:0] aluresultin, memdatain;
	output reg MemtoRegOut ,RegWriteOut;
	output reg [4:0] Write_addressOut;
	output reg [31:0] aluresultout, memdataout;

always @ (posedge clk) begin
	MemtoRegOut<=MemtoReg;
    RegWriteOut<=RegWrite;
    Write_addressOut<Write_address;
	aluresultout = aluresultin;
	memdataout = memdatain;
end

endmodule
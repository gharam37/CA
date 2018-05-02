`timescale 1ns / 1ps

module InstrMem(
    input [31:0] Read_Adress,
    output reg [31:0] Data_out
    );
    
    reg [31:0] mem [255:0];
    
    initial begin
    	mem[116] = 'hA1455011;
    	mem[120] = 'h55AC0021;
    	mem[124] = 'h1D110012;
    	mem[128] = 'hA01AD025;
    	mem[132] = 'hB11100AB;
    end

always @ (*)
    begin
     Data_out <= mem[Read_Adress];
    end
endmodule


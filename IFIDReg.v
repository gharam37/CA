`timescale 1ns / 1ps
module IFIDReg(instOut,incinstOut,incinst,instIn,clk);
    input clk;
    input [31:0] instIn,incinst;
    output reg [31:0] instOut,incinstOut;
	reg [31:0] memory;
    
    
    always @ (negedge clk)
    begin
    	instOut = memory;
    end
    always @ (posedge clk)
    begin
        memory = instrIn;
        incinstOut<=incinst;
    end
    
endmodule

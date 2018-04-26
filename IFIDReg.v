`timescale 1ns / 1ps
module IFIDReg(instOut,instIn,clk);
    input clk;
    input [31:0] instIn;
    output reg [31:0] instOut;
	reg [31:0] memory;
    
    
    always @ (negedge clk)
    begin
    	instOut = memory;
    end
    always @ (posedge clk)
    begin
        memory = instrIn;
    end
    
endmodule

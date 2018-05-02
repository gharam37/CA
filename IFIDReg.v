`timescale 1ns / 1ps
module IFIDReg(instOut,incinstOut,incinst,instIn,clk);
    input clk;
    input [31:0] instIn,incinst;
    output reg [31:0] instOut,incinstOut;
    
    always @ (posedge clk)
    begin
        instOut <= instIn;
        incinstOut<=incinst;
    end
    
endmodule

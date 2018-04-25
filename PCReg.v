`timescale 1ns / 1ps

module PCRegister(out,in,clk);
    input clk;
    input [31:0] in;
    output reg [31:0] out;
    initial begin
        addrOut = 32'b00000000000000000000000000000000;
    end

    always @ (posedge clk)
    begin
        out = in;
    end
    
endmodule
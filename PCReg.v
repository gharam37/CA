`timescale 1ns / 1ps

module PCRegister(out,in,clk);
    input clk;
    input [31:0] in;
    output reg [31:0] out;
   initial begin
    out<=116;
    end

    always @ (posedge clk)
    begin
        out <= in;
        $monitor(" %b %b", in,out);
    end
    
endmodule
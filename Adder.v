`timescale 1ns / 1ps
module adder(out,in1,in2);
     input [31:0] in1;
    input [31:0] in2;
    output reg [31:0] out;
    
    always@(in1,in2)
        out <= in1+in2;
    
endmodule
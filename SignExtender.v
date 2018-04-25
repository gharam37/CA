`timescale 1ns / 1ps
module SignExtender(out,in);
    input [15:0] in;
    output reg [31:0] out;
    always @ (in)
    begin
        out <= {{16{in[15]}},in[15:0]};
    end
    
endmodule
`timescale 1ns / 1ps

module IF(inst,newAdress,instAddress);
    input wire [31:0] instAddress;
    output wire [31:0] newAdress;
    output wire [31:0] inst;
    //reg [31:0] count;
    
    //assign count = 32'b00000000000000000000000000000100;
    InstrMem InstrMem(instAddress, inst);
    adder adder(newAdress,instAddress, 32'b00000000000000000000000000000100);
    

endmodule
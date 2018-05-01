`timescale 1ns / 1ps

module IF(inst,newAdressinstAddress);
    input wire [31:0] instAddress;
    output wire [31:0] newAdress;
    output wire [31:0] inst;
    const [31:0] count;
    
    assign count = 32'b00000000000000000000000000000100;
    InstrMem InstrMem(instAddress, inst);
    adder adder(newAdress,instAddress,count);
    

endmodule

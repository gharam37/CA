
module ALU_Test();
reg [31:0] a, b;
reg [2:0] select;
wire [31:0] OUT;
wire zeroflag;
initial begin
a = 1;
b = 1;
select = 0;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
#10 select = 1;
#10 $display ("%d", OUT); $display ("%d", zeroflag);


#10 select = 2;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
#10 select = 3;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
#10 select = 4;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
#10 select = 5;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
#10 select = 6;
#10 $display ("%d", OUT); $display ("%d", zeroflag);
end

ALU aluTest(OUT, a, b, select,zeroflag);
endmodule
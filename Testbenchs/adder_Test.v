module adder_Test();
reg [31:0] a, b;

wire [31:0] OUT;

initial begin
a = 1;
b = 1;

#10 $display ("%d", OUT); 
#10 a=3; b=5;
#10 $display ("%d", OUT); 
#10 a=2;b=2;
#10 $display ("%d", OUT); 

end

adder add(OUT, a, b);
endmodule
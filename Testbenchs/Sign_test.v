
module sign_Test();
reg [15:0] a;
wire [31:0] OUT;

initial begin
a = 1;


#10 $display ("%b", OUT);
#10 a=16;
#10 $display ("%b", OUT);
#10 a=3;
#10 $display ("%b", OUT);

#10 a=2;
#10 $display ("%b", OUT);


end

SignExtender n(OUT, a);
endmodule
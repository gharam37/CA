module Mux_Test();
reg [31:0] a, b;
reg select;
wire [31:0] OUT;

initial begin
a = 1;
b = 12;
select = 0;
#10 $display ("%d", OUT);
#10 select = 1;
#10 $display ("%d", OUT);
#10 a=3;
#10 $display ("%d", OUT);
#10 select = 0;
#10 $display ("%d", OUT);
#10 b=2;
#10 $display ("%d", OUT);
#10 select = 1;
#10 $display ("%d", OUT);

end

FullMux n(OUT, a, b, select);
endmodule
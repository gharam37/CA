
module Mux(out,in1,in2,select);
    input [31:0] in1, in2;
	input select;
	output reg [31:0] out;
    always @(in1,in2,select) begin
      out <= (select == 0) ?  in1 : in2;  
    end

endmodule
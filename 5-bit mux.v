
module 5BitMux(out,in1,in2,select);
    input [4:0] in1, in2;
	input select;
	output reg [31:0] out;
    always @(in1,in2,select) begin
      assign out = (select == 0) ?  in1 : in2;  
    end

endmodule
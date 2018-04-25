`timescale 1ns / 1ps
module ALU(out,in1,in2,control,zero);
input [31:0] in1, in2;
input [3:0] control;
output reg [31:0] out;
output reg zero;
always @ (in1, in2, control)
begin
if (in1 == in2)
zero = 1;
else
zero = 0;
end

always @ (in1,in2,control) begin
	
	case(control)

	4'b0000: begin
		out = in1 + in2;
	end

	4'b0001: begin
		out = in1 - in2;
	end

	4'b0010: begin
		out = in1 & in2;
	end

	4'b0011: begin
		out = in1 | in2;
	end
	4'b0100: begin
		out = in2 << in1;
	end
	4'b0101: begin
		out = in1 >>in2;
	end
	4'b0110: begin
		if(in1 < in2) begin
			out = 32'd1;
		end
		else begin
			out = 32'd0;
		end
	end
	
	default:out=in2;
	
	endcase

end

endmodule
`timescale 1ns / 1ps
module ALU(out,in1,in2,control,zero);
input [31:0] in1, in2;
input [2:0] control;
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

	3'b000: begin
		out <= in1 + in2;
	end

	3'b001: begin
		out <= in1 - in2;
	end

	3'b010: begin
		out <= in1 & in2;
	end

	3'b011: begin
		out <= in1 | in2;
	end
	3'b100: begin
		out <= in1 << in2;
	end
	3'b101: begin
		out <= in1 >>in2;
	end
	3'b110: begin
		if(in1 < in2) begin
			out <= 32'd1;
		end
		else begin
			out <= 32'd0;
		end
	end
	
	default:out<=in1;
	
	endcase

end

endmodule
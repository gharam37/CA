`timescale 1ns / 1ps

module RegisterFile(Read_out1,Read_out2,clk,write_enable,write_data,addres1,addres2,write_address);
    input clk, write_enable;
    input [4:0] addres1, addres2, write_address;
    input [31:0] write_data;
    output reg [31:0] Read_out1, Read_out2;

reg [31:0] regs [31:0];
initial begin
	regs[0] = 32'd0;
	regs[1] = 32'd1;
	regs[2] = 32'd2;
	regs[3] = 32'd3;
	regs[4] = 32'd4;
	regs[5] = 32'd5;
	regs[6] = 32'd6;
	regs[10] = 32'd7;
end
always @ (addres1, addres2)
    begin
        Read_out1 <= (addres1==0)? 32'b0 : regs[addres1];
        Read_out2 <= (addres2==0)? 32'b0 : regs[addres2];
    end
always @ (posedge clk)
	begin
		if (write_enable)
            if (write_address==5'd0)
                begin
                    regs[0]<=0;
                end
            else begin
                regs[write_address] <= write_data;
            end
			
	end

endmodule
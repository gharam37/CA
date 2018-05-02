`timescale 1ns / 1ps

module cpu_tb();
reg clk;
integer i = 0;

initial begin
clk = 0;
forever begin
#5 clk = ~clk;
end
end

initial begin
		
		for (i = 0; i < `10; i = i + 1) begin
			@(posedge clk);
            $display("cycle %d", i) ;
            $monitor("%t %b %b %b", $time, read_data_1, read_data_2, clk);
		end

		$finish;
	end
endmodule
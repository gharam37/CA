`timescale 1ns / 1ps

module dataMemory(
	input [31:0] data_input, Write_adress, Read_adress,
	input Flage_Write,
	output [31:0] data_Out
	);

reg [31:0] memory [255:0];



initial begin
	memory[0] = 'hA01100AB;
	memory[4] = 'h10101011;
	memory[8] = 'h21101122;
	memory[12] = 'h31000033;
	memory[16] = 'h42270044;
	memory[20] = 'h50000055;
	memory[24] = 'h60054856;
	memory[28] = 'h76840077;
	memory[32] = 'h80000088;
	memory[36] = 'h910343BB;
        memory[40] = 'h910111BB;
        memory[44] = 'h9147012B;
        memory[48] = 'h812451BB;
        memory[52] = 'h914501BB;
        memory[56] = 'h921101BB;

end

always @ (data_input or Write_adress or Read_adress or
	or Flage_Write )
	begin


		if (Flage_Write)
                   begin
			
			mem[Write_adress] = data_input;

                   end
              else
                   begin

                       data_Out = memory[Read_adress];
                   end 
			
	end
	
endmodule

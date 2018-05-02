`timescale 1ns / 1ps
module fiveBitMux(out,in1,in2,select);
    input [4:0] in1, in2;
	input select;
	output reg [4:0] out;
    always @(in1,in2,select) begin
      out <= (select == 0) ?  in1 : in2;  
    end

endmodule

module adder(out,in1,in2);
     input [31:0] in1;
    input [31:0] in2;
    output reg [31:0] out;
    
    always@(in1,in2)
        out <= in1+in2;
    
endmodule

module ALU(out,in1,in2,control,zero);
input [31:0] in1, in2;
input [2:0] control;
output reg [31:0] out;
output reg zero=0;
always @ (in1, in2, control)
begin
if (in1 == in2)
zero <= 1;
else
zero <= 0;
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
		3'b111: begin
		out <= in1 ;
	end
	
	endcase

end

endmodule

module ControlUnit(
    input [5:0] opcode, func,
    output reg RegDest, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc, RegWrite,
    output reg [2:0] aluc,
    output reg [1:0] lh
    );

always @ (* ) begin



   // the R-types 
   case(opcode)
   6'b000000: begin 
    // ADD-done
    case(func)
      6'b100000: begin 
         RegDest <=  1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b000;
         lh<=2'b00;
      
        end
   
   // SUB
        6'b100010: begin
       
         RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b001;
         lh<=2'b00;
       
         end 
   
    //SLL 
    
      6'b000000 : begin 
      
       RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b100;
      lh<=2'b00;
      
         end
      
      
     //SRL 
      6'b000010: begin
      
       RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b101;
         lh<=2'b00;
         end 
        
      //AND
      
      6'b100100: begin
       RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b010;
      lh<=2'b00;
        end
      
      //OR
      6'b100101 : begin
      
      lh<=2'b00;
       RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b011;
        end 
      
      
      
      //STL
      
      6'b101010: begin
      lh<=2'b00;
       RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  1;
         aluc<=3'b110;
         end
      
      
   endcase
   end
//BEQ

6'b000100: begin
   lh<=2'b00;
         RegDest <=  0;
         Branch <= 1;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 0;
         RegWrite <=  0;
         aluc<=3'b111;
   
   end


 // ADDi
   6'b001000: begin
   lh<=2'b00;
         RegDest <=  0;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b000;
         
   end
   // LW 
   6'b100011: begin
         RegDest <=  0;
         Branch <= 0;
         MemRead <= 1;
         MemtoReg <= 1;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b111;
         lh<=2'b00;
   end 
    //SW 
   6'b100011: begin
         RegDest <=  0;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 1;
         MemWrite <= 1;
         ALUSrc <= 1;
         RegWrite <=  0;
         aluc<=3'b111;
         lh<=2'b00;
   end
   // LH
   6'b100001: begin
         RegDest <=  0;
         Branch <= 0;
         MemRead <= 1;
         MemtoReg <= 1;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b111;
         lh<=2'b01;
   end
   6'b000001: begin
         RegDest <=  0;
         Branch <= 0;
         MemRead <= 1;
         MemtoReg <= 1;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b111;
         lh<=2'b10;
   end
   
   // ANDi
   6'b001100: begin
        RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b010;
         lh<=2'b00;
   end
   
   // ori
   6'b001101: begin
         RegDest <= 1;
         Branch <= 0;
         MemRead <= 0;
         MemtoReg <= 0;
         MemWrite <= 0;
         ALUSrc <= 1;
         RegWrite <=  1;
         aluc<=3'b011;
         lh<=2'b00;
   end
endcase	

end

endmodule

module dataMemory(
	input [31:0] data_input,address,
	input MemRead,MemWrite,
	output reg [31:0] data_Out,
	input [1:0] lh
	);

reg [31:0] memory [255:0];

reg [31:0] temp;

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

always @ (data_input or address or MemRead or MemWrite )
	begin


		if (MemWrite)
                   begin
		
			memory[address] = data_input;
			

                   end
              else
                   begin
                        if(lh==2'b01)
                        begin
                        temp<=memory[address];
                        data_Out = {{16{temp[15]}},temp[15:0]};
                        end
                        else
                        begin
                        if(lh==2'b10)
                        begin
                        temp<=memory[address];
                        data_Out = {{16{temp[15]}},temp[15:0]};
                        end
                        else
                        begin
                        data_Out = memory[address];
                        end
                        end
                        
                   end 
	
	end
//$display("%b",memory[address]);	
endmodule

module ID(Signextended, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,aluc,Read_out1,
 Read_out2,addr1,addr2,clk, instruction, write_data,write_address,write_enable,lh);
    input [31:0] instruction, write_data;
    input clk, write_enable;
    input [4:0] write_address;
    output wire Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest;
    output  [2:0] aluc;
    output wire [31:0] Read_out1,Read_out2,Signextended;
    output [4:0] addr1,addr2;
    output wire [1:0] lh;
SignExtender SignExtender(Signextended,instruction[15:0]);
ControlUnit ControlUnit(instruction[31:26], instruction[5:0], RegDest, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc, RegWrite,aluc,lh);

RegisterFile RegFile(Read_out1,Read_out2,clk,write_enable,write_data,instruction[25:21],instruction[20:16],write_address);
assign addr1 = instruction[20:16];
assign addr2 = instruction[15:11];
endmodule

module EXE(zeroAluout,Muxout,Aluout,incadded,ALUSrc,RegDest,aluc,addr1,addr2,Read_out1,Read_out2,signExtended,incinst);
	input ALUSrc,RegDest;
	input [2:0] aluc;
	input [4:0] addr1,addr2;
	input [31:0] Read_out1,Read_out2,signExtended,incinst;
	output wire zeroAluout;
	output wire[4:0] Muxout;
	output wire[31:0] Aluout,incadded;

wire [31:0] signshifted,Aluin2;
assign signshifted= signExtended<<2;
adder adder(incadded,incinst,signshifted);
Mux Mux1(Aluin2,Read_out2,signExtended,ALUSrc);
ALU Alu(Aluout,Read_out1,Aluin2,aluc,zeroAluout);
fiveBitMux Mux2(Muxout,addr1,addr2,RegDest);

endmodule

module EXEMEMRegister(BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut,RegWriteOut,zeroOut,write_addressOut,aluresultout,
Read_out2Out,incinstOut,clk,Branch, MemRead ,MemtoReg, MemWrite,RegWrite,zero,write_address,aluresultin,Read_out2,
incinst);
	input clk,Branch, MemRead ,MemtoReg, MemWrite,RegWrite,zero;
	input [4:0] write_address;
	input [31:0] aluresultin,Read_out2,incinst;
	output reg BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut,RegWriteOut,zeroOut;
	output reg [4:0] write_addressOut;
	output reg [31:0] aluresultout, Read_out2Out,incinstOut;

always @ (posedge clk) begin
	BranchOut<=Branch;
    MemReadOut<=MemRead;
    MemWriteOut<=MemWrite;
	aluresultout <= aluresultin;
    Read_out2Out<=Read_out2;
    write_addressOut<=write_address;
    zeroOut<=zero;
    incinstOut<=incinst;
    MemtoRegOut<=MemtoReg;
    RegWriteOut<=RegWrite;


end

endmodule

module IF(inst,newAdress,instAddress);
    input wire [31:0] instAddress;
    output wire [31:0] newAdress;
    output wire [31:0] inst;
    //reg [31:0] count;
    
    //assign count = 32'b00000000000000000000000000000100;
    InstrMem InstrMem(instAddress, inst);
    adder adder(newAdress,instAddress, 32'b00000000000000000000000000000100);
    

endmodule

module IDEXERegister(BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut, ALUSrcOut,RegWriteOut,RegDestOut,
alucOut,Read_out1Out, Read_out2Out,SignextendedOut,incinstOut,addr1Out,addr2Out,Branch, MemRead ,MemtoReg, MemWrite,
ALUSrc,RegWrite,RegDest,clk,aluc,Read_out1,Read_out2,Signextended,incinst,addr1,addr2);
    input Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,clk;
    input [2:0] aluc;
    input [31:0] Read_out1, Read_out2,Signextended,incinst; 
	input [4:0] addr1,addr2;
    output reg BranchOut, MemReadOut ,MemtoRegOut, MemWriteOut, ALUSrcOut,RegWriteOut,RegDestOut;
    output reg [2:0] alucOut;
    output reg [31:0] Read_out1Out, Read_out2Out,SignextendedOut,incinstOut;
	output reg [4:0] addr1Out,addr2Out;


always @ (posedge clk)
begin
	BranchOut<=Branch;//mem
	MemReadOut<=MemRead;//mem
	MemWriteOut<=MemWrite;//mem
	MemtoRegOut<=MemtoReg;//wb
	
	RegWriteOut<=RegWrite;//dec
	
	ALUSrcOut<=ALUSrc;//exec
	RegDestOut<=RegDest;//exec
	alucOut<=aluc;//exec
	Read_out1Out<=Read_out1;//exec
	Read_out2Out<=Read_out2;//exec
	SignextendedOut<=Signextended;//exec
	incinstOut<=incinst;//exec
	addr1Out<=addr1;//exec
	addr2Out<=addr2;//exec
end

endmodule

module IFIDReg(instOut,incinstOut,incinst,instIn,clk);
    input clk;
    input [31:0] instIn,incinst;
    output reg [31:0] instOut,incinstOut;
    
    always @ (posedge clk)
    begin
        instOut <= instIn;
        incinstOut<=incinst;
    end
    
endmodule

module InstrMem(
    input [31:0] Read_Adress,
    output reg [31:0] Data_out
    );
    
    reg [31:0] mem [255:0];
    
    initial begin
        mem[0] = 32'b00110100010000110000000000000011;
    	mem[4] = 32'b00000000010000010001110000000000;
    	mem[8] = 32'b10001100100000110000000000000000;
    	mem[12] = 32'b00000000100000110010000000100010;
    	mem[20] = 32'b00000000100000110010000000000000;
    	mem[24] = 32'b00000000100000110010000000000010;
    	mem[26] = 32'b00000000100000110010000000100100;
    	mem[28] = 32'b00000000100000110010000000100101;
    	mem[32] = 32'b00000000100000110010000000101010;
    	mem[36] = 32'b00010000110001110000000000001011;
    	mem[40] = 32'b00100000010000110000000000000011;
    	mem[44] = 32'b10001100100000110000000000000000;
    	mem[48] = 32'b10000100010000110000000000000000;
    	mem[52] = 32'b00110000010000110000000000000011;
    	mem[48] = 32'b00000100010000110000000000000000;
    	
    end

always @ (*)
    begin
     Data_out <= mem[Read_Adress];
    end
endmodule

module MEM(branchRes,dataout,Branch,MemRead,MemWrite,zero,aluresultin,Read_out2,lh);
	input Branch,MemRead,MemWrite,zero;
	input [31:0] aluresultin,Read_out2;
	input [1:0] lh;
	output branchRes;
	output [31:0] dataout;

assign branchRes = Branch &zero;

dataMemory dataMemory(Read_out2,aluresultin,MemRead,MemWrite,dataout,lh);

endmodule

module MEMWBRegister(MemtoRegOut ,RegWriteOut,Write_addressOut,aluresultout,memdataout,clk,MemtoReg,RegWrite,Write_address,
aluresultin,memdatain);
	input clk,MemtoReg,RegWrite;
	input [4:0] Write_address;
	input [31:0] aluresultin, memdatain;
	output reg MemtoRegOut ,RegWriteOut;
	output reg [4:0] Write_addressOut;
	output reg [31:0] aluresultout, memdataout;

always @ (posedge clk) begin
	MemtoRegOut<=MemtoReg;
    RegWriteOut<=RegWrite;
    Write_addressOut<=Write_address;
	aluresultout = aluresultin;
	memdataout = memdatain;
end

endmodule

module Mux(out,in1,in2,select);
    input [31:0] in1, in2;
	input select;
	output reg [31:0] out;

    always @(in1,in2,select) begin
      out <= (select == 0) ?  in1 : in2; 
      case(select)
      1'b0:out<=in1;
      1'b1:out<=in2;
      default:out<=in1;
      endcase
    end

endmodule




module PCRegister(out,in,clk);
    input clk;
    input [31:0] in;
    output reg [31:0] out;
   initial begin
    out<=0;
    end

    always @ (posedge clk)
    begin
        out <= in;
       // $monitor(" %b %b", in,out);
    end
    
endmodule

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
	regs[7] = 32'd6;
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

module SignExtender(out,in);
    input [15:0] in;
    output reg [31:0] out;
    always @ (in)
    begin
        out <= {{16{in[15]}},in};
    end
    
endmodule

module WB(result,MemtoReg,aluresultin,memdatain);
	input MemtoReg;
	input [31:0] aluresultin, memdatain;
	output [31:0] result;


Mux Mux(result,memdatain,aluresultin,MemtoReg);
endmodule



module cpu();
	
reg clk;
integer i = 0;
wire [1:0] lh;
wire branchresult,write_enable,Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,
BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,RegWriteIDOut,RegDestIDOut,zeroExeout,
BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,RegWriteEXEOut,zeroEXEOut,MemtoRegWBOut ,
RegWriteWBOut;
wire [2:0] aluc,alucIDOut;
wire [4:0] write_address,addr1,addr2,addr1IDOut,addr2IDOut,Muxout,write_addressEXEOut;
wire [31:0] nextAddress,newAddress,incinst,pcout,inst,instOut, incinstOut,Read_out1IDOut, Read_out2IDOut,
SignextendedIDOut,incinstIDOut,Aluout,incInstadded,aluresultEXEout, Read_out2EXEOut,incinstEXEOut,
write_data,Read_out1, Read_out2,Signextended,aluresultWBout, memdataWBout,dataout;

initial begin
clk = 0;

forever begin
#5 clk = ~clk;
end
end

Mux Mux(nextAddress,newAddress,incinstEXEOut,branchresult);
PCRegister PCRegister(pcout,nextAddress,clk);
IF iF(inst,newAddress,pcout);
IFIDReg IFIDRegister(instOut, incinstOut,newAddress,inst,clk);

ID ID(Signextended, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc,RegWrite,RegDest,aluc,Read_out1,
 Read_out2,addr1,addr2,clk, instOut, write_data,write_address,RegWriteWBOut,lh);
IDEXERegister IDEXERegister(BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,
RegWriteIDOut,RegDestIDOut,alucIDOut,Read_out1IDOut, Read_out2IDOut,SignextendedIDOut,incinstIDOut,
addr1IDOut,addr2IDOut,Branch, MemRead ,MemtoReg, MemWrite,
ALUSrc,RegWrite,RegDest,clk,aluc,Read_out1,Read_out2,Signextended,incinstOut,addr1,addr2);
 
EXE EXE(zeroExeout,Muxout,Aluout,incInstadded,ALUSrcIDOut,RegDestIDOut,alucIDOut,addr1IDOut,addr2IDOut,
Read_out1IDOut,Read_out2IDOut,SignextendedIDOut,incinstIDOut);
EXEMEMRegister EXEMEMRegister(BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,RegWriteEXEOut,
zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut,clk,BranchIDOut, MemReadIDOut,
MemtoRegIDOut, MemWriteIDOut,RegWriteIDOut,zeroExeout,Muxout,Aluout,Read_out2IDOut,incInstadded);
	
MEM MEM(branchresult,dataout,BranchEXEOut,MemReadEXEOut,MemWriteEXEOut,zeroEXEOut,aluresultEXEout,Read_out2EXEOut,lh);
MEMWBRegister MEMWBRegister(MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout,clk,
MemtoRegEXEOut,RegWriteEXEOut,write_addressEXEOut,aluresultEXEout,dataout);
	
 WB wb(write_data,MemtoRegWBOut,aluresultWBout,memdataWBout);
initial begin
		
		for (i = 0; i < 20; i = i + 1) begin
			@(posedge clk);
            $display("cycle %d", i) ;
			$display("next address") ;
            $display("%b", nextAddress);
            $display("pcout") ;
			$display("%b", pcout);
			$display("if/id reg instOut incinstOut");
			$display("%b %b",instOut, incinstOut);
			//$display("exe zeroExeout,Muxout,Aluout,incInstadded,ALUSrcIDOut,RegDestIDOut,alucIDOut,addr1IDOut,addr2IDOut,Read_out1IDOut,Read_out2IDOut,SignextendedIDOut,incinstIDOut");
			//$display("%b %b %b %b %b %b %b %b %b %b %b %b %b ",zeroExeout,Muxout,Aluout,incInstadded,ALUSrcIDOut,RegDestIDOut,alucIDOut,addr1IDOut,addr2IDOut,Read_out1IDOut,Read_out2IDOut,SignextendedIDOut,incinstIDOut);
			$display("id/exe BranchIDOut MemReadIDOut MemtoRegIDOut MemWriteIDOut ALUSrcIDOut RegWriteIDOut RegDestIDOut alucIDOut Read_out1IDOut  Read_out2IDOut SignextendedIDOut incinstIDOut addr1IDOut addr2IDOut");
			$display("%b %b %b %b %b %b %b %b %b %b %b %b %b %b",BranchIDOut, MemReadIDOut ,MemtoRegIDOut, MemWriteIDOut, ALUSrcIDOut,RegWriteIDOut,RegDestIDOut,alucIDOut,Read_out1IDOut, Read_out2IDOut,SignextendedIDOut,incinstIDOut,addr1IDOut,addr2IDOut);
			$display("exe/mem BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut, RegWriteEXEOut,zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut");
			$display("%b %b %b %b %b %b %b %b %b %b",BranchEXEOut, MemReadEXEOut ,MemtoRegEXEOut, MemWriteEXEOut,RegWriteEXEOut,zeroEXEOut,write_addressEXEOut,aluresultEXEout,Read_out2EXEOut,incinstEXEOut);
			$display("mwm/wb MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout");
			$display("%b %b %b %b %b",MemtoRegWBOut ,RegWriteWBOut,write_address,aluresultWBout,memdataWBout);
		end

		$finish;
	end
endmodule
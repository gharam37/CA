
module ControlUnit(
    input [5:0] opCode, func,
    output reg RegDest, Branch, MemRead ,MemtoReg, MemWrite, ALUSrc, RegWrite
    output reg [2:0] aluc
    );

always @ (opcode or func ) begin



   // the R-types 
   
   if ( opcode == 6'b000000 ) begin 
    // ADD
      if (func == 6'b100000 ) begin 
         RegDest =  1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b000;
      
        end
   
   // SUB
       if (func == 6'b100010 ) begin
       
         RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b001;
       
         end 
   
    //SLL 
    
      if (func == 6'b000000 ) begin 
      
       RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b100;
      
      
         end
      
      
     //SRL 
      if( func == 6'b000010) begin
      
       RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b101;
         end 
        
      //AND
      
      if(func == 6'b100100) begin
       RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b010;
      
        end
      
      //OR
      if( func == 6'b100101 ) begin
      
      
       RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b011;
        end 
      
      
      
      //STL
      
      if (func == 6'b101010) begin
      
       RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  1;
         aluc=3'b110;
         end
      
      
   end
//BEQ

if( opcode == 6'b000100) begin
   
         RegDest =  0;
         Branch = 1;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 0;
         RegWrite =  0;
   
   end


 // ADDi
   if( opcode == 6'b001000) begin
   
         RegDest =  0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite =  1;
         aluc=3'b000;
         
   end
   // LW 
   if( opcode == 6'b100011) begin
         RegDest =  0;
         Branch = 0;
         MemRead = 1;
         MemtoReg = 1;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite =  1;
   end 
    //SW 
   if( opcode == 6'b100011) begin
         RegDest =  0;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 1;
         MemWrite = 1;
         ALUSrc = 1;
         RegWrite =  0;
   end
   // LH
   if( opcode == 6'b100001) begin
         RegDest =  0;
         Branch = 0;
         MemRead = 1;
         MemtoReg = 1;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite =  1;
   end
   
   
   // ANDi
   if( opcode == 6'b001100) begin
        RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite =  1;
         aluc=3'b010;
   end
   
   // ori
   if( opcode == 6'b001101) begin
         RegDest = 1;
         Branch = 0;
         MemRead = 0;
         MemtoReg = 0;
         MemWrite = 0;
         ALUSrc = 1;
         RegWrite =  1;
         aluc=3'b011;
   end
	

end

endmodule


module P_C (PC_next, PC, rst, clk);
input [31:0] PC_next;
input clk, rst;
output reg [31:0] PC;

always @(posedge clk)
begin 
if (rst == 1'b0)  //if reset is active low
 begin 
 PC <= 32'b00000000; // on reset active low then set the PC = 0 and processor starts from 0 
 end 
 else   //if reset is not active low and it is high like (1) then At every clock cycle, update the PC to whatever PC_next says.
 begin 
   PC <= PC_next;
   end 
end 



endmodule                                               

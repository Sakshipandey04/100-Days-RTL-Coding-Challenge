`timescale 1ns / 1ps

module stack_memory(
    input wire clk, 
    input wire rst,
    input wire push,
    input wire pop, 
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output wire full,
    output wire empty
    );
    
    parameter DEPTH=8;
    parameter WIDTH= 8;
    
    reg[WIDTH-1:0] stack_mem[0:DEPTH-1];
    reg [2:0] sp; //stack pointer
    integer i;
    
    //Full and empty status
    assign full= (sp==DEPTH);
    assign empty= (sp ==0);
    
    always @(posedge clk)begin 
       if(rst)begin
         sp <=0;
         data_out <= 0;
         for(i=0; i < DEPTH; i = i + 1)
             stack_mem[i] <=0;
       end else begin
       //PUSH operation
       if(push && !full)begin
           stack_mem[sp] <= data_in;
           sp <= sp + 1;
       end
       //POP operation
       else if(pop && !empty) begin
            sp <= sp-1;
            data_out <= stack_mem[sp-1];
        end
     end
  end
    
endmodule

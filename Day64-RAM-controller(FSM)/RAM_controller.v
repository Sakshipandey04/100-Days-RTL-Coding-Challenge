`timescale 1ns / 1ps
module RAM_controller(
     input wire clk,
     input wire rst,
     input wire start,
     output reg[7:0] data_out,
     output reg done
    );
    //Memory declaration: 16 x 8 RAM
    reg[7:0] RAM [0:15];
    reg [3:0] addr;
    reg [7:0] data_in;
    reg wr_en;
    
    //FSM state encodng
    localparam
         IDLE = 2'b00,
         WRITE = 2'b01,
         READ = 2'b10,
         DONE= 2'b11;
         
       reg[1:0] state;
       integer i;
       
       //Sequential FSM
       always@(posedge clk or posedge rst)begin 
           if(rst)begin 
              state <= IDLE;
              addr <= 0;
              data_in <= 8'd0;
              data_out <=8'd0;
              wr_en <= 0;
              done <=0;
              for(i=0; i < 16;i= i+1)
                   RAM[i] <= 8'd0;
             end else begin
                case(state)
                   IDLE: begin
                      done <=0;
                      if(start)begin
                         addr <= 0;
                         data_in <= 8'd1;
                         wr_en <=1;
                         state <= WRITE;
                      end
                   end
                   
                   WRITE : begin
                      RAM[addr] <= data_in;
                      addr <= addr + 1;
                      data_in <= data_in + 1;
                      
                      if(addr == 4'd15)begin
                        addr <=0;
                        wr_en <=0;
                        state <= READ;
                      end
                   end
                   
                   READ : begin
                       data_out <= RAM[addr];
                       addr <= addr +1;
                       if(addr == 4'd15)
                         state <= DONE;
                     end
                    DONE: begin
                      done <=1;
                      state <= IDLE;
                    end
                 endcase
              end
           end
           
                      
                          
                 
      
        
endmodule

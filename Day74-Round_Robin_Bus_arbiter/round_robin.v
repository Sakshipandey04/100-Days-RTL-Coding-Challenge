`timescale 1ns / 1ps

module round_robin(
     input wire clk,
     input wire rst, 
     input wire req1,
     input wire req2,
     output reg grant1,
     output reg grant2 
    );
    
    reg last_grant; // 0-> Last grant to P1, 1-> last grant to P2
    
    always@(posedge clk or posedge rst)begin
         if(rst)begin
            grant1 <= 0;
            grant2 <=0;
            last_grant <=0;
         end else begin
            //no requests
          if(!req1 && !req2)begin
             grant1 <=0;
             grant2 <=0;
          end
          //only one request active
          else if(req1 && !req2)begin
             grant1<= 1;
             grant2<=0;
             last_grant=0;
          end
          else if(!req1 && req2)begin
              grant1 <= 0;
              grant2 <=1;
              last_grant <=0;
           end
           //both request -> alternate
           else begin
               if(last_grant ==0)begin
                   grant1 <=0;
                   grant2 <=1;
                end else begin
                   grant1 <= 1;
                   grant2 <=0;
                   last_grant <=0;
                end
             end
          end
       end
              
             
endmodule

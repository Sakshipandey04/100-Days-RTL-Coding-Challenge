`timescale 1ns / 1ps

module stack_memory_tb();
     reg clk, rst;
     reg push, pop;
     reg [7:0] data_in;
     wire [7:0] data_out;
     wire full, empty;
     
     stack_memory dut(
     .clk(clk), .rst(rst),
     .push(push), .pop(pop),
     .data_in(data_in),
     .data_out(data_out),
     .full(full), .empty(empty)
     );
     
     initial clk=0;
     always #5 clk=~clk;
     
     initial begin
        $display("Time | Push Pop | Data_in | Data_out | SP_status");
         $monitor("%4t | %b    %b  |   %0h     |   %0h     | full=%b empty=%b",
                 $time, push, pop, data_in, data_out, full, empty);
         
         rst=1; push=0; pop=0;
          data_in=0;
          #15 rst=0;
          
          //PUSH 5 values
          $display("\n--- Pushing 5 values---");
          repeat (5) begin
              @(negedge clk);
              push=1; pop=0;
              data_in= data_in + 8'h11;
              @(negedge clk);
              push=0;
           end
         #20;
         //POP  3 values
         $display("\n--- Popping 3 values --");
         repeat (3) begin
             @(negedge clk);
             pop=1; push=0;
             @(negedge clk);
             pop=0;
           end
           #20;
        //PUSH Again
        $display("\n--- Filling stack fully---");
        repeat (6) begin
           @(negedge clk);
           push=1; pop=0;
           data_in = data_in + 8'h22;
           @(negedge clk);
           push=0;
        end
        #20;
         //POP all to empty stack
         $display("\n--- Emptying stack completally---");
         repeat (8) begin
            @(negedge clk);
             pop=1; push=0;
             @(negedge clk);
             pop=0;
          end
          #20;
          $display("\n ----Simulation Complete--");
          $finish;
       end
           
              
endmodule

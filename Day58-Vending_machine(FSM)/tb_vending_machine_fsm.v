`timescale 1ns / 1ps

module tb_vending_machine_fsm();
      reg clk, rst;
      reg coin10, coin25;
      reg sel, buy;
      wire dispense;
      wire [7:0] change;
      
      vending_machine_fsm dut(
      .clk(clk), .rst(rst), .coin10(coin10), .coin25(coin25),
       .sel(sel),.buy(buy), .dispense(dispense), .change(change)
       );
      
      initial clk=0;
      always #5 clk=~clk;
      
   
        initial begin
          rst = 1; coin10=0; coin25=0; sel=0; buy=0;
          #20 rst = 0;

   // Insert 25
    @(negedge clk) coin25 = 1;
    @(negedge clk) coin25 = 0;

    // Buy Product A (25 units)
    @(negedge clk) sel = 0; buy = 1;
    @(negedge clk) buy = 0;

    // Insert 25 + 10 + 10 for Product B (40 units)
    @(negedge clk) coin25 = 1;
    @(negedge clk) coin25 = 0;

    @(negedge clk) coin10 = 1;
    @(negedge clk) coin10 = 0;

    @(negedge clk) coin10 = 1;
    @(negedge clk) coin10 = 0;

    // Buy Product B
    @(negedge clk) sel = 1; buy = 1;
    @(negedge clk) buy = 0;

    #50 $finish;
  end

    initial begin
       $monitor("Time=%0t | coin10=%b coin25=%b sel=%b buy=%b | dispense=%b change=%d total unknown(internal)",
       $time, coin10, coin25, sel, buy, dispense, change);
   end         
      
endmodule

`timescale 1ns / 1ps


module round_robin_tb();
    reg clk, rst;
    reg req1, req2;
    wire grant1, grant2;

    round_robin DUT (
        .clk(clk),
        .rst(rst),
        .req1(req1),
        .req2(req2),
        .grant1(grant1),
        .grant2(grant2)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("round_robin.vcd");
        $dumpvars(0, round_robin_tb);

        rst = 1; req1 = 0; req2 = 0;
        #30 rst = 0;

        // Case 1: Only req1 active
        req1 = 1; #20;
        req1 = 0; #10;

        // Case 2: Only req2 active
        req2 = 1; #20;
        req2 = 0; #10;

        // Case 3: Both request continuously — should alternate
        req1 = 1; req2 = 1;
        #100;
        req1 = 0; req2 = 0;

        // Case 4: Random overlapping requests
        #20 req1 = 1; #10 req2 = 1; #30 req1 = 0; #20 req2 = 0;

        #50 $finish;
    end

    initial begin
        $monitor("T=%0t | req1=%b req2=%b | grant1=%b grant2=%b | last_grant toggles fairness",
                 $time, req1, req2, grant1, grant2);
    end
endmodule

`timescale 1ns / 1ps

module tb_FIFO_buffer();
    reg clk;
    reg rst;
    reg push;
    reg pop;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;
    wire [3:0] count; // addr_w+1 = 4 bits to hold up to 8

    // Instantiate DUT
    FIFO_buffer dut (
        .clk(clk),
        .rst(rst),
        .push(push),
        .pop(pop),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty),
        .count(count)
    );
     integer i;
    // Clock: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // init
        rst = 1; push = 0; pop = 0; data_in = 8'h00;
        #20;
        rst = 0;
        #20;

        // 1) Push until full
        $display("\n--- Push until full ---");
        for (i = 1; i <= 9; i = i + 1) begin
            @(negedge clk);
            if (!full) begin
                push = 1;
                data_in = i; // push values 1..8
            end else begin
                push = 1; // attempt push while full (should be ignored)
                data_in = 8'hFF;
            end
            @(negedge clk);
            push = 0;
        end
        #20;

        // 2) Pop 3 elements
        $display("\n--- Pop 3 elements ---");
        for (i = 0; i < 3; i = i + 1) begin
            @(negedge clk);
            pop = 1;
            @(negedge clk);
            pop = 0;
        end
        #20;

        // 3) Push 2 more (should succeed, wrapping)
        $display("\n--- Push 2 more ---");
        for (i = 9; i <= 10; i = i + 1) begin
            @(negedge clk);
            push = 1;
            data_in = i;
            @(negedge clk);
            push = 0;
        end
        #20;

        // 4) Simultaneous push and pop for several cycles
        $display("\n--- Simultaneous push & pop cycles ---");
        for (i = 20; i < 25; i = i + 1) begin
            @(negedge clk);
            push = 1;
            pop  = 1;
            data_in = i;
            @(negedge clk);
            push = 0; pop = 0;
        end
        #20;

        // 5) Drain FIFO completely
        $display("\n--- Drain FIFO completely ---");
        while (!empty) begin
            @(negedge clk);
            pop = 1;
            @(negedge clk);
            pop = 0;
        end
        #40;

        $display("\n--- Test complete ---");
        $finish;
    end

    // Monitor
    initial begin
        $display("Time | push pop | data_in | data_out | count full empty");
        $monitor("%4t |   %b   %b  |   %0h   |   %0h    |  %0d    %b    %b",
                 $time, push, pop, data_in, data_out, count, full, empty);
    end



endmodule

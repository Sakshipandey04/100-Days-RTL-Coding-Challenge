`timescale 1ns / 1ps

module tb_circular_buffer();
   
    reg clk;
    reg rst;
    reg write_en;
    reg read_en;
    reg [7:0] data_in;
    wire [7:0] data_out;
    wire full;
    wire empty;
    wire [3:0] count; // ADDR_W+1 = 4 bits

    // Instantiate DUT
    circular_buffer dut (
        .clk(clk),
        .rst(rst),
        .write_en(write_en),
        .read_en(read_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty),
        .count(count)
    );
     
     integer i;
    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns period

    initial begin
        rst = 1; write_en = 0; read_en = 0; data_in = 8'h00;
        #20 rst = 0;
        #20;

        // 1) Fill buffer
        $display("\n--- Filling buffer ---");
        for (i = 1; i <= 9; i = i + 1) begin
            @(negedge clk);
            if (!full) begin
                write_en = 1;
                data_in = i;
            end else begin
                write_en = 1; // test overflow ignored
                data_in = 8'hFF;
            end
            @(negedge clk);
            write_en = 0;
        end
        #20;

        // 2) Pop 3 elements
        $display("\n--- Pop 3 elements ---");
        for (i = 0; i < 3; i = i + 1) begin
            @(negedge clk);
            read_en = 1;
            @(negedge clk);
            read_en = 0;
        end
        #20;

        // 3) Push 2 more (test wrap-around)
        $display("\n--- Push 2 more ---");
        for ( i = 9; i <= 10; i = i + 1) begin
            @(negedge clk);
            write_en = 1;
            data_in = i;
            @(negedge clk);
            write_en = 0;
        end
        #20;

        // 4) Simultaneous push and pop
        $display("\n--- Simultaneous push & pop ---");
        for ( i = 20; i < 25; i = i + 1) begin
            @(negedge clk);
            write_en = 1;
            read_en  = 1;
            data_in = i;
            @(negedge clk);
            write_en = 0;
            read_en  = 0;
        end
        #20;

        // 5) Drain buffer completely
        $display("\n--- Drain buffer ---");
        while (!empty) begin
            @(negedge clk);
            read_en = 1;
            @(negedge clk);
            read_en = 0;
        end

        $display("\n--- Test complete ---");
        $finish;
    end

    // Monitor
    initial begin
        $display("Time | W R | data_in | data_out | count full empty");
        $monitor("%4t | %b %b |   %0h    |   %0h     |  %0d    %b    %b",
                 $time, write_en, read_en, data_in, data_out, count, full, empty);
    end


endmodule

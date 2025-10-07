`timescale 1ns / 1ps

module tb_register_file();
    reg clk;
    reg rst;
    reg we;
    reg [2:0] waddr, raddr1, raddr2;
    reg [7:0] wdata;
    wire [7:0] rdata1, rdata2;

    // Instantiate DUT
    register_file dut (
        .clk(clk),
        .rst(rst),
        .we(we),
        .waddr(waddr),
        .raddr1(raddr1),
        .raddr2(raddr2),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );
    
    integer i;
    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;
     
    initial begin
        // Initialize
        rst = 1; we = 0; waddr = 0; raddr1 = 0; raddr2 = 0; wdata = 0;
        #20 rst = 0;

        // 1) Write values to registers 0-7
        $display("\n--- Writing values to registers ---");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            we = 1;
            waddr = i;
            wdata = i + 10;  // arbitrary data
            @(negedge clk);
            we = 0;
        end
        #20;

        // 2) Read values from registers using both read ports
        $display("\n--- Reading registers ---");
        for (i = 0; i < 8; i = i + 1) begin
            @(negedge clk);
            raddr1 = i;
            raddr2 = 7 - i;  // read from reverse address
            @(negedge clk);
        end
        #20;

        // 3) Test write-enable off (no change)
        $display("\n--- Testing write enable off ---");
        @(negedge clk);
        we = 0;
        waddr = 0;
        wdata = 8'hFF;
        raddr1 = 0;
        @(negedge clk);

        $display("\n--- Test complete ---");
        $finish;
    end

    // Monitor signals
    initial begin
        $display("Time | we waddr wdata | raddr1 rdata1 | raddr2 rdata2");
        $monitor("%4t | %b   %0d   %0h  |   %0d   %0h   |   %0d   %0h",
                 $time, we, waddr, wdata, raddr1, rdata1, raddr2, rdata2);
    end


endmodule

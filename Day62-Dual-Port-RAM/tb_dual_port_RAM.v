`timescale 1ns / 1ps

module tb_dual_port_RAM();
    reg clk;
    reg rst;
    reg wr_en_a;
    reg [3:0] addr_a;
    reg [7:0] data_in_a;
    reg rd_en_b;
    reg [3:0] addr_b;
    wire [7:0] data_out_b;

    // Instantiate the dual-port RAM
    dual_port_RAM dut(
        .clk(clk),
        .rst(rst),
        .wr_en_a(wr_en_a),
        .addr_a(addr_a),
        .data_in_a(data_in_a),
        .rd_en_b(rd_en_b),
        .addr_b(addr_b),
        .data_out_b(data_out_b)
    );
    integer i;
    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; wr_en_a = 0; rd_en_b = 0; addr_a = 0; addr_b = 0; data_in_a = 0;
        #15;
        rst = 0;

        // Write data to memory using Port A
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge clk);
            wr_en_a = 1;
            addr_a = i;
            data_in_a = i * 3; // Example data
            rd_en_b = 1;       // Simultaneously read from Port B
            addr_b = i;
            @(negedge clk);
            wr_en_a = 0;
            rd_en_b = 0;
        end

        // Read back memory using Port B
        for ( i = 0; i < 16; i = i + 1) begin
            @(negedge clk);
            rd_en_b = 1;
            addr_b = i;
            @(negedge clk);
            rd_en_b = 0;
        end

        #50 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | wr_en_a=%b addr_a=%d data_in_a=%d | rd_en_b=%b addr_b=%d data_out_b=%d",
                 $time, wr_en_a, addr_a, data_in_a, rd_en_b, addr_b, data_out_b);
    end

endmodule



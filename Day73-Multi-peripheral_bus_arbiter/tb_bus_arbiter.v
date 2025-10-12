`timescale 1ns/1ps
module tb_bus_arbiter;

    reg clk, rst;
    reg req1, req2, wr_en, rd_en;
    reg [1:0] addr;
    reg [3:0] wdata;
    wire grant1, grant2;
    wire [3:0] rdata1, rdata2;

    bus_arbiter DUT_ARB (.clk(clk), .rst(rst), .req1(req1), .req2(req2), .grant1(grant1), .grant2(grant2));

    peripheral P1 (.clk(clk), .rst(rst), .wr_en(grant1 & wr_en), .rd_en(grant1 & rd_en),
                   .addr(addr), .wdata(wdata), .rdata(rdata1));

    peripheral P2 (.clk(clk), .rst(rst), .wr_en(grant2 & wr_en), .rd_en(grant2 & rd_en),
                   .addr(addr), .wdata(wdata), .rdata(rdata2));

    // Clock
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("bus.vcd"); $dumpvars(0, tb_bus_arbiter);

        // Reset
        rst = 1; req1 = 0; req2 = 0; wr_en = 0; rd_en = 0; addr = 0; wdata = 0;
        #50 rst = 0; // ✅ longer reset

        // ---------- Peripheral 1 write ----------
        req1 = 1; #10; // wait for grant
        wr_en = 1; addr = 2'b00; wdata = 4'b1010;
        #10 wr_en = 0;
        #10 req1 = 0;
        #20;

        // ---------- Peripheral 2 write ----------
        req2 = 1; #10;
        wr_en = 1; addr = 2'b01; wdata = 4'b1100;
        #10 wr_en = 0;
        #10 req2 = 0;
        #20;

        // ---------- Both request (priority to P1) ----------
        req1 = 1; req2 = 1; #10;
        wr_en = 1; addr = 2'b10; wdata = 4'b1111;
        #10 wr_en = 0;
        #10 req1 = 0; req2 = 0;
        #20;

        // ---------- Read from P1 ----------
        req1 = 1; #10;
        rd_en = 1; addr = 2'b10;
        #10 rd_en = 0;
        #10 req1 = 0;
        #20;

        // ---------- Read from P2 ----------
        req2 = 1; #10;
        rd_en = 1; addr = 2'b01;
        #10 rd_en = 0;
        #10 req2 = 0;
        #20;

        $finish;
    end

    initial begin
        $monitor("T=%0t | grant1=%b grant2=%b | rdata1=%b rdata2=%b",
                  $time, grant1, grant2, rdata1, rdata2);
    end
endmodule

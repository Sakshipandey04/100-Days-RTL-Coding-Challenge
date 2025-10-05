`timescale 1ns / 1ps

module dual_port_RAM(
    input wire clk,
    input wire rst,
    // Port A - Write
    input wire wr_en_a,
    input wire [3:0] addr_a,
    input wire [7:0] data_in_a,
    // Port B - Read
    input wire rd_en_b,
    input wire [3:0] addr_b,
    output reg [7:0] data_out_b
);

    // Memory array: 16 × 8-bit
    reg [7:0] mem [0:15];
    integer i;

    // Synchronous write and read
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 16; i = i + 1)
                mem[i] <= 8'd0;
            data_out_b <= 8'd0;
        end else begin
            // Write operation
            if (wr_en_a)
                mem[addr_a] <= data_in_a;

            // Read operation
            if (rd_en_b)
                data_out_b <= mem[addr_b];
        end
    end

endmodule

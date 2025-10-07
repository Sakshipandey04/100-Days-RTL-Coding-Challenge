`timescale 1ns / 1ps

module circular_buffer #(

    parameter DATA_W = 8,
    parameter DEPTH  = 8,
    parameter ADDR_W = 3   // log2(DEPTH) = 3 for 8 entries
)(
    input  wire                 clk,
    input  wire                 rst,        // synchronous active-high reset
    input  wire                 write_en,   // push / enqueue
    input  wire                 read_en,    // pop / dequeue
    input  wire [DATA_W-1:0]    data_in,
    output reg  [DATA_W-1:0]    data_out,
    output wire                 full,
    output wire                 empty,
    output wire [ADDR_W:0]      count
);

    // Memory array
    reg [DATA_W-1:0] mem [0:DEPTH-1];

    // Pointers
    reg [ADDR_W-1:0] wr_ptr;
    reg [ADDR_W-1:0] rd_ptr;
    reg [ADDR_W:0]   cnt; // extra bit to track full/empty

    integer i;

    // Flags
    assign empty = (cnt == 0);
    assign full  = (cnt == DEPTH);
    assign count = cnt;

    // Synchronous operations
    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            cnt    <= 0;
            data_out <= {DATA_W{1'b0}};
            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= {DATA_W{1'b0}};
        end else begin
            // Write operation
            if (write_en && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= (wr_ptr + 1'b1) % DEPTH;
            end

            // Read operation
            if (read_en && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= (rd_ptr + 1'b1) % DEPTH;
            end

            // Count update
            if (write_en && !full && !(read_en && !empty)) begin
                cnt <= cnt + 1'b1;
            end else if (read_en && !empty && !(write_en && !full)) begin
                cnt <= cnt - 1'b1;
            end
            // if both read & write and legal, cnt unchanged
        end
    end

endmodule

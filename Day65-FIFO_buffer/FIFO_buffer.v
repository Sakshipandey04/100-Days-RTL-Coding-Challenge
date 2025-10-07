`timescale 1ns / 1ps

module FIFO_buffer #(
    parameter DATA_W = 8,
    parameter DEPTH  = 8,
    parameter ADDR_W = 3   // log2(DEPTH) => 3 for 8 entries
)(
    input  wire                   clk,
    input  wire                   rst,      // synchronous active-high reset
    input  wire                   push,     // enqueue request
    input  wire                   pop,      // dequeue request
    input  wire [DATA_W-1:0]      data_in,
    output reg  [DATA_W-1:0]      data_out, // registered output on read
    output wire                   full,
    output wire                   empty,
    output wire [ADDR_W:0]        count     // optional: number of stored elements
);

    // Memory array
    reg [DATA_W-1:0] mem [0:DEPTH-1];

    // Pointers and counter
    reg [ADDR_W-1:0] wr_ptr;
    reg [ADDR_W-1:0] rd_ptr;
    reg [ADDR_W:0]   cnt; // need one extra bit to represent DEPTH

    integer i;

    // Combinational flags
    assign empty = (cnt == 0);
    assign full  = (cnt == DEPTH);
    assign count = cnt;

    // Synchronous logic: push/pop on posedge clk (synchronous reset)
    always @(posedge clk) begin
        if (rst) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            cnt    <= 0;
            data_out <= {DATA_W{1'b0}};
            // optional: clear memory (not strictly required)
            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= {DATA_W{1'b0}};
        end else begin
            // Default: no pointer change unless push/pop conditions apply

            // Write if push requested and FIFO not full
            if (push && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1'b1;
            end

            // Read if pop requested and FIFO not empty
            // We'll present data_out registered (comes available next cycle),
            // but to keep it simple and deterministic, update data_out here with mem[rd_ptr]
            // when pop is asserted and not empty.
            if (pop && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1;
            end

            // Update count:
            // Cases:
            // - push && !pop : cnt + 1
            // - pop && !push : cnt - 1
            // - push && pop : cnt unchanged (simultaneous op)
            if (push && !full && !(pop && !empty)) begin
                // push only
                cnt <= cnt + 1'b1;
            end else if (pop && !empty && !(push && !full)) begin
                // pop only
                cnt <= cnt - 1'b1;
            end
            // if both push and pop and both legal, cnt unchanged
        end
    end


    
    
endmodule

`timescale 1ns / 1ps


module ROM_module(
    input clk,
    input rst,
    input start,
    output reg [7:0] instr_out,
    output reg done
);

    // --- ROM Declaration (16 x 8-bit) ---
    reg [7:0] rom [0:15];
    reg [3:0] pc;        // Program Counter
    reg [1:0] state;

    // --- FSM States ---
    localparam IDLE  = 2'b00;
    localparam FETCH = 2'b01;
    localparam DONE  = 2'b10;

    // --- Initialize ROM Content ---
    initial begin
        rom[0]  = 8'hA1;
        rom[1]  = 8'hB2;
        rom[2]  = 8'hC3;
        rom[3]  = 8'hD4;
        rom[4]  = 8'hE5;
        rom[5]  = 8'hF6;
        rom[6]  = 8'h12;
        rom[7]  = 8'h34;
        rom[8]  = 8'h56;
        rom[9]  = 8'h78;
        rom[10] = 8'h9A;
        rom[11] = 8'hBC;
        rom[12] = 8'hDE;
        rom[13] = 8'hEF;
        rom[14] = 8'hF1;
        rom[15] = 8'h00;
    end

    // --- FSM Sequential Logic ---
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            pc <= 0;
            instr_out <= 8'b0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) state <= FETCH;
                end

                FETCH: begin
                    instr_out <= rom[pc];
                    pc <= pc + 1;
                    if (pc == 15) state <= DONE;
                end

                DONE: begin
                    done <= 1;
                    state <= IDLE;
                    pc <= 0;
                end
            endcase
        end
    end


    
endmodule

`timescale 1ns / 1ps

module tb_mini_datapath();
    reg [7:0] reg_data, immediate_data, alu_in_a;
    reg [2:0] alu_sel;
    reg mux_sel;
    wire [7:0] result;
    wire carry_out;

    mini_datapath #(8) UUT (
        .reg_data(reg_data),
        .immediate_data(immediate_data),
        .alu_sel(alu_sel),
        .mux_sel(mux_sel),
        .alu_in_a(alu_in_a),
        .result(result),
        .carry_out(carry_out)
    );

    initial begin
        reg_data = 8'h0F; immediate_data = 8'h03; alu_in_a = 8'h05;

        // Test Addition with reg_data
        mux_sel = 0; alu_sel = 3'b000; #10;

        // Test Addition with immediate_data
        mux_sel = 1; alu_sel = 3'b000; #10;

        // Test AND with reg_data
        mux_sel = 0; alu_sel = 3'b010; #10;

        // Test OR with immediate_data
        mux_sel = 1; alu_sel = 3'b011; #10;

        $finish;
    end
endmodule


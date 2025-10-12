`timescale 1ns / 1ps

module tb_cpu_datapath();
    reg clk, rst, write_en, mux_sel;
    reg [7:0] immediate_data;
    reg [2:0] alu_sel;
    reg [2:0] write_addr, read_addr1, read_addr2;
    wire [7:0] alu_result;
    wire carry_out;

    cpu_datapath #(8,8) UUT (
        .clk(clk), .rst(rst),
        .write_en(write_en),
        .write_addr(write_addr),
        .immediate_data(immediate_data),
        .alu_sel(alu_sel),
        .mux_sel(mux_sel),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .alu_result(alu_result),
        .carry_out(carry_out)
    );

    initial begin
        clk = 0; rst = 1; write_en = 0;
        #10 rst = 0;

        // Write initial values to registers
        read_addr1 = 3'd0; read_addr2 = 3'd1;
        immediate_data = 8'h05; mux_sel = 1; alu_sel = 3'b000; write_addr = 3'd2; write_en = 1; #10;
        write_en = 0;

        // Perform ADD: reg0 + reg1
        read_addr1 = 3'd0; read_addr2 = 3'd1; mux_sel = 0; alu_sel = 3'b000; #10;
        $display("ADD Result: %h, Carry: %b", alu_result, carry_out);

        // Perform ADD with immediate
        mux_sel = 1; immediate_data = 8'h03; alu_sel = 3'b000; #10;
        $display("ADD with Immediate: %h, Carry: %b", alu_result, carry_out);

        // AND operation
        mux_sel = 0; alu_sel = 3'b010; #10;
        $display("AND Result: %h", alu_result);

        // OR operation
        mux_sel = 1; immediate_data = 8'h0F; alu_sel = 3'b011; #10;
        $display("OR Result: %h", alu_result);

        $finish;
    end

    always #5 clk = ~clk; // clock generator
endmodule


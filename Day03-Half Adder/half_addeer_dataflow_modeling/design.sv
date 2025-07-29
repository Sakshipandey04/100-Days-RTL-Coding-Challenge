module half_adder_dataflow(
    input wire a, b,
    output wire sum, carry
);
    // Using continuous assignment
    assign sum   = a ^ b;
    assign carry = a & b;
endmodule

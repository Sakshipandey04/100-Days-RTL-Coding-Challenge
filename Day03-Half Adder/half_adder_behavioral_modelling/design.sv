module half_adder_behavioral(
    input wire a, b,
    output reg sum, carry
);
    // Describing behavior with procedural logic
    always @(a or b) begin
        sum   = a ^ b;
        carry = a & b;
    end
endmodule

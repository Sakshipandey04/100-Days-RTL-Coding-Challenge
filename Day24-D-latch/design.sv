module d_latch(
    input D,      // Data input
    input EN,     // Enable
    output reg Q, // Output
    output Qbar   // Complement of Q
);

    always@(D or EN) begin
        if (EN) 
            Q = D;   // When enabled, output follows D
        // else Q holds its previous value
    end

    assign Qbar = ~Q;  // Complement output

endmodule

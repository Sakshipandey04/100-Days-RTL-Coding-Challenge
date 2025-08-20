module sr_latch (
    input S, R,
    output reg Q, Qbar
);
    initial begin
        Q = 0;       // start in reset state
        Qbar = 1;
    end

    always @(*) begin
        if (S == 1 && R == 0) begin
            Q = 1;
            Qbar = 0;
        end
        else if (S == 0 && R == 1) begin
            Q = 0;
            Qbar = 1;
        end
        else if (S == 0 && R == 0) begin
            // Hold state
            Q = Q;
            Qbar = Qbar;
        end
        else begin
            Q = 1'bx;
            Qbar = 1'bx;
        end
    end
endmodule

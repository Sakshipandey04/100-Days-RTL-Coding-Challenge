module tb_d_latch();

    reg D, EN;
    wire Q, Qbar;

    // Instantiate the D latch
    d_latch uut (
        .D(D),
        .EN(EN),
        .Q(Q),
        .Qbar(Qbar)
    );

    initial begin
        // Monitor values
        $monitor("Time=%0t | EN=%b D=%b | Q=%b Qbar=%b", $time, EN, D, Q, Qbar);
      $dumpfile("d_latch.vcd");
      $dumpvars(0, tb_d_latch);
        // Initial values
        D = 0; EN = 0;

        #10 D = 1; EN = 1; // Enable=1, Q should follow D=1
        #10 D = 0; EN = 1; // Enable=1, Q should follow D=0
        #10 D = 1; EN = 0; // Enable=0, Q should HOLD last value
        #10 D = 0; EN = 0; // Still hold
        #10 D = 1; EN = 1; // Enable=1, Q updates again

        #10 $finish;
    end

endmodule

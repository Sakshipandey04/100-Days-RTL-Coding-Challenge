module tb_half_adder_structural;
    reg a, b;
    wire sum, carry;

    half_adder_structural uut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
      $dumpfile("dump_structural.vcd");
      $dumpvars(0, tb_half_adder_structural);
        $monitor("a=%b b=%b | sum=%b carry=%b", a, b, sum, carry);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule

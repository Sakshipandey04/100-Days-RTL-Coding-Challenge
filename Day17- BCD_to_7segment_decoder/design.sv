
// Output bits: seg[6:0] = {a,b,c,d,e,f,g} (active HIGH for common-cathode)

module bcd_to_7seg (
    input  [3:0] bcd,      // 0..9 valid BCD
    output reg [6:0] seg   // {a,b,c,d,e,f,g}
);

always @(*) begin
    case (bcd)
        4'd0: seg = 7'b1111110; // 0 -> a b c d e f
        4'd1: seg = 7'b0110000; // 1 -> b c
        4'd2: seg = 7'b1101101; // 2 -> a b g e d
        4'd3: seg = 7'b1111001; // 3 -> a b c d g
        4'd4: seg = 7'b0110011; // 4 -> f g b c
        4'd5: seg = 7'b1011011; // 5 -> a f g c d
        4'd6: seg = 7'b1011111; // 6 -> a f e d c g
        4'd7: seg = 7'b1110000; // 7 -> a b c
        4'd8: seg = 7'b1111111; // 8 -> all segments
        4'd9: seg = 7'b1111011; // 9 -> a b c d f g
        default: seg = 7'b0000000; // blank for invalid BCD (10..15)
    endcase
end

endmodule



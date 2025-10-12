module bus_arbiter(
    input  wire clk,
    input  wire rst,
    input  wire req1,
    input  wire req2,
    output reg  grant1,
    output reg  grant2
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            grant1 <= 0;
            grant2 <= 0;
        end else begin
            if (req1) begin
                grant1 <= 1;
                grant2 <= 0;
            end else if (req2) begin
                grant1 <= 0;
                grant2 <= 1;
            end else begin
                grant1 <= 0;
                grant2 <= 0;
            end
        end
    end
endmodule

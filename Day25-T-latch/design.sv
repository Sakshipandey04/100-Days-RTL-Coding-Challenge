module t_latch(
  input T, clk,
  output reg Q
);
  always@(clk or T) begin
    if(clk)begin
      if(T)
        Q= ~Q;
      else
        Q=Q;
    end
  end
endmodule
      

module comparator_behave(
  input [1:0] A,
  input [1:0] B,
  output reg gt,
  output reg lt,
  output reg et
); 
  always@(A, B) begin
    if(A>B)begin
      gt=1;
      lt=0;
      et=0;
    end
      else if(A<B)begin
        gt=0;
        lt=1;
        et=0;
      end
     else begin
       gt=0;
       lt=0;
       et=1;
     end
  end
endmodule
    
      

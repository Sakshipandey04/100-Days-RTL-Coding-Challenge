module cla_4bit(
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout
);
  
  reg [3:0] P, G;
  reg[4:0] C;
  always@(*)begin
    P= A ^ B;
    G= A * B;
    
    C[0] = Cin;
    C[1]= G[0] | (P[0] & C[0]);
    C[2]= G[1] | (P[1] & C[1]);
    C[3]= G[2] | (P[2] & C[2]);
    C[4]= G[3] | (P[3] & C[3]);
    
    Sum[0]= P[0] ^ C[0];
    Sum[1]= P[1] ^ C[1];
    Sum[2]= P[2] ^ C[2];
    Sum[3]= P[3] ^ C[3];
    
    Cout= C[4];
  end
endmodule
    

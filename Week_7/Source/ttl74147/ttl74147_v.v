module ttl74147_v (
  input [9:1] An,
  output [3:0] Zn
  );

  /*
  TTL74147 TTL74147(
    .An(An),
    .Zn(Zn)
    );
  */


  wire [9:1] Ak;
  wire [9:1] A;
  assign Ak= ~An;
  assign A = ~Ak;
  //wire [3:0] Znn;
  //assign Zn = ~Znn;
  wire w_and_1;
  wire w_and_2;
  wire w_and_3;
  wire w_and_4;
  wire w_and_5;
  wire w_and_6;
  wire w_and_7;
  wire w_and_8;
  wire w_and_9;
  wire w_and_10;
  wire w_and_11;
  wire w_and_12;
  wire w_or_1;
  nor(w_or_1, ~A[8], ~A[9]);
  and(w_and_1, ~A[2], A[4], A[5], w_or_1);
  and(w_and_2, A[5], ~A[3], A[4], w_or_1);
  and(w_and_3, ~A[6], w_or_1);
  and(w_and_4, ~A[1] , ~A[1], A[2] , A[4] , A[6] , w_or_1);
  //
  and(w_and_5, ~A[3] , A[4] , A[6] , w_or_1);
  and(w_and_6, ~A[5] , A[6] ,w_or_1);
  and(w_and_7, ~A[4] , w_or_1);
  and(w_and_8, ~A[5] , w_or_1);
  and(w_and_9, ~A[6] , w_or_1);
  and(w_and_10, ~A[7] , w_or_1);
  and(w_and_11, ~A[7] , w_or_1);
  and(w_and_12, ~A[7] , w_or_1);
  nor(Zn[0], w_and_4,w_and_4,w_and_5,w_and_6,w_and_10,~A[9]);
  nor(Zn[1], w_and_1,w_and_2,w_and_3,w_and_12);
  nor(Zn[2], w_and_7,w_and_8,w_and_9,w_and_11);
  nor(Zn[3], ~A[8], ~A[9]);


endmodule //multiplexer_4to1

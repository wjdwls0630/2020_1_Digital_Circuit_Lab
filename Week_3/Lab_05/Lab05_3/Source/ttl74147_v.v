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


  nor(w_or_1, An[8], An[9]);
  and(w_and_1, An[2], ~An[4], ~An[5], w_or_1);
  and(w_and_2, A[5], An[3], ~An[4], w_or_1);
  and(w_and_3, An[6], w_or_1);
  and(w_and_4, An[1] , An[1], ~An[2] , ~An[4] , ~An[6] , w_or_1);
  //
  and(w_and_5, An[3] , ~An[4] , ~An[6] , w_or_1);
  and(w_and_6, An[5] , ~An[6] ,w_or_1);
  and(w_and_7, An[4] , w_or_1);
  and(w_and_8, An[5] , w_or_1);
  and(w_and_9, An[6] , w_or_1);
  and(w_and_10, An[7] , w_or_1);
  and(w_and_11, An[7] , w_or_1);
  and(w_and_12, An[7] , w_or_1);

  nor(Zn[0], w_and_4,w_and_4,w_and_5,w_and_6,w_and_10,An[9]);
  nor(Zn[1], w_and_1,w_and_2,w_and_3,w_and_12);
  nor(Zn[2], w_and_7,w_and_8,w_and_9,w_and_11);
  nor(Zn[3], An[8], An[9]);


endmodule //multiplexer_4to1

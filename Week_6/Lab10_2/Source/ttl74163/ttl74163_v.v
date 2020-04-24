module ttl74163_v (
  input PEn, // LDN Synchronous Load negative active
  input [3:0] D, // D, C, B, A
  input CET, // ENT Count Enable Trickle
  input CEP, // ENP Count Enable Parallel
  input MRn, // CLRN Synchronous Clear, negative active
  input CP, // CLK Rising Edge Trigger
  output reg [3:0] Q, // QD, QC, QB, QA
  output TC // RCO Ripple Carry out
  );

  // TC gate level design
  wire w_buf_CET;
  buf(w_buf_CET, CET);
  wire w_and_1;
  and(w_and_1, Q[0], w_buf_CET);
  wire w_buf_1;
  buf(w_buf_1, w_and_1);
  wire w_and_2;
  and(w_and_2, Q[1], w_buf_1);
  wire w_buf_2;
  buf(w_buf_2, w_and_2);
  wire w_and_3;
  and(w_and_3, Q[2], w_buf_2);
  wire w_buf_3;
  buf(w_buf_3, w_and_3);
  wire w_and_4;
  and(w_and_4, Q[3], w_buf_3);
  wire w_buf_4;
  buf(w_buf_4, w_and_4);
  assign TC = w_buf_4;

  always @ ( posedge CP ) begin
    if(!MRn) Q <= 4'b0; // Clear
    else if(!PEn) Q <= D; // Load
    else begin
      if(!CET) Q <= Q; // Hold
      else begin
        if(!CEP) Q <= Q; // Hold but carry out
        else begin
          if(Q == 4'b1111) Q <= 4'b0000; // reset
          else Q <= Q + 1'b1;
        end
      end
    end
  end



endmodule //ttl74163_v

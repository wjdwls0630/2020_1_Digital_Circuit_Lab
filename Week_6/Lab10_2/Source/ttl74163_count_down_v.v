module ttl74163_count_down_v (
  input CP,
  input rstn,
  input [3:0] D, // D, C, B, A
  input CEP, // ENP Count Enable Parallel
  input MRn, // CLRN Synchronous Clear, negative active
  output TC, // RCO Ripple Carry out
  input LTN,
  input RBIN,
  input BIN,
  output RBON,
  output [6:0] o_Z
  );
  wire [3:0] w_Q;
  ttl74163_v ttl74163_v(
    .PEn(rstn), // LDN Synchronous Load negative active
    .CET(CEP), // ENT Count Enable Trickle
    .D(D), // D, C, B, A
    .CEP(CEP), // ENP Count Enable Parallel
    .MRn(MRn), // CLRN Synchronous Clear, negative active
    .CP(CP), // CLK Rising Edge Trigger
    .Q(w_Q), // QD, QC, QB, QA
    .TC() // RCO Ripple Carry out
  );
  wire [3:0] w_not_Q;
  not_1in_v not_1in_v_1(
    .A(w_Q[0]),
    .Z(w_not_Q[0])
    );
  not_1in_v not_1in_v_2(
    .A(w_Q[1]),
    .Z(w_not_Q[1])
    );
  not_1in_v not_1in_v_3(
    .A(w_Q[2]),
    .Z(w_not_Q[2])
    );
  not_1in_v not_1in_v_4(
    .A(w_Q[3]),
    .Z(w_not_Q[3])
    );
  seg_decoder_v seg_decoder_v(
    .i_A(w_not_Q),
    .o_Z(o_Z)
  );

endmodule // ttl74163_count_down_v

module ttl74163_count_down(
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
  wire w_CEP;
  assign w_CEP = CEP;
  ttl74163 ttl74163(
    .PEn(rstn), // LDN Synchronous Load negative active
    .CET(w_CEP), // ENT Count Enable Trickle
    .D(D), // D, C, B, A
    .CEP(w_CEP), // ENP Count Enable Parallel
    .MRn(MRn), // CLRN Synchronous Clear, negative active
    .CP(CP), // CLK Rising Edge Trigger
    .Q(w_Q), // QD, QC, QB, QA
    .TC(TC) // RCO Ripple Carry out
  );
  wire [3:0] w_not_Q;
  not_1in not_1in_1(
    .A(w_Q[0]),
    .Z(w_not_Q[0])
    );
  not_1in not_1in_2(
    .A(w_Q[1]),
    .Z(w_not_Q[1])
    );
  not_1in not_1in_3(
    .A(w_Q[2]),
    .Z(w_not_Q[2])
    );
  not_1in not_1in_4(
    .A(w_Q[3]),
    .Z(w_not_Q[3])
    );
  wire [6:0] w_Z;
  ttl7448 ttl7448(
    .i_A(w_not_Q),
    .LTN(LTN),
    .RBIN(RBIN),
    .BIN(BIN),
    .o_Z(o_Z),
    .RBON(RBON)
  );
  

endmodule // ttl74163_count_down_v

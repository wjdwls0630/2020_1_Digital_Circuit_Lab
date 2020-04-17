module bit8_counter_v (
  input PEn, // LDN Synchronous Load negative active
  input [7:0] D, // D, C, B, A
  input CET, // ENT Count Enable Trickle
  input CEP, // ENP Count Enable Parallel
  input MRn, // CLRN Synchronous Clear, negative active
  input CP, // CLK Rising Edge Trigger
  output [7:0] Q, // QD, QC, QB, QA
  output TC // RCO Ripple Carry out
  );

  wire w_TC;
  wire w_PEn;
  wire w_CET;
  wire w_CEP;
  wire w_MRn;
  assign w_PEn = PEn;
  assign w_CET = CET;
  assign w_CEP = CEP;
  assign w_MRn = MRn;
  wire [3:0] Q1;
  wire [3:0] Q2;
  assign Q = {Q2, Q1};
  ttl74163_v ttl74163_v_1 (
    .PEn(w_PEn), // LDN Synchronous Load negative active
    .D(D[3:0]), // D, C, B, A
    .CET(w_CET), // ENT Count Enable Trickle
    .CEP(w_CEP), // ENP Count Enable Parallel
    .MRn(w_MRn), // CLRN Synchronous Clear, negative active
    .CP(CP), // CLK Rising Edge Trigger
    .Q(Q1), // QD, QC, QB, QA
    .TC(w_TC) // RCO Ripple Carry out
    );

  ttl74163_v ttl74163_v_2 (
    .PEn(w_PEn), // LDN Synchronous Load negative active
    .D(D[7:4]), // D, C, B, A
    .CET(w_TC), // ENT Count Enable Trickle
    .CEP(w_TC), // ENP Count Enable Parallel
    .MRn(w_MRn), // CLRN Synchronous Clear, negative active
    .CP(CP), // CLK Rising Edge Trigger
    .Q(Q2), // QD, QC, QB, QA
    .TC(TC) // RCO Ripple Carry out
    );



endmodule //ttl74163_v

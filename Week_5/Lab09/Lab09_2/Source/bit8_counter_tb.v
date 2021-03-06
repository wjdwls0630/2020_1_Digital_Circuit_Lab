module bit8_counter_v_tb ();
  reg CP;
  wire MRn;
  wire CEP;
  wire CET;
  wire PEn;
  reg [3:0] set;
  reg [7:0]D;
  assign MRn = set[3];
  assign CEP = set[2];
  assign CET = set[1];
  assign PEn = set[0];

  initial begin
    CP <= 1'b0;
    set <= 4'b0111;
    D <= 4'b1111;
  end
  always begin
    #10 CP <= ~CP; // 50MHz
  end

  initial begin
    // after two clock
    #30 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;

    #20 set <= 4'b1110;
    D <= 8'b00011111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;

    #20 set <= 4'b0111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
    #20 set <= 4'b1111;
    D <= 8'b11111111;
  end

  wire [7:0] Q;
  wire TC;
  always @ ( Q, TC ) begin
    $monitor("%8b %b", Q, TC);
  end
  bit8_counter_v bit8_counter_v(
    .PEn(PEn), // LDN Synchronous Load negative active
    .D(D), // D, C, B, A
    .CET(CET), // ENT Count Enable Trickle
    .CEP(CEP), // ENP Count Enable Parallel
    .MRn(MRn), // CLRN Synchronous Clear, negative active
    .CP(CP), // CLK Rising Edge Trigger
    .Q(Q), // QD, QC, QB, QA
    .TC(TC) // RCO Ripple Carry out
    );


endmodule //multiplexer_8to1_tb

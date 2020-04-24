module ttl74163_count_down_v_tb ();
  reg CLK;
  reg rstn;
  initial begin
    CLK <= 1'b0;
    rstn <= 1'b0;
  end
  always begin
    #10 CLK <= ~CLK; // 50MHz
  end

  initial begin
    // after two clock
    #30 rstn <= 1'b1;
  end

  wire [6:0] o_Z;
  always @ ( o_Z ) begin
    $monitor("%7b", o_Z);
  end
  ttl74163_count_down_v ttl74163_count_down_v(
    .CP(CLK),
    .rstn(rstn),
    .D(4'b0110), // D, C, B, A
    .CEP(1'b1), // ENP Count Enable Parallel
    .MRn(1'b1), // CLRN Synchronous Clear, negative active
    .TC(), // RCO Ripple Carry out
    .LTN(1'b1),
    .RBIN(1'b1),
    .BIN(1'b1),
    .RBON(),
    .o_Z(o_Z)
    );


endmodule //multiplexer_8to1_tb

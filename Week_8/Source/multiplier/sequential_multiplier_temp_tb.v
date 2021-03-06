module sequential_multiplier_temp_tb ();
reg [7:0] A;
reg [7:0] B;
reg START;
reg CLK;
reg RSTN;


initial begin
  A <= 8'b0;
  B <= 8'b0;
  START <= 1'b0;
  CLK <= 1'b0;
  RSTN <= 1'b1;
end

always begin
  #10 CLK <= ~CLK; // 50MHz
end

initial begin
  RSTN <= 1'b0;
  #20 RSTN <= 1'b1;
  #20 A <= 8'd7;
  B <= 8'd4;
  #20 START <= 1'b1;
  #20 START <= 1'b0;
end

wire [15:0] Y;
wire READY;
sequential_multiplier_temp sequential_multiplier_temp (
  .i_A(A), // Multiplicand
  .i_B(B), // Multiplier
  .i_START(START),
  .o_Y(Y), // Product
  .o_READY(READY),
  .i_CLK(CLK),
  .i_RSTN(RSTN)
  );



endmodule // sequential_multiplier_temp

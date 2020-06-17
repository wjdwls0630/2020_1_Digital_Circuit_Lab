module mul_8_by_8_v (
  input [7:0] i_A,
  input [7:0] i_B,
  output [15:0] o_Y
  );

  wire [7:0] w_q0;
  wire [7:0] w_q1;
  wire [7:0] w_q2;
  wire [7:0] w_q3;
  wire [7:0] w_q4;
  wire [11:0] w_q5;
  wire [11:0] w_q6;

  mul_4_by_4_v mul_4_by_4_v_1 (
    .i_A(i_A[3:0]),
    .i_B(i_B[3:0]),
    .o_Y(w_q0)
    );

  mul_4_by_4_v mul_4_by_4_v_2 (
    .i_A(i_A[7:4]),
    .i_B(i_B[3:0]),
    .o_Y(w_q1)
    );

  mul_4_by_4_v mul_4_by_4_v_3 (
    .i_A(i_A[3:0]),
    .i_B(i_B[7:4]),
    .o_Y(w_q2)
    );

  mul_4_by_4_v mul_4_by_4_v_4 (
    .i_A(i_A[7:4]),
    .i_B(i_B[7:4]),
    .o_Y(w_q3)
    );

  wire [7:0] w_temp_1;
  wire [11:0] w_temp_2;
  wire [11:0] w_temp_3;
  wire [11:0] w_temp_4;

  assign w_temp_1 = {4'b0, w_q0[7:4]};

  rca_8bit_v rca_8bit_v(
    .i_A(w_temp_1),
    .i_B(w_q1),
    .i_C(1'b0),
    .o_S(w_q4),
    .o_C()
    );
  assign w_temp_2 = {4'b0, w_q2};
  assign w_temp_3 = {w_q3, 4'b0};

  rca_12bit_v rca_12bit_v_0(
    .i_A(w_temp_2),
    .i_B(w_temp_3),
    .i_C(1'b0),
    .o_S(w_q5),
    .o_C()
    );

  assign w_temp_4 = {4'b0, w_q4};

  rca_12bit_v rca_12bit_v_1(
    .i_A(w_temp_4),
    .i_B(w_q5),
    .i_C(1'b0),
    .o_S(w_q6),
    .o_C()
    );

  assign o_Y[3:0] = w_q0[3:0];
  assign o_Y[15:4] = w_q6[11:0];

endmodule // mul_4_by_4_v

module mul_4_by_4_v (
  input [3:0] i_A,
  input [3:0] i_B,
  output [7:0] o_Y
  );

  wire [3:0] w_q0;
  wire [3:0] w_q1;
  wire [3:0] w_q2;
  wire [3:0] w_q3;
  wire [3:0] w_q4;
  wire [5:0] w_q5;
  wire [5:0] w_q6;

  mul_2_by_2_v mul_2_by_2_v_1 (
    .i_A(i_A[1:0]),
    .i_B(i_B[1:0]),
    .o_Y(w_q0)
    );

  mul_2_by_2_v mul_2_by_2_v_2 (
    .i_A(i_A[3:2]),
    .i_B(i_B[1:0]),
    .o_Y(w_q1)
    );

  mul_2_by_2_v mul_2_by_2_v_3 (
    .i_A(i_A[1:0]),
    .i_B(i_B[3:2]),
    .o_Y(w_q2)
    );

  mul_2_by_2_v mul_2_by_2_v_4 (
    .i_A(i_A[3:2]),
    .i_B(i_B[3:2]),
    .o_Y(w_q3)
    );

  wire [3:0] w_temp_1;
  wire [5:0] w_temp_2;
  wire [5:0] w_temp_3;
  wire [5:0] w_temp_4;

  assign w_temp_1 = {2'b0, w_q0[3:2]};

  rca_4bit_v rca_4bit_v(
    .i_A(w_temp_1),
    .i_B(w_q1),
    .i_C(1'b0),
    .o_S(w_q4),
    .o_C()
    );
  assign w_temp_2 = {2'b0, w_q2};
  assign w_temp_3 = {w_q3, 2'b0};

  rca_6bit_v rca_6bit_v_0(
    .i_A(w_temp_2),
    .i_B(w_temp_3),
    .i_C(1'b0),
    .o_S(w_q5),
    .o_C()
    );

  assign w_temp_4 = {2'b0, w_q4};

  rca_6bit_v rca_6bit_v_1(
    .i_A(w_temp_4),
    .i_B(w_q5),
    .i_C(1'b0),
    .o_S(w_q6),
    .o_C()
    );

  assign o_Y[1:0] = w_q0[1:0];
  assign o_Y[7:2] = w_q6[5:0];

endmodule // mul_4_by_4_v

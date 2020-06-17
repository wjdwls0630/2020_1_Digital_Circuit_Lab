module sequential_multiplier_temp (
  input [7:0] i_A, // Multiplicand
  input [7:0] i_B, // Multiplier
  input i_START,
  output [15:0] o_Y, // Product
  output o_READY,
  input i_CLK,
  input i_RSTN
  );

  parameter ST_IDLE = 3'b001;
  parameter ST_ADD = 3'b010;
  parameter ST_SHIFT = 3'b100;

  reg [2:0] r_pstate;
  reg [2:0] r_nstate;

  reg [7:0] r_A; //multiplicand
  reg [7:0] r_B; // multiplier
  reg [7:0] r_Q;
  reg r_carry_out;
  reg [3:0] r_counter;
  reg r_load;
  reg r_decr;
  reg r_add;
  reg r_shift;

  //combi logic

  assign o_Y = {r_Q, r_B};

  wire w_is_zero;
  assign w_is_zero = (r_counter == 0);
  assign o_READY = (r_pstate == ST_IDLE);

  // control unit
  always @ ( posedge i_CLK, negedge i_RSTN ) begin
    if(!i_RSTN) r_pstate <= ST_IDLE;
    else r_pstate <= r_nstate;
  end

  always @ ( r_pstate, i_START, r_B[0], w_is_zero ) begin
    r_nstate <= ST_IDLE;
    r_load <= 1'b0;
    r_decr <= 1'b0;
    r_add <= 1'b0;
    r_shift <= 1'b0;
    case (r_pstate)
      ST_IDLE:
      begin
        r_load <= 1'b1;
        if(i_START) r_nstate <= ST_ADD;
      end

      ST_ADD:
      begin
        r_nstate <= ST_SHIFT;
        r_decr <= 1'b1;
        if(r_B[0]) r_add <= 1'b1;
      end

      ST_SHIFT:
      begin
        r_shift <= 1'b1;
        if(w_is_zero) r_nstate <= ST_IDLE;
        else r_nstate <= ST_ADD;
      end

      default:
      begin
        r_nstate <= ST_IDLE;
      end
    endcase
  end

  // datapath unit

  always @ ( posedge i_CLK ) begin
    if(r_load) begin
      r_counter <= 4'b1000;
      r_A <= i_A;
      r_B <= i_B;
      r_Q <= 8'b0;
      r_carry_out <= 1'b0;
    end
    if(r_add) {r_carry_out, r_Q} <= r_Q + r_A;
    if(r_shift) {r_carry_out, r_Q, r_B} <= {r_carry_out, r_Q, r_B} >> 1;
    if(r_decr) r_counter <= r_counter - 1;
  end



endmodule // sequential_multiplier_temp

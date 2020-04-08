module seg_decoder_tb ();
  reg clk;
  reg [3:0] r_counter;

  initial begin
    r_counter <= 4'b0;
    clk <= 1'b0;
  end

  always begin
    #10 clk <= ~clk;
  end

  always @ ( posedge clk ) begin
    if(r_counter == 4'b1001) r_counter <= 4'b0;
    else r_counter <= r_counter + 1'b1;
  end

  wire [6:0] Y;
  always @ ( Y ) begin
    $monitor("%b", Y);
  end
  seg_decoder seg_decoder(
    .i_A(r_counter),
    .o_Z(Y)
    );
	 
endmodule //seg_decoder_tb

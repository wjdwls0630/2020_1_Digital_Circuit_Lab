module seg_decoder_tb ();
  reg clk;
  reg [3:0] r_counter;

  initial begin
    r_counter <= 4'b0000;	 
    clk <= 1'b0;
	 #20 r_counter <= 4'b1001;
	 #20 r_counter <= 4'b1000;
	 #20 r_counter <= 4'b0111;
	 #20 r_counter <= 4'b0110;
	 #20 r_counter <= 4'b0101;
	 #20 r_counter <= 4'b0100;
	 #20 r_counter <= 4'b0011;
	 #20 r_counter <= 4'b0010;
	 #20 r_counter <= 4'b0001;
	 #20 r_counter <= 4'b0000;
	 #20 r_counter <= 4'b1100;
	 #20 r_counter <= 4'b1110;
	 #20 r_counter <= 4'b1111;
  end

  always begin
    #10 clk <= ~clk;
  end

  /*
  always @ ( posedge clk ) begin
    if(r_counter == 4'b1001) r_counter <= 4'b0;
    else r_counter <= r_counter + 1'b1;
  end
  */
  wire [6:0] Y;
  always @ ( Y ) begin
    $monitor("%b", Y);
  end
  seg_decoder seg_decoder(
    .i_A(r_counter),
    .o_Z(Y)
    );
	 
endmodule //seg_decoder_tb

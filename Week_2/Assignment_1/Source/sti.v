`timescale 1 ns/1 ns
module And_Or_1_tb();
	reg [2:0] A;
	wire [1:0] F;
	reg clk;
	And_Or_1 and_or_1(.A(A), .F(F));
	initial begin
	#160 $finish;
	end
	
	initial begin
		A = 3'b000;
		clk = 1'b0;
		$display("A[2..0],  F[1..0]");
		$monitor("%b,    %b",A, F);
	end
	always #20 clk = ~clk;
	
	always @(posedge clk) begin
		A <= A + 1'b1;
		$monitor("%b,    %b",A, F);
	end
	
	
	
endmodule

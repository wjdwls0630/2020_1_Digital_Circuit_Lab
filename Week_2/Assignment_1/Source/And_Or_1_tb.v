`timescale 1 ns/1 ns
module And_Or_1_tb();
	reg [2:0] A;
	wire [1:0] F;
	reg clk;
	And_Or_1 and_or_1(.A(A), .F(F));
	initial begin
		A = 3'b000;
		clk = 1'b0;
		$display("A[2..0]\tF[1..0]");
		$monitor("%3b\t%2b",A, F);
	end
	always 
		#20 clk = ~clk;
	
	always @(posedge clk) begin
		A <= A + 1'b1;
		$monitor("%3b\t%2b",A, F);
	end
	
endmodule

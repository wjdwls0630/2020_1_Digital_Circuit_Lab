module top(
	input wire [2:0] A,
	output wire [1:0] F
	);
	
	And_Or_1 and_or_1(
		.A(A),
		.F(F)
	);
	
endmodule

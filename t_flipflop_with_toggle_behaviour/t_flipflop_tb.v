module t_flipflop_tb;

reg clk;
reg reset;
reg t;
wire q;

t_flipflop uut(
	.clk(clk),
	.reset(reset),
	.t(t),
	.q(q)
);

initial begin
	clk = 0;
	forever #5 clk=~clk;
end

initial begin
	$dumpfile("t_flipflop.vcd");
	$dumpvars(0, t_flipflop_tb);
	
	reset = 1;t = 0;
	#10 reset = 0;

	#10 t = 1;
	#10 t = 0;
	#10 t = 1;
	#10 t = 0;

	#30 $finish;
end

endmodule

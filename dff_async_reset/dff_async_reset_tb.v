module dff_async_reset_tb;

reg clk;
reg reset;
reg d;
wire q;

dff_async_reset uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

initial begin
    $dumpfile("dff_async_reset.vcd");
    $dumpvars(0, dff_async_reset_tb);

    clk = 0;
    reset = 0;
    d = 0;

    #5 reset = 1;     // Apply reset
    #5 reset = 0;     // Release reset

    #10 d = 1;
    #10 d = 0;
    #10 d = 1;

    #30 $finish;
end

always #5 clk = ~clk; // Clock toggles every 5 time units

endmodule


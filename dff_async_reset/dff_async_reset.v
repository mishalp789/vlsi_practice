module dff_async_reset (
    input clk,
    input reset,   // asynchronous reset
    input d,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 1'b0;     // Reset output to 0 immediately
    else
        q <= d;        // Otherwise, capture input on rising edge
end

endmodule


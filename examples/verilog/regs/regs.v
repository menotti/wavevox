module regs (clock, a, b);

input clock;

output [7:0] a;
output [7:0] b;

reg [7:0] a = 8'b1;
reg [7:0] b = 8'b10;

always @(posedge clock) begin
  a <= b;
  b <= a;
end

endmodule

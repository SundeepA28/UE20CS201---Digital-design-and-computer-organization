module TB;
reg [0:3]i;
reg s0;
reg s1;
wire y;
initial
begin
$dumpfile("dump.vcd");
$dumpvars(0, TB);
end
mux4 newMUX(.a(i), .s0(s0),.s1(s1),.o(y));
initial
begin
i = 4'b0001;
s0=1'b0;
s1=1'b0;
#5
i = 4'b1000;
#5
i = 4'b0001;
s0=1'b1;
s1=1'b1;
#5
i = 4'b0000;
s0=1'b1;
s1=1'b0;
end
endmodule

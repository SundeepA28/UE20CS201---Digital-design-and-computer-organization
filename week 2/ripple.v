module fulladd(input wire [3:0] a, b, input wire ci, output wire [3:0] sum, output wire co);
	wire [2:0] c;
	fulladd f1(a[0], b[0], ci, sum[0], c[0]);
	fulladd f2(a[1], b[1], c[0], sum[1], c[1]);
	fulladd f3(a[2], b[2], c[1], sum[2], c[2]);
	fulladd f4(a[3], b[3], c[2], sum[3], co);
endmodule 
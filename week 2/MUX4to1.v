module mux2 (input wire i0, i1, j, output wire o);
  assign o = (j==0)?i0:i1;
endmodule

module mux4 (input wire [0:3]a, input wire s1, s0, output wire o);
  wire  p, q;
  
	mux2 m1(a[0], a[1], s0, p);
	mux2 m2(a[2], a[3], s0, q);
	mux2 m3(p, q, s1, o);

endmodule


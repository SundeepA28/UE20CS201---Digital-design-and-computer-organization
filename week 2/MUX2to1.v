module mux2 (input wire a, b, c, output wire o);
  assign o = (c==0)?a:b;
endmodule

module fulladd(input wire a, b, cin, output wire sum, cout);
    wire p,q,r,s,t;
    xor2 x0(a, b, p);
    xor2 x1(p, cin, sum);
    and2 a0(a, b, q);
    and2 a1(a, cin, r);
    and2 a2(b, cin, s);
    or2 o0(q, r, t);
    or2 o1(s, t, cout);
endmodule

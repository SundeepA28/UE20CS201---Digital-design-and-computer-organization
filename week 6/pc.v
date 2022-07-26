module adder(input wire a,b,c,output wire sum,cout);
wire t1,t2,t3;
xor2 x1(a,b,t1);
xor2 x2(t1,c,sum);
and2 a1(a,b,t2);
and2 a2(b,c,t3);
and2 a3(a,c,t4);
or2 o1(t2,t3,t5);
or2 o2(t5,t4,cout);
endmodule

module pc_first(input wire clk,reset,load,inc,offset,sub,output wire
pc,cout);
wire or_output,xor_output,adder_out;
or2 o1(offset,inc,or_output);
xor2 x1(or_output,sub,xor_output);
adder a_1(xor_output,sub,pc,adder_out,cout);
dfrl d1(clk,reset,load,adder_out,pc);
endmodule

module pc_ahead(input wire clk,reset,load,inc,offset,sub,cin,output
wire pc,cout);
wire and_output,xor_output,adder_out,incnot;
invert i1(inc,incnot);
and2 a1(offset,incnot,and_output);
xor2 x1(and_output,sub,xor_output);
adder a_1(xor_output,cin,pc,adder_out,cout);
dfrl d1(clk,reset,load,adder_out,pc);
endmodule

module pc(input wire clk, reset, inc, add, sub, input wire [15:0]
offset, output wire [15:0] pc);
wire temp,load;
wire[15:0] c;
or2 o1(inc,add,temp);
or2 o2(temp,sub,load);
pc_first p0(clk,reset,load,inc,offset[0],sub,pc[0],c[0]);
pc_ahead p1(clk,reset,load,inc,offset[1],sub,c[0],pc[1],c[1]);
pc_ahead p2(clk,reset,load,inc,offset[2],sub,c[1],pc[2],c[2]);
pc_ahead p3(clk,reset,load,inc,offset[3],sub,c[2],pc[3],c[3]);
pc_ahead p4(clk,reset,load,inc,offset[4],sub,c[3],pc[4],c[4]);
pc_ahead p5(clk,reset,load,inc,offset[5],sub,c[4],pc[5],c[5]);
pc_ahead p6(clk,reset,load,inc,offset[6],sub,c[5],pc[6],c[6]);
pc_ahead p7(clk,reset,load,inc,offset[7],sub,c[6],pc[7],c[7]);
pc_ahead p8(clk,reset,load,inc,offset[8],sub,c[7],pc[8],c[8]);
pc_ahead p9(clk,reset,load,inc,offset[9],sub,c[8],pc[9],c[9]);
pc_ahead p10(clk,reset,load,inc,offset[10],sub,c[9],pc[10],c[10]);
pc_ahead p11(clk,reset,load,inc,offset[11],sub,c[10],pc[11],c[11]);
pc_ahead p12(clk,reset,load,inc,offset[12],sub,c[11],pc[12],c[12]);
pc_ahead p13(clk,reset,load,inc,offset[13],sub,c[12],pc[13],c[13]);
pc_ahead p14(clk,reset,load,inc,offset[14],sub,c[13],pc[14],c[14]);
pc_ahead p15(clk,reset,load,inc,offset[15],sub,c[14],pc[15],c[15]);
endmodule
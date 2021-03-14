// file: fullAdder.v
// author: @seifashraf1

`timescale 1ns/1ns

module fullAdder (
   input  a,
   input  b,
   input  cin,
   output sum,
   output cout
);

 assign {cout,sum} = a+b+cin;
  
 endmodule
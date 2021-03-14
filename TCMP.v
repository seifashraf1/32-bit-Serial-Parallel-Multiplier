// file: TCMP.v
// author: @seifashraf1

`timescale 1ns/1ns

module TCMP(
    input clk, 
    input rst,
    input A,
    output S
  );
  
  wire Z;
  wire d1;
  wire d2;
  
  assign d1 = A^Z;
  assign d2 = A|Z;
  

      FlipFlop ff1 (.clk(clk), .rst(rst), .D(d1),.Q(S));
      FlipFlop ff2 (.clk(clk), .rst(rst), .D(d2),.Q(Z));
      

endmodule
// file: CSADD.v
// author: @seifashraf1

`timescale 1ns/1ns

module CSADD(
    input X,
    input Y,
    input clk,
    input rst,
    output sum
  );
  
  wire Y1;
  wire Y2;
  wire y2;
    
  
      fullAdder fa (.a(X), .b(Y), .cin(y2), .sum(Y1), .cout(Y2));
      
      FlipFlop ff1 (.clk(clk), .rst(rst), .D(Y1),.Q(sum));
      FlipFlop ff2 (.clk(clk), .rst(rst), .D(Y2),.Q(y2));
      
  
   
   
endmodule
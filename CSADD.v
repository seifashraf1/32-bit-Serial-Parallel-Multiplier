/*******************************************************************
*
* Module: CSADD.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: A bit-serial adder (shown below) can be used to add 2 binary numbers provided serially (one bit from each number every clock cycle) 
               to produce a serial sum (also produced one bit every clock cycle). 
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/

`include "fullAdder.v"

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
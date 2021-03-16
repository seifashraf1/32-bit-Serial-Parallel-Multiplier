/*******************************************************************
*
* Module: TCMP.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: A bit-serial two’s complementor can be used to serially generate the two’s complement of a binary number, 
               provided serially starting from the LSB.
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/

`timescale 1ns/1ns

`include "FlipFlop.v"

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
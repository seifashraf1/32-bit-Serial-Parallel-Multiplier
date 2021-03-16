/*******************************************************************
*
* Module: FlipFlop.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: FlipFlop module which is essential for the full adder
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/

`timescale 1ns/1ns

module FlipFlop(
    input clk,
    input rst,
    input D,
    output reg Q
  );
  
  always @(posedge clk or posedge rst) begin
        if (rst) begin
            Q <= 0;
        end
        else begin
            Q <= D;
        end
    end
endmodule
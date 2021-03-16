/*******************************************************************
*
* Module: fullAdder.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: Full Adder adds three inputs and produces two outputs. The first two inputs are a and b and the third input is an input carry,
               The output carry is cout and the normal output is sum which the sum of a and b
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/

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
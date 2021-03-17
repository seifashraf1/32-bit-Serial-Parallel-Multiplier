/*******************************************************************
*
* Module: Multiplier.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: The top module which is the SPM which is a combination of one TCMP, 63 CSADDs, taking MP as serial input, and MC as paraller input
               the output is their multiplication
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/

`timescale 1ns/1ns

`include "CSADD.v"
`include "TCMP.v"

module Multiplier (
      input [31:0] MP,
      input [31:0] MC,
      input start,
      input clk,
      input rst,
      output reg [63:0] P,
      output reg done
  );

    reg [31:0] MP_Copy;
    reg [6:0] bitsCount;
    wire [31:0] XY;
    wire [31:1] PP;
    wire eP;
    
    
    
    always @(posedge start) begin 
        MP_Copy <= {{32{MP[31]}}, MP[31:0]};     
        bitsCount <= 1; 
        
    end
    
    always @(posedge clk) begin 
        if (!rst) begin 
        
          MP_Copy <= MP_Copy >> 1;
          
        end
        
        
    end

    //taking serial input from Y each clock cycle, and it with paraller input from X
    genvar i;
    
    generate 
        assign XY[31] = MC[31]&&MP_Copy[0];    //first sum operation has no PP so we hardwired it like that
    
        TCMP tcmp (.clk(clk), .rst(rst), .A(XY[31]), .S(PP[31]));
        for (i=30; i>=1; i=i-1) begin 
            assign XY[i]=MC[i]&&MP_Copy[0];
            
            CSADD csadd (.X(XY[i]), .Y(PP[i+1]), .clk(clk), .rst(rst), .sum(PP[i]));
        end
        
        assign XY[0] = MC[0]&&MP_Copy[0];      //last sum operation its sum is not included in PP array as described 
    
        CSADD csadd1 (.X(XY[0]), .Y(PP[1]), .clk(clk), .rst(rst), .sum(eP));
    
    endgenerate

    //increment the counter each clock cycle, and concatenate in the output reg 
    always @( posedge start, posedge clk or posedge rst)begin
        if (rst) begin
            P <= 0;
            bitsCount<=0; 
        end
        
        else 
            bitsCount<=bitsCount+1; 

        if (bitsCount<=64) 
            done<=0;
        else  
            done<=1;
            

        P <= {eP,P[63:1]};

    end    
 
endmodule

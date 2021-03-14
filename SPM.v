// file: SPM.v
// author: @seifashraf1

`timescale 1ns/1ns

module SPM(
    input clk, 
    input rst, 
    input [31:0] X, 
    input Y, 
    output P
  );
    
    wire [31:0] XY;
    wire [31:0] PP;
    
    assign XY[31] = X[31]&&Y;    //first sum operation has no PP so we hardwired it like that
    
    TCMP tcmp (.clk(clk), .rst(rst), .A(XY[31]), .S(PP[31]));
    
    genvar i;
    
    generate
        for (i=30; i>=1; i=i-1) begin 
            assign XY[i]=X[i]&&Y;
            
            CSADD csadd (.X(XY[i]), .Y(PP[i+1]), .clk(clk), .rst(rst), .sum(PP[i]));
        end
    endgenerate
    
    assign XY[0] = X[0]&&Y;      //last sum operation its sum is not included in PP array as described 
    
    CSADD csadd (.X(XY[0]), .Y(PP[1]), .clk(clk), .rst(rst), .sum(P));
    
endmodule
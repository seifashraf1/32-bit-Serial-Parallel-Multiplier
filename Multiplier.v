// file: Multiplier .v
// author: @seifashraf1

`timescale 1ns/1ns

module Multiplier (
      input [31:0] MP,
      input [31:0] MC,
      input start,
      input clk,
      input rst,
      output reg [63:0] P,
      output reg done
  );

    // reg [63:0] MP_stable; 
    // reg [63:0] MC_stable;
    
    
    
    // always @ (posedge start) begin 
    //     //MP_stable <= {{32{MP[31]}}, MP};
    //     MP_stable <= MP;
    //     MC_stable <= MC;
    // end 
    
    // //assign MP_1[63:0] = MP_stable;
    // //assign MP_1[63:32] = MP_stable[63]?16'hFFFF_FFFF_FFFF_FFFF:0;
    
    // integer i;
    // reg yy;
    // reg [63:0] product;
    // wire pp;
    
    // SPM spm (.clk(clk), .rst(rst), .X(MC_stable), .Y(yy),  .P(pp));
    
    // always @ (posedge clk) begin
        
    //     if (i<=63) begin
    //     yy = MP_stable[i];
    //     product[63] <= pp;
    //     product <=  product << 1;
        
    //       i<=i+1;
    //       done<=0;
    //     end 
    //     else begin 
    //       i<=0;
    //       done<=1;
    //     end
    
    // end
    
    
    reg [31:0] MP_stable;
    wire eP;
    wire [31:0] XY;
    wire [31:1] PP;
    
    reg [6:0] count;
    
    always @(posedge start) begin 
        MP_stable <= MP;
        
        count <= 1; 
        
    end
    
    always @(posedge clk) begin 
        if (!rst) begin 
        
          MP_stable <= MP_stable >> 1;
          
        end
        
        
    end
    
    
    always @( posedge start, posedge clk or posedge rst)begin
        if (rst)
        count<=0; 
        else 
        count<=count+1; 

        case (count)
        64: begin done=1; end
        default: done=0; 
        endcase


    end

    
    
    
    genvar i;
    
    generate
        assign XY[31] = MC[31]&&MP_stable[0];    //first sum operation has no PP so we hardwired it like that
    
        TCMP tcmp (.clk(clk), .rst(rst), .A(XY[31]), .S(PP[31]));
        for (i=30; i>=1; i=i-1) begin 
            assign XY[i]=MC[i]&&MP_stable[0];
            
            CSADD csadd (.X(XY[i]), .Y(PP[i+1]), .clk(clk), .rst(rst), .sum(PP[i]));
        end
        
        assign XY[0] = MC[0]&&MP_stable[0];      //last sum operation its sum is not included in PP array as described 
    
        CSADD csadd1 (.X(XY[0]), .Y(PP[1]), .clk(clk), .rst(rst), .sum(eP));
    
    endgenerate
    
    
    
    always @(posedge clk)begin
    
    P <= {eP,P[63:1]};
      
    if (rst) begin 
      P <= 0;
    end 
       
    
    end
    
    
    
    
    
endmodule
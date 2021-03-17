/*******************************************************************
*
* Module: Multiplier_tb.v
* Project: 32-bit signed Serial-Parallel Multiplier (SPM)
* Author: Seif Ashraf - seifeldinashraf11@aucegypt.edu
* Description: SPM Multiplier testbench 
*
* Change history: 03/09/21 –Module Created
                  03/16/21 –Edited the code to meet coding guidelines
*
**********************************************************************/


`timescale 1ns/1ns

module Multiplier_tb;

	//Inputs
	reg signed [31:0] MP;
	reg signed [31:0] MC;
	reg start;
	reg clk;
	reg rst;


	//Outputs
	wire [63:0] P;
	wire done;


	//Instantiation of Unit Under Test
	Multiplier uut (
		.MP(MP),
		.MC(MC),
		.start(start),
		.clk(clk),
		.rst(rst),
		.P(P),
		.done(done)
	);

  reg [63:0] goldenProd;
  wire error;

  integer i,j;
  
  
  always @ (posedge start)begin
    goldenProd = MP*MC;
  end  
  
  assign error = (goldenProd != P);
  
  initial clk=1;
    always begin
        #10
        clk=~clk;
  end

	initial begin
	$dumpfile("./Multiplier.vcd");
 	$dumpvars(0,Multiplier_tb);
  end 

event reset_trigger; 
event reset_done; 

initial begin 
	#10 -> reset_trigger; 
end

always @(reset_trigger) begin
	 @(negedge clk);
   	 rst=1; 
     start=0; 
     @(negedge clk);
   	 rst=0;  
     start=1; 
end

//change the number to 4294967295 to loop over all numbers that can be stored in 32 bits if you want
  initial begin

  for(i=1;i<10;i=i+1)begin		
    for(j=1;j<10;j=j+1)begin
    	#(100) ->reset_trigger;
        MP=i;
        MC=j;
        start=1;
        @(posedge done);
        if(error)begin
          $display("Error!! MP: %d, MC: %d, Product: %d",MP, MC, P);
          $finish;
        end
        else begin
        	$display("MP: %d, MC: %d, Product: %d", MP, MC, P);
        end
    end
  end

  $display("Success");

  #10000 $finish;

  

	end

endmodule
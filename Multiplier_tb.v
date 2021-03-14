// file: Multiplier _tb.v
// author: @seifashraf1
// Testbench for Multiplier

`timescale 1ns/1ns

module Multiplier_tb;

	//Inputs
	reg [31:0] MP;
	reg [31:0] MC;
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

  /*wire [63:0] goldenProd;
  
  
  assign goldenProd = MP*MC;
  
  wire error;
  assign error = (goldenProd != P);
  
  integer i,j;*/
  
// 	initial clk=0;
//     always begin
//         #10
//         clk=~clk;
//     end
    
  	initial begin 
// 	$dumpfile("./hi.vcd");
// 	$dumpvars(0,dtb);

	rst=0; start=0;MP=15; MC=7; 
	#50 rst=1;
	#20 start=1;rst=0;
	#80 start = 0;
	
	#10000 $finish;
	end 
  
  	initial begin
	clk=1;
	forever #10 clk= ~clk;   
	end


    // initial begin
    //     start = 0;
    //     clk = 0;
    //     rst = 0;
        
    //     #10
        
    //     clk = 1;
    //     rst = 1;
        
    //     #10
        
    //     clk = 0;
    //     rst = 0;
        
        /*for (i=-2147483648; i<2147483648; i=i+1) begin
            for (j=-2147483648; j<2147483648; j=j+1) begin
                  MP = i;
                  MC = j;
                  start = 1;
                  #10
                  start = 0;
                  #800
                  if (error) begin
                    $display("Error: i=%d j=%d prod=%d\n", i, j, goldenProd);
                    $finish 
                  end 
            end 
        end 
                
    end*/
    
    // initial begin
    //     MP = 5;
    //     MC=  10;
        
    // end

endmodule
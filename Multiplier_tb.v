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

  // reg [63:0] goldenProd;
  
  
  // always @ (posedge start)begin
  //     goldenProd = MP*MC;
  // end  
  
  // wire error;
  // assign error = (goldenProd != P);
  
  // integer i,j;

  initial clk=1;
    always begin
        #10
        clk=~clk;
  end

	initial begin
	$dumpfile("./Multiplier.vcd");
 	$dumpvars(0,Multiplier_tb);
  end 

// event reset_trigger; 
// event reset_done; 


 



// initial begin 
// 	#1 -> reset_trigger; 
// end

// always @(negedge done) begin
// 	-> reset_trigger;
// end

// always @(reset_trigger) begin
// 	 @(negedge clk);
//    	 rst=1; start=1; 
//      @(negedge clk);
//    	 rst=0;  start=0; 
// end

  initial begin
	start = 0;
  rst = 0;
  MP = 15;
  MC = 7;
  #50
  rst = 1;
  #20
  start = 1;
  rst = 0;
  #80
  start = 0;

  #10000 $finish;


	//Inputs initialization
	// 	rst=0; start=0;
  //   MP=15; MC=7; 
	// #50 rst=1;
	// #20 start=1;rst=0;
	// #80 start = 0;
//2147483648
      /*for (i=1; i<10; i=i+1) begin
            for (j=1; j<10; j=j+1) begin
                  // start = 0;
                  // rst = 0;
                  MP = i;
                  MC = j;
                  #100000000000
                  // rst = 1;
                  // #10
                  // start = 1;
                  // rst = 0;
                  // #80
                  if (error) begin
                    $display("Error: i=%d j=%d prod=%d\n", i, j, goldenProd);
                    $finish; 
                  end 
                  
            end 
      end*/
    
    
    $display("Success");

	end

endmodule
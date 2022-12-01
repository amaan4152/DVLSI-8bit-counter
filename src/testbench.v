`timescale 1ns/1ps

module testbench();
	reg    	   clk, down, reset;
	wire [7:0] count;

	counter DUT1(.clk(clk), .down(down), .rst_n(reset), .count(count));	
	
	initial #500 $finish;	
	
	initial begin
		clk = 0;
		reset = 0;
		down = 0;
		
		forever	#5 clk = ~clk;
	end
	
	initial begin
		#10 reset = 1;
		#10 reset = 0;
		#10 reset = 1;
	end

	initial begin
		#25 down = 1;
		#25 down = 0;
	end

	initial begin
		$sdf_annotate("./results/counter.sdf", DUT1, , "./logs/counter_sdf.log", "MAXIMUM");
		$dumpfile("./dumpster/sim_tb_counter_500_POSTSYN.vcd");
		$dumpvars(0, testbench);
	end



endmodule

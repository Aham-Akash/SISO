module SISO_tb();
	reg i_clk;
	reg i_rst;
	reg i_serial_in;
	wire o_serial_out;
	
	SISO DUT (.i_clk(i_clk), .i_rst(i_rst), .i_serial_in(i_serial_in), .o_serial_out(o_serial_out));
	
	initial begin
		i_clk = 1'b0;
		forever #5 i_clk = ~i_clk;
	end
	
	initial begin
		i_rst = 1'b1; i_serial_in = 1'b1;
		#10 i_rst = 1'b0;
		#10 i_serial_in = 1'b0;
		#20 i_serial_in = 1'b1;
		#10 i_serial_in = 1'b0;
		#50 $finish;
	end
endmodule 
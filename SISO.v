module SISO #(parameter n = 4) (
	input i_clk,
	input i_rst,
	input i_serial_in,
	output reg o_serial_out
);
	reg [n-1:0] r_shift_reg;
	
	always @(posedge i_clk or posedge i_rst) begin
		if(i_rst) begin
			o_serial_out <= 0;
			r_shift_reg <= 0;
		end
		else begin
			o_serial_out <= r_shift_reg[n-1];
			r_shift_reg <= {r_shift_reg[n-2:0],i_serial_in};
		end
	end
endmodule 
module snake (
	input 	wire	clk,
	output  reg[0:6] display1,
	output  reg[0:6] display2
);
parameter TICKS_PER_PHASE = 10;
parameter ITER_N = 13;
int iteration = 0; 
int ticks_count = 0; 

always_ff @ (posedge clk)
begin 
	if (ticks_count == 0)
	begin
		case(iteration)
			0: display1 = 7'b0001101;
			1: display1 = 7'b0001100;
			2: display1 = 7'b0001000;
			3: display1 = 7'b0000000;
			4: display1 = 7'b0000001;
			5: display1 = 7'b0000011;
			6: display1 = 7'b1000011;
			7: display1 = 7'b1000010;
			8: display1 = 7'b1000000;
			9: display1 = 7'b0000000;
			10: display1 = 7'b0000001;
			11: display1 = 7'b0000101;
			12: display1 = 7'b0001101;		
			default : display1 = 7'b1111111;
		endcase

		case(iteration)
			0: display2 = 7'b0000000;
			1: display2 = 7'b0001000;
			2: display2 = 7'b0011000;
			3: display2 = 7'b0011001;
			4: display2 = 7'b0010001;
			5: display2 = 7'b0000001;
			6: display2 = 7'b0000000;
			7: display2 = 7'b1000000;
			8: display2 = 7'b1100000;
			9: display2 = 7'b1100001;
			10: display2 = 7'b0100001;
			11: display2 = 7'b0000001;
			12: display2 = 7'b0000000;		
			default : display2 = 7'b1111111;
		endcase

		iteration = iteration + 1;
		if (iteration == ITER_N) 
			iteration = 0;
	end
	ticks_count = ticks_count + 1;
	if (ticks_count == TICKS_PER_PHASE)
		ticks_count = 0;
end

endmodule
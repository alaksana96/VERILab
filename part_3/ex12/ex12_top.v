module ex12_top(CLOCK_50, SW, HEX0, HEX1, HEX2);

	input  				CLOCK_50;
	input	 	[9:0]		SW;
	
	output	[6:0] 	HEX0;
	output	[6:0] 	HEX1;
	output	[6:0] 	HEX2;
	
	wire 		[9:0] 	Q;
	
	ROM r(SW, CLOCK_50, Q);
	
	hex_to_7seg SEG0 (HEX0, Q[3:0]);
	hex_to_7seg SEG1 (HEX1, Q[7:4]);
	hex_to_7seg SEG2 (HEX2, {2'b00, Q[9:8]});
	
endmodule
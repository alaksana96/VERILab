module ex6_top (
	CLOCK_50,
	KEY,
	HEX0,
	HEX1, 
	HEX2,
	HEX3, 
	HEX4
);	
	input 	CLOCK_50;
	input		[1:0] KEY;
	output	[6:0] HEX0;
	output	[6:0] HEX1;
	output	[6:0] HEX2;
	output	[6:0] HEX3;
	output	[6:0] HEX4;
	
	wire[15:0] count;
	wire tick;
	wire en;
	
	clkdiv50	d50 (CLOCK_50, ~KEY[0], 50000, tick);
	
	//and a1 (en, ~KEY[0], tick);
		
	counter_16 C16 (CLOCK_50, ((tick)&(~KEY[0])), count, ~KEY[1]);

	
	wire [3:0] BCD_0, BCD_1, BCD_2, BCD_3, BCD_4;

	
	bin2bcd_16 BCD (count[15:0], BCD_0, BCD_1, BCD_2, BCD_3, BCD_4);
	
	hex_to_7seg	SEG0 (HEX0, BCD_0);
	hex_to_7seg	SEG1 (HEX1, BCD_1);
	hex_to_7seg	SEG2 (HEX2, BCD_2);
	hex_to_7seg	SEG3 (HEX3, BCD_3);
	hex_to_7seg	SEG4 (HEX4, BCD_4);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
endmodule
module ex14_top(CLOCK_50, SW, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT, HEX0, HEX1, HEX2, HEX3, HEX4);

	input					CLOCK_50;
	input		[9:0]		SW;
	
	output				DAC_CS;
	output				DAC_SDI;
	output				DAC_LD;
	output				DAC_SCK;
	output				PWM_OUT;
	
	output	[6:0] 	HEX0;
	output	[6:0]		HEX1;
	output	[6:0]		HEX2;
	output	[6:0]		HEX3;
	output	[6:0]		HEX4;
	
	wire		[3:0]		BCD0;
	wire		[3:0]		BCD1;
	wire		[3:0]		BCD2;
	wire		[3:0]		BCD3;
	wire		[3:0]		BCD4;
	
	wire 					tick;
	
	wire unsigned		[9:0]		OffsetAndA;
	
	reg unsigned		[9:0]		A;
	wire		[9:0]		D;
	
	wire		[23:0]	multedk;
	
	clkdiv50	clockdiv(CLOCK_50, 1, 5000, tick);

	CONSTMULT multk(SW[9:0], multedk[23:0]);
	
	bin2bcd_16 b2bcd({2'b0,multedk[23:10]}, BCD0, BCD1, BCD2, BCD3, BCD4);

	hex_to_7seg	SEG0 (HEX0, BCD0);
	hex_to_7seg	SEG1 (HEX1, BCD1);
	hex_to_7seg	SEG2 (HEX2, BCD2);
	hex_to_7seg	SEG3 (HEX3, BCD3);
	hex_to_7seg	SEG4 (HEX4, BCD4);
	
	
	always @ (posedge tick) //Creating the Addr Reg, clocked by tick
			A[9:0] <= OffsetAndA[9:0];
	
	
	assign OffsetAndA = SW[9:0] + A[9:0];
	
	ROM r(A, tick, D[9:0]);
	
	spi2dac sp (CLOCK_50, D[9:0], tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm p (CLOCK_50, D[9:0], tick, PWM_OUT);
	
endmodule
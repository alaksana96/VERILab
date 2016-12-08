module ex11_top (
	CLOCK_50,
	SW,
	DAC_CS,
	DAC_SDI,
	DAC_LD,
	DAC_SCK,
	PWM_OUT
);	
	input		[9:0] SW;
	input CLOCK_50;
	
	output 	DAC_CS;
	output	DAC_SDI;
	output	DAC_LD;
	output	DAC_SCK;
	output	PWM_OUT;
	
	wire tick;
	
	clkdiv50	d50 (CLOCK_50, 1, 5000, tick);
	
	spi2dac spi1 (CLOCK_50, SW[9:0], tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm p1 (CLOCK_50, SW[9:0], tick, PWM_OUT);

	
	
	endmodule

	
	
	
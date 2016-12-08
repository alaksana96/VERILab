module ex13_top(CLOCK_50, DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT);

	input  	CLOCK_50;
	
	output 	DAC_CS;
	output	DAC_SDI;
	output	DAC_LD;
	output	DAC_SCK;
	output	PWM_OUT;

	wire 		tick;
	wire		[9:0]		address;
	wire		[9:0]		Q;
	
	clkdiv50 clockdiv(CLOCK_50, 1, 5000, tick);
	
	counter_16 addresscounter(CLOCK_50, tick, address, 0);
	
	ROM r(address, tick, Q[9:0]);
	
	spi2dac sp (CLOCK_50, Q[9:0], tick, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);
	
	pwm p (CLOCK_50, Q[9:0], tick, PWM_OUT);
	
	
endmodule

%This generates the sine wave values used in the ROM, but puts them in a
%matrix
wave = zeros(0,1023);
twoWave = zeros(0,1023);
threeWave = zeros(0,1023);

for address = 0:1023
    angle = (address*2*pi)/1024;
    sine_value = sin(angle);
    data = (sine_value*0.5*1023) + 1023*0.5;
    if(mod(address,2) == 0)
        twoWave = [twoWave data];
    end
    
    if(mod(address,3) == 0)
        threeWave = [threeWave data];
    end
  
    wave = [wave data];
end

twoWave = [twoWave twoWave];
threeWave = [threeWave threeWave threeWave];

figure
subplot(3,1,1);
plot(wave)
title('Original Frequency')

subplot(3,1,2);
plot(twoWave)
title('2x Original Frequency')

subplot(3,1,3);
plot(threeWave)
title('3x Original Frequency')

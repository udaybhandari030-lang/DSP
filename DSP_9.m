clc;
clear;
close;

wp = input("Enter the pass band edge frequency(radians)= ");
ws = input("Enter the stop band edge frequency(radians)= ");
ks = input("Enter the stop band attenuation(dB)= ");

if 43<ks & ks<54 then
    N = (2*%pi*4)/(ws-wp);
else
    N = (2*%pi*7.8)/(ws-wp);
end

N = ceil(N);
wc = (wp + ws)/2;

[wft,wfm,fr] = wfir('lp',N+1,[wc/2,0],hamming(N+1));

figure(1)
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-150;1,50];
plot(2*fr,20*log10(wfm),'r')
xlabel('Normalized Digital Frequency w---->')
ylabel('Frequency Response in DB H(jw)---->')
title('Frequency Response for Low Pass FIR Filter')

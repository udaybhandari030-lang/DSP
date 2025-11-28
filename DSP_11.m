clc;
clear;
close;

fp = input("Enter the pass band edge frequency(Hz), fp=");
fs = input("Enter the stop band edge frequency(Hz), fs=");
Rp = input("Enter the pass band attenuation(dB), Rp=");
Rs = input("Enter the stop band attenuation(dB), Rs=");
Fs = input("Enter the sampling rate sample/sec, Fs=");

d1 = 10^(Rp/20) - 1;
d2 = 10^(Rs/20) - 1;
k = fp/fs;
N = ceil(log10((d2/d1))/(2*log10(k)));

wp = 2*%pi*fp/Fs;
ws = 2*%pi*fs/Fs;
op = tan(wp/2);
os = tan(ws/2);

N = ceil(log10((10^(0.1*Rs)-1)/(10^(0.1*Rp)-1))/(2*log10(os/op)));

[pol,z,g] = zpole(N,op,os,'low');
num = real(poly(z,'z'));
den = real(poly(pol,'z'));
num = num*g;

Hz = syslin('d',num,den);

[H,w] = frmag(num,den,256);

figure(1)
plot(2*w/%pi,20*log10(H),'r')
a = gca();
a.x_location = "origin";
a.y_location = "origin";
a.data_bounds = [0,-100;1,10];
xlabel('Normalized Digital Frequency w---->')
ylabel('Magnitude in dB 20log|H(w)|---->')
title('Magnitude Response of IIR Butterworth LPF')

cle;
clear:
close;
fp-input('Enter the pass band edge frequency(Hz), fp='); 
fs=input('Enter the stop band edge frequency(Hz), fs='); 
kp-input('Enter the pass band attenuation(db),kp='); 
ks-input('Enter the stop band attenuation(db), ks='); 
Fs-input('Enter the sampling rate sample/sec, Fs=');

d1-10^(kp/20);
d2-10^(ks/20);
d=sqrt((1/(d2^2))-1);
E-sqrt((1/(d1^2))-1);


wp=2*%pi*fp*1/Fs;
ws-2%pi*fs*1/Fs;
disp('Digital Pass band edge freq in rad/samples wp=',wp)
disp('Digital Stop band freq in rad/samples ws=',ws)

op=2*Fs*tan(wp/2);
os =2*Fs*tan(ws/2);

disp('Analog Pass Band Edge Freq in rad/sec op=',op)
disp('Analog Stop band Edge Freq in rad/sec os=',os)
N=log10(d/E)/log10(os/op);
oc= op/((E^2]^(1/(2* N)));
N= ceil(N);
disp('IIR Filter order N=',N);
disp('cutoff frequency in rad/seconds OC=',oc)
[pols,gn] = zpbutt(N,oc);
disp('Gain of analog filter',gn)
disp('poles of analog IIR butterworth LPF poles',pols)
HS=poly(gn,'s, coeff)/real(poly(pols, 's));
disp('Transfer function of Analog IIR Butterworth LPF H(S)=',HS)
z=poly(0,'z')
Hz-horner(HS,(2 Fs (z-1)/(z+1)))
num = coeff[Hz(2))
den = coeff[Hz(3))
Hz(2)=Hz(2)./den(3);
Hz(3)=Hz(3)./den(3);
disp('Transfer function of Digital IIR Butterworth HPF H(z)',Hz)
[Hw,w] frmag(1-Hz,256);
figure(1)
plot(2*w*%pi,20*log10(abs(Hw))):
xlabel('Digital Frequency w--->')
ylabel('Magnitude in dB 20log | H(w) |=')
title('Magnitude Response of IIR Butterworth HPF')

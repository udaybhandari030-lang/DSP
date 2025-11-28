clear;
clc;
close all;

s = poly(0,'s');
n = [s];
d = [s-0.9];
h = syslin('c',n./d);

plzr(h);

figure
bode(h);
title('Magnitude and Phase plot by Your Name')

disp('Length of impulse response required')
N = 6;

disp('Co-efficients of numerator (b):')
b = [1]

disp('Co-efficients of denominator (a):')
a = [1  -0.9]

x = [1 zeros(1,N-1)];

disp('Impulse response h[n]:')
h_imp = filter(b,a,x)
disp(h_imp)

clear;
clc;
close all;

j = sqrt(-1);

disp('The Input sequence is')
xn = input('The input sequence is : ');
N = length(xn);
Xn = zeros(1,N);
k = 0:N-1;
n = 0:N-1;

for k = 0:N-1
    Xk(k+1) = 0;
    for n = 0:N-1
        Xk(k+1) = Xk(k+1) + xn(n+1)exp(-j*2%pi*k*n/N);
    end
end

disp('The DFT sequence X(k) is')
disp(Xk);

n = 0:1:N-1;
xbs = abs(Xk);
disp('The absolute value is')
disp(xbs);

subplot(2,1,1);
stem(n,xbs);
xlabel('Length');
ylabel('Magnitude of X(k)');
title('Magnitude Spectrum');

an = phase(Xk);
xan = rad2deg(an);
disp('The angle value in radian is')
disp(an)
disp('The angle value in degrees is')
disp(xan)

subplot(2,1,2);
stem(n,xan);
xlabel('Length');
ylabel('Phase of X(k)');
title('Phase Spectrum (in degrees) by USN Name');

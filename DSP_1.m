clc;

clear all;

close all;

% a) unit sample signal or impulse signal

t1=-10:0.01:10;

y1=(t1==0);

subplot(5,2,1);

plot(t1,y1);

xlabel('time');

ylabel('amplitude');

title('unit sample signal');

% unit sample sequence or impulse signal

n1=-10:1:10; 

z1=(n1 == 0);

subplot(5,2,2);

stem(n1,z1);

xlabel('time');

ylabel('amplitude');

title('unit sample sequence by USN Name');

% b) unit step signal

t2=-10:0.01:10;

y2=(t2>=0);

subplot(5,2,3);

plot(t2,y2);

xlabel('time');

ylabel('amplitude');

title('unit step signal');

% unit step sequence

n2=-10:1:10;

z2=(n2>=0);

subplot(5,2,4);

stem(n2,z2);

xlabel('n');

ylabel('amplitude');

title('unit step sequence');

% c) exponential signal 
t3 = -10:1:10; 
y3=100*exp(0.2*t3); 
subplot(5,2,5); 
plot(t3,y3); xlabel('time'); 
ylabel('amplitude'); 
title('exponential signal');

% exponential sequence

n3=-10:1:10;

z3=100*exp(0.2*n3);

subplot(5,2,6);

stem(n3,z3);

xlabel('n');

ylabel('amplitude');

title('exponential sequence');

% d) sinusoidal signal

t4=-1:0.05:1;

y4=sin(2*pi*2*t4);

subplot(5,2,7);

plot(t4,y4);

xlabel('time');

ylabel('amplitude');

title('sinusoidal signal');

% sinusoidal sequence

n4=-1:0.05:1;

z4 = sin(2*pi*2*n4); 

subplot(5,2,8); 

stem(n4,z4);

xlabel('n');

ylabel('amplitude');

title('sinusoidal sequence');

% e) random signal
i = 6;
y5 = rand(i);

subplot(5,2,9); 

plot(y5);

xlabel('time');

ylabel('amplitude');

title('random signal');

%random sequence

i=6;

z5=rand(i);

subplot(5,2,10);

stem(z5);

xlabel('time');

ylabel('amplitude');

title('random sequence');

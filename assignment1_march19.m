clear; clc;
r=10^-5;
dl=1000;
ds=8050;
n=0.001;
g=9.8;
t = linspace(0,0.001,1000);
V=4*pi*(r^3)/3;
u=(ds*V*g/(6*pi*r*n))*(1-dl/ds)*(1-exp(-6*pi*r*n*t/(ds*V)));
plot(t,u,'g');
hold on;
k=10;
delt=0.001/k;  %increase value of k for better accuracy
T = linspace(0,0.001,k+1);
U= zeros(1,k+1);
for i=1:k
    U(i+1)=g*(1-dl/ds)*delt+U(i)*(1-6*pi*n*r*delt/(V*ds));
end
plot(T,U,'r');
hold off;
grid on;
xlabel('t'); ylabel('u');
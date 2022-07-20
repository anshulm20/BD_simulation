clc; clear;
T=100;
delt=0.001;
N=T/delt;   %=10^5
X=zeros([1 N+1]);
Y=X;
Z=X;
for i=2:N+1
    n = rand(1,3);
    n=2*n-1;     %to get range of (-1,1)
    X(i)=sqrt(6*delt)*n(1,1)+X(i-1);
    Y(i)=sqrt(6*delt)*n(1,2)+Y(i-1);
    Z(i)=sqrt(6*delt)*n(1,3)+Z(i-1);
end
msd=zeros(1,N/10+1);  % msd(1), msd when detta t=0 is zero
for i=1:(N/10)
    for j=1:N-i+1
    msd(i+1)=( (X(j+i)-X(j))^2 + (Y(j+i)-Y(j))^2 + (Z(j+i)-Z(j))^2 )/(N+1-i)+msd(i+1);
    end
end
tiledlayout(2,2);
nexttile;
plot(X,Y);
xlabel('X') ;                         %labelling axis
ylabel('Y');
nexttile;
x=(0:delt:10);
xx=x(1:100);  %fitting curve for 100 points
yy=msd(1:100);
f=polyfit(xx,yy,1);
y=polyval(f,x);
plot(x,msd);
xlabel('t') ;                         %labelling axis
ylabel('MSD');
fprintf('diffusitivity=%i',f(1)/6);
grid on;
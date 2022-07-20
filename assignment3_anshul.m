clc; clear;
T=10000;
delt=0.001;
N=T/delt;          %=10^7 for T=10000
r1=zeros([3 N+1]); 
r2=zeros([3 N+1]);
v=500;
r2(1,1)=sqrt(v);   %setting initial value of r2=[sqrt(v) 0 0]
data=zeros([1 N+1]);
rms=0;
for i=2:N+1
    n1 = 2*rand(3,1)-1;               %random vector with values in range [-1,1]
    n2 = 2*rand(3,1)-1;
    R=r2(:,i-1)-r1(:,i-1);
    data(i-1)=norm(R);                %data will be plotted on y axis, R_end-end
    rcap=norm(R)/v;
    K=(3-rcap^2)/(1-rcap^2)*delt/v;   %unnecessary variable, makes further eqation more readable
    for j=1:3                         %iterating for the values of r2, r1
        r1(j,i)=r1(j,i-1)+n1(j)*sqrt(delt*6)+K*R(j);
        r2(j,i)=r2(j,i-1)+n2(j)*sqrt(delt*6)-K*R(j);
    end
    rms=rms+data(i-1)*data(i-1)/(N+1);%sqrt will be done later
end
data(N+1)=norm(r2(:,N+1)-r1(:,N+1));  %setting final value for data, as the loop cares till data(N) only
rms=rms+data(N+1)^2/(N+1);    %similarly for rms
rms=sqrt(rms);                        %actual rms, root mean square
t=linspace(0,T,N+1);
plot(t,data,'b');
yline(rms,'LineWidth',2);             %horizontal line with width 2
xlabel('t') ;                         %labelling axis
ylabel('R_{end-end}');
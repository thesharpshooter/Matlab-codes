clear all;
clc;
n=5000;
dx=0.01;
x0=0;
r=.45;
T(:,1)=0;
T(:,100)=100;
T(1,:)=25;
x(1)=0;
x(100)=1;
xlabel('Distance (x)');
ylabel('Temperature (T)');
title('Variation of Temperature with Distance at different time till steady state');
for i=2:n 
    for j=2:99
         x(j)=x0+dx*j;
        T(i,j)=r*T(i-1,j+1)+(1-2*r)*T(i-1,j)+r*T(i-1,j-1);
    end
    T(i,1)=0;
    T(i,100)=100;
    hold on
    plot(x,T(i,:));
end
plot(x,T(n,:),'r.')

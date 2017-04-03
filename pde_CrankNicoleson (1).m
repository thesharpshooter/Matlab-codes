clear all;
clc;
n=10000;
r=.25;
m=0;
x_plot=0;
T=0;
b=0;
for i=1:101
    x_plot(i)=(i-1)*.01;
end
for k=1:101
    T(k,1)=25;
end


y_plot=0;
y_plot=T;
hold on
xlabel('Distance (x)');
ylabel('Temperature (T)');
title('Variation of Temperature with Distance at different time till steady state');
plot(x_plot,y_plot)


m(1,1)=2+2*r;
m(1,2)=-r;
for k=3:99
    m(1,k)=0;
end

m(99,98)=-r;
m(99,99)=2+2*r;
for l=1:97
    m(99,l)=0;
end

for i=2:98
    for j=1:99
        if (j==i+1)
            m(i,j-1)=2+2*r;
            m(i,j-2)=-r;
            m(i,j)=-r;
        end
        if j~=i+1
            m(i,j)=0;
        end
    end
end

mat=inv(m);

for t=1:n
    for a=2:100
        b(a-1,1)=r*T(a-1,1)+(2-2*r)*T(a,1)+r*T(a+1,1);
    end
     b(99,1)=b(99,1)+r*100;
    Tn=0;
    y_plot=0;
    Tn=mat*b;
    y_plot(1,1)=0;
    for k=2:100
        y_plot(k,1)=Tn(k-1,1);
    end
    y_plot(101,1)=100;
    if t==n
        plot(x_plot,y_plot,'r*');
    else
        plot(x_plot,y_plot);
    end
    T=y_plot;
end
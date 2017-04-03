clear all;
clc;
n=5000;
r=.5;
m=0;
x_plot=0;
T=0;
for i=1:101
    x_plot(i)=(i-1)*.01;
end
for k=1:99
    T(k,1)=25;
end
T(99,1)=T(99,1)+r*100;
y_plot=0;
y_plot(1)=25;
for k=2:100
    y_plot(k)=T(k-1);
end
y_plot(100)=y_plot(100)-r*100;
y_plot(101)=25;

hold on
xlabel('Distance (x)');
ylabel('Temperature (T)');
title('Variation of Temperature with Distance at different time till steady state');
plot(x_plot,y_plot)


m(1,1)=1+2*r;
m(1,2)=-r;
for k=3:99
    m(1,k)=0;
end

m(99,98)=-r;
m(99,99)=1+2*r;
for l=1:97
    m(99,l)=0;
end

for i=2:98
    for j=1:99
        if (j==i+1)
            m(i,j-1)=1+2*r;
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
    Tn=0;
    y_plot=0;
    Tn=mat*T;
    y_plot(1)=0;
    for k=2:100
        y_plot(k)=Tn(k-1);
    end
    y_plot(101)=100;
    if t==n
        plot(x_plot,y_plot,'r*');
    else
        plot(x_plot,y_plot);
    end
    T=Tn;
    T(99)=T(99)+r*100;
end
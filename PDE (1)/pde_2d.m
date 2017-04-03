clear all;
clc;
T=0;
r=.25;
n=1000;

for i=1:101
    T(1,i)=0;
    T(101,i)=0;
    T(i,1)=100;
    T(i,101)=100;
end

for i=1:101
    x_plot(i)=(i-1)*.01;
end

for i=2:100
    for j=2:100
        T(i,j)=25;
    end
end
for t=1:n
    for i=2:100
        for j=2:100
            T(i,j)=(r*T(i+1,j)+r*T(i-1,j)+T(i,j+1)+T(i,j-1))/(2+2*r);
        end
    end
end  
hold on;
for k=1:101   
    plot(x_plot,T(:,k));
end
  
    
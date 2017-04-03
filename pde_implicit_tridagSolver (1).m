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
for i=1:98
    fac=m(i+1,i)/m(i,i);
    k=0;
    if i==98
        k=99;
    else
        k=i+2;
    end
    for j=i:k
        m(i+1,j)=m(i+1,j)-fac*m(i,j);
    end
end
    
for t=1:n
    Tn=0;
    y_plot=0;
    for i=99:-1:1
        sum=0;
        for k=i+1:99
            sum=sum+m(i,k)*Tn(k,1);
        end
            Tn(i,1)=(T(i,1)-sum)/m(i,i);
    end
    
    y_plot(1)=0;
    for k=2:100
        y_plot(k)=Tn(k-1);
    end
    y_plot(101)=100;
        
    plot(x_plot,y_plot)
     T=Tn;
     T(99,1)=T(99,1)+r*100;
end
 

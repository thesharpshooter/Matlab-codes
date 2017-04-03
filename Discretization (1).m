clear all;
clc;
xi=0;
xf=1;
n=1000;
dx=(xf-xi)/n;
xaxis=0;
yaxis=0;
y0=100;
y=0;
y1=6*dx*(y0-1)+y0;
xaxis(1)=0;
xaxis(2)=dx;
yaxis(1)=y0;
yaxis(2)=y1;

for i=2:n-1
    y=(12*y1*y1*dx*dx-6*y1*dx+2*y1-y0)/(1-6*dx);
    yaxis(i+1)=y;
    xaxis(i+1)=xi+dx*(i);
    y0=y1;
    y1=y;
    yaxis;
end
yaxis(n+1)=yaxis(n);
xaxis(n+1)=1;

yaxis

plot(xaxis,yaxis)



%Nasruddin_Moia_Exercise_3_3

clc;
clear;
xt=0.24062696159732;
xo=0.4;
x1=0.5;
x=[];

for n=1:100
x(n)=x1-((tanh(6*0.17*x1)-tanh(6*0.17*xo))/(x1-xo));
xo=x1;
x1=x(n);
end

display(x)

xoo=0.4;
x11=0.5;
xx=[];

for n=1:100
if tanh(6*0.17*x11)*tanh(6*0.17*xoo)>0
xx(n)=x1-((tanh(6*0.17*x11)-tanh(6*0.17*xoo))/(x11-xoo));
xoo=x11;
x11=xx(n);
end

if tanh(6*0.17*x11)*tanh(6*0.17*xoo)<0
x1=xo;
x(n)=x1;
end
end

display(xx)
%%Nasruddin-Moia
%%Exercise 2.2

clc;
clear;
format long;

xo=0.4; %this is the xo we are trying to reduce to x*
xf=0.24062696159733; %this is the accurate result we want to achieve
B=0.17; %beta
do=xf-xo; %first error value 
xn=[]; %a vector showing all the changes in x per iteration
dn=[]; %a vector showing all the changes in 
c=1;
n=0;

result=[];

while xo>xf
n=n+1
xn(n)=tanh(6*B*xo);
dn(n)=abs(do)*exp(log((6*B/(cosh(6*B*xo))^2)));
c=exp(log((6*B/(cosh(6*B*xo))^2)));
xo=xn(n);
do=dn(n);
result(n,:)=[n,xo,do,c];
end
colname=["n","xn","dn","c"];
res=array2table(result,"VariableNames",colname);
display(res);
semilogx(result(:,1),result(:,3))




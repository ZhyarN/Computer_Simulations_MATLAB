%Nasruddin_Moia_Exercise_3_2


clc;
clear;
format long;

x=[1];%this is an array of xo, and will contain all x values later
m=1000;%number of iterations
nn=2;%initially, we assume an n value, and later compare it to the value
% of the expected n accprding to our handout calculation (here denoted by
% nn)



for i=2:m+1;%this calculates Newton_Ralphson for all x values
   x(i)=x(i-1)-(x(i-1)/nn);
end

n=sum(x)/(1-10^-15);%this is the algorithm that finds what amount n needs 
%to be given the amount of iterations we have, as calculated in the handout


mm=[0:1000];
display(x);
display(n);
semilogx(mm,x);
title("Using NR method for function f(x)=x^n for different values of n");
xlabel("Number of Iterations");
ylabel("The calculated root value of x^n by Newton Raphson");

%{
Discussion: According to the graph, the values of n which are smaller are
to reach the root value of zero with less iterations than larger n values.
This is to be expected because for smaller n-values our incrimental
decrease in the value of x (which is f(x)/f'(x)) would be larger (given in
this situation f(x)/f'(x) is proportional to 1/n, meaning inverse
proportionality). Thus, the higher the n would be, the slower we reach the
root value, and the more iterations we would need.
%}
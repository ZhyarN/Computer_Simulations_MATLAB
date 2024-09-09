%%Nasruddin_Moia
%%Exercise 2.1

clc;

clear;

x=20;%%number of iterations wanted

p(x) = 10024010101010101;%%I chose this because it has more than 16 significant digits

for n=x-1:-1:1
   p(n) = (exp(1) - p(n+1)) / (n+1);
end

for n=1:x-1
   fprintf('p_%2d = %0.16f\n',n,p(n)) 
end

%{Discussion: the idea here of the backward iteration is that no matter
%what value we give to pn+1 as an initial condition, the iterations going
%backwards would decrease in its error rate each time an iteration goes by
%the value of n!, so the more iterations we do, the more the error
%decreases by a factorial value. So, as long as our iterations (here is x) 
%are more, we will converge to the true value in the p1.  
%} 
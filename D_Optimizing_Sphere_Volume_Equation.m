clc;
clear;
format long;

r=1;
result=[];

for i=1:16
h=10^-i;
A1=4*pi*(((r+h)^3)-(r^3))/3;
A2=4*pi*((3*h*(r^2))+(3*r*(h^2))+(h^3))/3;
result(i,:)=[r,h,A1,A2,A1-A2];
end

colname=["r","h","Bad Area","Good Area","Difference"];
res=array2table(result,"VariableNames",colname);
display(res);

%{
Discussion: The reason why A1 fails to provie results after h=10^-16 while
A2 can still provide results lies in the fact that A1 initially calculates
the value of ((r+h)^3), which could be n-significant digits, and then
subtracts (r^3) out of it, making it less significant digits than n. This
means that for any result that we get in if ((r+h)^3)-(r^3) were to be 
super small, we only arrive at it after taking out the r^3 (which here 
always=1) out of ((r+h)^3), where (r+h)^3) could be a very high significant
value, i.e. 1.0000000012 (12 significant digits, while we only need
0.00000000012 (which is only 2 significant digits)! We run out earlier. So,
in this case, we would arrive at eps in the steps much earlier than
arriving at eps at the result.

The second method of calculating area, A2, is much better, since it
basically calculates each significance digit one at a time, and then adding
them all together. So, unlike A1, it calculates significance digits that
are n, and the result would be a higher significant digits. i.e. (3*h*(r^2)
could be 0.3, (3*r*(h^2)) could be 0.02, and (h^3) could be 0.003, where
each value has only 1 significant digit, and then added together would be
0.323, which has three significant digit. So, here, the results would be
the one which arrives first at eps, not the equation variables.
%}
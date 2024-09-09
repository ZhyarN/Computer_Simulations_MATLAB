clc;
clear;

format long;

%{
here, we try to loop i for fe=2^-i to see at which value of i would the
machine treat 1+2^-1=1, meaning that it treats the function (only when 
added to one as zero
%}
i=1;
fe2=1;

while 1+fe2~=1.000000000000000
fe2=2^-i;
i=i+1;
end

display(fe2);
display(i);

%{
Discussion:normally, 2^-n is treated as zero only when n=-1076 (as we have
seen in Exercise 1.1, but here, since we are adding 1 to it each time, the
significant digits is calculated from the 1, not from the first number
after the 0.000s of 2^-n, so the number here is far less than only
computing the function alone, which here n=54
%}

%{
here we try the same thing as before, only this time for the function
1+10^-j~=1 and see when is that function become 1.
%}

j=1;
fe10=1;

while 1+fe10~=1.000000000000000
fe10=10^-j;
j=j+1;
end

display(fe10);
display(j);

%{
Discussion: the same discussion as before holds here as well, only that
when calculated 10^-n individually, it is treated as zero when n=325, but
here given we add it to one, at n=-17 it stops, since it goes beyond
10^-16 digits of precision.

Note, we know 10^-n=0 at n=325 through the following function:
x=1;
k=1;
while x~=0
x=10^-k;
k=k+1;
end
display(x);
display(k);
%}

display(fe2-eps);
display(fe10-eps);


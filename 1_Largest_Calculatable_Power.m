clc;
clear;

format long;

%here, we try to loop n for 2^n by increasing n by 1 each time to see at
%which n is the function equal to infinity, which is the max precision of
%matlab for this function
n=1;
fn=1;
while isinf(fn)~=true
fn=2^n;
n=n+1;
end
display("n represents the value of 2^n in matlab when fn becomes infinite");
display(fn);
display(n);


%here, we also do the same procedure, but instead we do it for 2^-m and
%check when would it be equal to zero for the minimum precision of 2^-m
m=1;
fm=1;
while fm~=0
fm=2^-m;
m=m+1;
end
display("m represents the value of 2^-m in matlab when fm becomes zero")
display(fm);
display(m);
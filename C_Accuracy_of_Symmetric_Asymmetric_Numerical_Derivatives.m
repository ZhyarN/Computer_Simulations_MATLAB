clc;
clear;
%for f(x)=cos(x) and x=1
d=[];

for i=1:10
h=10^(-i); % step-sizes
x = 1;
dex =-sin(1); %this is the exact value of f'(1)=sin(1)
d1=((cos(x+h)-cos(x))/h)+(h*cos(x)/2)-((h^2)*sin(x)/6);%forward asymmertric formula (x+h) for O(h^4)
d2=((cos(x+(2*h))-cos(x))/2*h)+(h*cos(x))-(2*(h^2)*sin(x)/3);%forward asymmetric formula (x+2h) for O(h^4)
d3=((cos(x)-cos(x-h))/h)-(h*cos(x)/2)-((h^2)*sin(x)/6);%backward asymmetric formula (x-h) for O(h^4)
d4=((cos(x)-cos(x-(2*h)))/2*h)-(h*cos(x))-(2*(h^2)*sin(x)/3);%backward asymmetric formula (x-2h) for O(h^4)
d5=((cos(x+h)-cos(x-h))/2*h)-(((h^2)*sin(x))/6);%symmetric formula (x+h) and (x-h) for O(h^4)
d6=((cos(x+(2*h))-cos(x-(2*h)))/4*h)-((2*(h^2)*sin(x))/3);%symmetric formula (x+2h) and (x-2h) for O(h^4)
d(i,:)=[h,dex,d1,(d1-dex)/dex,d2,(d2-dex)/dex,d3,(d3-dex)/dex,d4,(d4-dex)/dex,d5,(d5-dex)/dex,d6,(d6-dex)/dex];
end
colname={'h','dex','d1','(d1-dex)/dex','d2','(d2-dex)/dex','d3','(d3-dex)/dex','d4','(d4-dex)/dex','d5','(d5-dex)/dex','d6','(d6-dex)/dex'};
display("the followings in the table refere to these terms: h:incriment, dex:exact value of f'(x), d1: forward method for f(x+h), d2: forward method for f(x+2h), d3: backward method for f(x-h), d4: backward method for f(x-2h) d5: symmetric method for f(x-h) and f(x+h), d6: symmetric method for f(x+2h) and f(x-2h), any_d-dex/dex: reltive error for that method compared to the exact value");
t=array2table(d,'VariableNames',colname);
display(t);

%plot(d(:,1),abs(d(:,4)))
%plot(d(:,1),abs(d(:,6)))
%plot(d(:,1),abs(d(:,8)))
%plot(d(:,1),abs(d(:,10)))
%plot(d(:,1),abs(d(:,12)))
%plot(d(:,1),abs(d(:,14)))


%{
Discussion:

From Plot.1 shows that the forward method (x+h) is most accurate after h^-4
, and the accuracy gets lower and lower afterwards. Which is better than
using the same forward method but for for f(x+2h) (see Plot 2) where in 
even its most accurate case (h^-1), we have a relative error of already >
1.

Same is also true for Plot 3, in which backward method (x-h) has relatively
the same accuracy rate as forward (x+h) and also has it at h^-4 incriment.
Meaning that the two methods are comparably most accurate at this rate and
the accuracy starts declining afterwards. With the story for backward
method for f(x-2h) (Plot 4) also being the same as forward f(x+2h), 
where the accuracy rate at h^-1 is already the most accuracy, being around 
1. 

For plots 5 & 6, it is also the case that for the symmetric methods, both
at f(x+h)&f(x-h) and f(x+2h)&f(x-2h) the most accurate value we have to the
exact value is at the first incriment, where h=10^-1, and it is already
close to 1. 
%}





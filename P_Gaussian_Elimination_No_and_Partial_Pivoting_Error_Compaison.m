%Nasruddin_Moia_Exercise_11.1

clc;
clear;
d1=[0]; d2=[0]; d3=[0];
noimprov=5;%This is the number of iterative improvements we would like the results to be improved by.

for N=2:100

    A=rand(N,N)*10;
    x=rand(N,N)*10;

    b=A*x;

    [y]=gaussel(A,b);%original Gaussel
    [z]=pivgaussel(A,b);%Partial pivot algorithm

    d11=(y-x);
    d22=((A\b)-x);
    d33=(z-x);
    d1(N)=max(d11(:));
    d2(N)=max(d22(:));
    d3(N)=max(d33(:));

    for i=1:noimprov
    btily=A*y;
    btilz=A*z;

    [dely]=gaussel(A,btily-b);
    [delz]=gaussel(A,btilz-b);

    y=y-dely;
    z=z-delz;

    d111=(y-x);
    d333=(z-x);
    dd1(N)=max(d111(:));
    dd3(N)=max(d333(:));
    end
end

figure(1)
loglog((1:100),d1,'red');

hold on
loglog((1:100),d2,'green');

hold on
loglog((1:100),d3,'blue')

title('The performance of the three schemes')
xlabel('number of dimensions of A');
ylabel('del: the difference between original and computed x');
legend("Gaussel","A\b","Partial Pivot Gaussel");


figure(2)

tiledlayout(2,1)

nexttile
loglog((1:100),d1,'red');
hold on
loglog((1:100),dd1,'green');
title('original gaussel vs iterative improvement gaussel');
xlabel('number of dimensions of A');
ylabel('del: difference btw original and computed x');
legend("original","Iterative Improved");

nexttile
loglog((1:100),d3,'red');
hold on
loglog((1:100),dd3,'green');
title('original partial pivot gaussel vs iterative improvement partial pivot gaussel');
xlabel('number of dimensions of A');
ylabel('del: difference btw original and computed x');
legend("original","Iterative Improved")






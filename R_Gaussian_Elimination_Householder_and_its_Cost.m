%Nasruddin_Moia_Exercise_12

clc;
clear;

%% Part A



%number of dimensions
n=3;

%a random nxn matrix 
A1=(rand(n,n)*20)-10;
b1=rand(n,1);

%a matrix in which no pivot gaussel fails
A2=(rand(n,n)*20)-10; A2(1,1)=0;
b2=rand(n,1);

%results of normal matrix
x1=gaussel(A1,b1);
x2=Householder(A1,b1);


%results of no-pivot-fail matrix
x11=gaussel(A2,b2);
x22=Householder(A2,b2);


display("The solution of Gaussel and Householder for normal A b values");
display("Gaussel results:");
display(x1);
display("Householder results:");
display(x2);

display("The solution of Gaussel and Householder for no-pivot fail A b values");
display("Gaussel results:");
display(x11);
display("Householder results:");
display(x22);

%Discussion: we discussed earlier how if we don't pivot gaussel it would
%fail, and it is because it divides the rows below by the n-th element of
%the n-th row in each n-iteration. So, if that element happens to be zero,
%as it is in this case for element no.1, it would lead to a zero division
%and thus fails. So, that's why we see no results unless we pivot.
%On the other hand, Householder reduction is composed of finding sigma
%values that is the norm of the column of interest. So, even if the first
%element is zero, we add sigma to it making it unzero, and thus not falling
%into the same issue as with the gaussel function. So, no divisions by zero.


%__________________________________________________________________________
%% Part B

errorg=[0];
errorh=[0];

for n=2:120
    A3=(rand(n,n)*20)-10;
    x333=rand(n,1);
    b3=A3*x333;

    x111=gaussel(A3,b3);
    x222=Householder(A3,b3);

    errorg(n)=norm(x111(:)-x333(:))/norm(x333(:));
    errorh(n)=norm(x222(:)-x333(:))/norm(x333(:));
    
    
end

figure(1);
plot(1:120,log(errorg),'red');
hold on
plot(1:120,log(errorh),'green');
legend("gaussel","householder");
title("Plot of logarithm of relative error of Gaussel vs Householder for each iteration")
xlabel("n")
ylabel("relative error")


%% Part C
Z=[0]; ZZ=[0];
for n=2:200
    A4=(rand(n,n)*20)-10;
    b4=rand(n,1);

    Z(n)=costgaussel(A4,b4);

    ZZ(n)=costHouseholder(A4,b4);


end
figure(2)
plot(1:200,Z,'red');
hold on
plot(1:200,ZZ,"blue");
title("The computational cost of all arithmetic operations by increasing dimensions");
legend("Gaussel","Householder");
xlabel("n");
ylabel("number of arithmetic operations");

%Discussion: The computational cost of the algorithm for both householder
%and gaussel increases exponentially as we increase n. The only difference
%is that the gaussel is computationally less costy than householder, yet
%householder is more stable and more accurate. Thus, it is a matter of
%prefering accuracy and stability over functionallity and quickness or vice
%versa.


%Nasruddin_Moia_Exercise_11_2

clc;
clear;
N=50;
A=rand(N,N)*10;
x1=rand(N,1)*10;
x2=rand(N,2)*10;

b1=A*x1;
b2=A*x2;

Fe=@(x) (x-1)+ (x*(x-1)); %this is the formula for the computational cost of elimination step
Fs=@(x) (x*(x+1))/2; %this is the formula for the computational cost of backsubstitution step

%CC=computational Cost

a_cal=Fe(N); %amount of CC for elimination according to the formula
b_cal=Fs(N); %amount of CC for backsubstitution according to the formula
T_cal=a_cal+b_cal; % %amount of CC total according to the formula

display("The Computational cost according to the formula for elimination, backsubstitution, and total respectively are:");
display(a_cal);
display(b_cal);
display(T_cal);

[a_com1,b_com1,T_com1]=gausselcost(A,b1); %This function is modified Gausel to only return computational cost
[a_com2,b_com2,T_com2]=gausselcost(A,b2);

display("The Computational cost according to the counters when m=1 for elimination, backsubstitution, and total respectively are:");
display(a_com1);
display(b_com1);
display(T_com1);

display("The Computational cost according to the counters when m=2 for elimination, backsubstitution, and total respectively are:");
display(a_com2);
display(b_com2);
display(T_com2);


%The point that there is no difference in computational cost for m=1 and
%m=2 is in the algorithm itself. The idea is that the algorithm does all
%these loop operations on A, changing its values, and the corresponding one
%or more b only changes within those A loop changes. So, given that A is
%only a function of n, we would only observe changes in the computational
%cost whenever n changes. So, when we add more b vectors, they are adding
%to m, not n, and since the loop is not about m and treats all ms in each
%loop equally, thus we would have the same computational cost.
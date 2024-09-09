%Nasruddin_Moia_Exercise7.2_Group1

clear;
clc;
close all;

%Our initial values and constants
phi_o=0.45;
g=9.81;
l=1;
v_o=0;
R=0.15;
t(1)=0;
tmax=15;

%stepzise tau that we define
tau=0.0001;


%the matrix that containss all our values, which correspond to matrix y
y(1,:)=[phi_o v_o];


maxstep=1000000000000000000;

for i=1:maxstep
    y(i+1,:)=y(i,:)+(tau*[y(i,2),(-g*(sin(y(i,1))/l)-(R*y(i,2)))]);%this is f(t,y(t))


    t(i+1)=t(i)+tau;



    if t(i+1)>tmax
        break;
    end
end

%estimating the period of the oscillation from calculating zeros after 1
%oscillation
zero_oscillation=[];

for i=2:length(t)-1
    if y(i,2)>y(i+1,2) && y(i,2)>y(i-1,2)
        zero_oscillation=[zero_oscillation,t(i)];
    end
end
period=zero_oscillation(2)-zero_oscillation(1);
display("the estimated period of oscillation is:");
display(period);




figure(1)
scatter(t,y(:,1),'blue');
title("The angle Phi against change in Time");
xlabel("Time measured in seconds");
ylabel("Angle Phi measured in radians")
figure(2)
scatter(y(:,2),y(:,1),'red');
title("The angle Phi against change in Angular Velocity");
xlabel("Angular Velocity measured in rad/s");
ylabel("Angle Phi measured in radians");


%Discussion:Like mentioned earlier, with higher values of tau, we see due
%to the Euler method an increase rate of angular velocity per oscillation.
%So, in this graph, it would be okay to see that the angular velovity and
%the angle decrease per time, since we have a friction factor which
%decreases them per time. We can observe such behaviours in lower tau
%values such as 0.0001. But if we increase the value of tau, such as to
%0.05, we can see the increase that we discussed earlier, changing the
%behaviour of the graph as it goes and introducing errors that make the
%graph seem otherwise (somethimes as it increases in angular velovity per
%time). So, we need lower taus to get accurate results with Euler Explicit
%Scheme.
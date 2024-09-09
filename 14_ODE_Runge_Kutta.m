%Nasruddin_Moia_Exercise_8.1_Group1

clc;
clear;
close all;
%initial conditions and time interval
xo=0; yo=1; dxo=1; dyo=0; t(1)=0; tmax=8;

%the value of vector y
y(1,:)=[xo yo dxo dyo];

%tau
tau=0.001; maxstep=1000000;

%values of m and n
mn=[1,1; 3,3; 5,5; 5,3];

result11=rungekutta(y,mn(1,1),mn(1,2),t,tmax,tau,maxstep);
result33=rungekutta(y,mn(2,1),mn(2,2),t,tmax,tau,maxstep);
result55=rungekutta(y,mn(3,1),mn(3,2),t,tmax,tau,maxstep);
result53=rungekutta(y,mn(4,1),mn(4,2),t,tmax,tau,maxstep);

figure(1)
scatter(result11(:,1),result11(:,2),'red','DisplayName','m=1,n=1');
hold on;
scatter(result33(:,1),result33(:,2),'blue','DisplayName','m=3,n=3');
hold on;
scatter(result55(:,1),result55(:,2),'green','DisplayName','m=5,n=5');
hold on;
scatter(result53(:,1),result53(:,2),'yellow','DisplayName','m=5,n=3');
legend('show')
title("The resultant graph of each different m and n values for the ODE given");
xlabel("x(t)");
ylabel("y(t)");
hold off;


%part2_____________________________________________________________________

mmnn=[3,3; 5,3];
for i=1:2
    a=((mmnn(i,2)+1)/(mmnn(i,1)+1))^(1/(mmnn(i,2)+1));
    b=1;
    eqn = @(x, y) (x/a)^(mmnn(i,2)+1) + (y/b)^(mmnn(i,1)+1) - 1;
    figure(i+1);
    ezplot(eqn, [-a, a, -b, b]);
    xlabel("x(t)");
    ylabel("y(t)")
    if i==1
        title("The graph of the equation given m=3, n=3")
    else
        title("The graph of the equation m=5, n=3")
    end  

    %add legend and titles
    figure(3+i);
    ezplot(eqn, [-a, a, -b, b]);
    hold on;
    if i==1
        scatter(result33(:,1),result33(:,2),"yellow");
        title("comparison of m=3 n=3 Runge-Kutta resulted graph with the original function graph")
    else
        scatter(result53(:,1),result53(:,2),"yellow");
        title("comparison of m=5 n=3 Runge-Kutta resulted graph with the original function graph")
    end
end



%The Runge-Kutta scheme of power 5_________________________________________
function aa=rungekutta(y,m,n,t,tmax,tau,maxstep)


for i=1:maxstep
    k1(i,:)=tau*[y(i,3), y(i,4),m*y(i,4)*(y(i,2)^(m-1)),-n*y(i,3)*(y(i,1)^(n-1))];
    
    z1(i,:)=y(i,:)+((2/9) .*k1(i,:));
    k2(i,:)=tau*[z1(i,3),z1(i,4),m*z1(i,4)*(z1(i,2)^(m-1)),-n*z1(i,3)*(z1(i,1)^(n-1))];
    
    z2(i,:)=y(i,:)+((1/12) .*k1(i,:))+((1/4) .*k2(i,:));
    k3(i,:)=tau*[z2(i,3),z2(i,4),m*z2(i,4)*(z2(i,2)^(m-1)),-n*z2(i,3)*(z2(i,1)^(n-1))];
    
    z3(i,:)=y(i,:)+((69/128) .*k1(i,:))+((243/128) .*k2(i,:)) + ((135/64) .*k3(i,:));
    k4(i,:)=tau*[z3(i,3),z3(i,4),m*z3(i,4)*(z3(i,2)^(m-1)),-n*z3(i,3)*(z3(i,1)^(n-1))];

    z4(i,:)=y(i,:)+((17/12) .*k1(i,:))+((27/4) .*k2(i,:)) + ((27/5) .*k3(i,:))+((16/15) .*k4(i,:));
    k5(i,:)=tau*[z4(i,3),z4(i,4),m*z4(i,4)*(z4(i,2)^(m-1)),-n*z4(i,3)*(z4(i,1)^(n-1))];
    
    
    y(i+1,:)=y(i,:)+((1/9)*k1(i,:))+((9/20)*k3(i,:))+((16/45)*k4(i,:))+((1/12)*k5(i,:));


    t(i+1)=t(i)+tau;



    if t(i+1)>tmax
        break;
    end
    
end
aa=y;
end



%Nasruddin_Moia_Exercise_8.2_Group1

clc;
clear;
close all;
%initial conditions and time interval
x1o=[-1,0.5]; x2o=[-1,3]; x3o=[1.5,-1]; dx1o=[0,0]; dx2o=[0,0]; dx3o=[0,0];
m1=3; m2=3; m3=3;
t(1)=0; tmax=10; tau=0.001; maxstep=100000;


%the value of vector y
y(1,:)=[x1o, x2o, x3o, dx1o, dx2o, dx3o];
yy(1,:)=[x1o, x2o, x3o, dx1o, dx2o, dx3o];

for i=1:maxstep

    %RungeKutta 4
    k1(i,:)=tau*[y(i,7), y(i,8), y(i,9), y(i,10),y(i,11),y(i,12), ((-m2/norm([y(i,1),y(i,2)]-[y(i,3),y(i,4)])^3)*(y(i,1)-y(i,3)))+((-m3/norm([y(i,1),y(i,2)]-[y(i,5),y(i,6)])^3)*(y(i,1)-y(i,5))), ((-m2/norm([y(i,1),y(i,2)]-[y(i,3),y(i,4)])^3)*(y(i,2)-y(i,4)))+((-m3/norm([y(i,1),y(i,2)]-[y(i,5),y(i,6)])^3)*(y(i,2)-y(i,6))), ((-m1/norm([y(i,3),y(i,4)]-[y(i,1),y(i,2)])^3)*(y(i,3)-y(i,1)))+((-m3/norm([y(i,3),y(i,4)]-[y(i,5),y(i,6)])^3)*(y(i,3)-y(i,5))), ((-m1/norm([y(i,3),y(i,4)]-[y(i,1),y(i,2)])^3)*(y(i,4)-y(i,2)))+((-m3/norm([y(i,3),y(i,4)]-[y(i,5),y(i,6)])^3)*(y(i,4)-y(i,6))), ((-m1/norm([y(i,5),y(i,6)]-[y(i,1),y(i,2)])^3)*(y(i,5)-y(i,1)))+((-m2/norm([y(i,5),y(i,6)]-[y(i,3),y(i,4)])^3)*(y(i,5)-y(i,3))), ((-m1/norm([y(i,5),y(i,6)]-[y(i,1),y(i,2)])^3)*(y(i,6)-y(i,2)))+((-m2/norm([y(i,5),y(i,6)]-[y(i,3),y(i,4)])^3)*(y(i,6)-y(i,4)))];
        
    z1(i,:)=y(i,:)+((1/2) .*k1(i,:));
    k2(i,:)=tau*[z1(i,7), z1(i,8), z1(i,9), z1(i,10),z1(i,11),z1(i,12), ((-m2/norm([z1(i,1),z1(i,2)]-[z1(i,3),z1(i,4)])^3)*(z1(i,1)-z1(i,3)))+((-m3/norm([z1(i,1),z1(i,2)]-[z1(i,5),z1(i,6)])^3)*(z1(i,1)-z1(i,5))), ((-m2/norm([z1(i,1),z1(i,2)]-[z1(i,3),z1(i,4)])^3)*(z1(i,2)-z1(i,4)))+((-m3/norm([z1(i,1),z1(i,2)]-[z1(i,5),z1(i,6)])^3)*(z1(i,2)-z1(i,6))), ((-m1/norm([z1(i,3),z1(i,4)]-[z1(i,1),z1(i,2)])^3)*(z1(i,3)-z1(i,1)))+((-m3/norm([z1(i,3),z1(i,4)]-[z1(i,5),z1(i,6)])^3)*(z1(i,3)-z1(i,5))), ((-m1/norm([z1(i,3),z1(i,4)]-[z1(i,1),z1(i,2)])^3)*(z1(i,4)-z1(i,2)))+((-m3/norm([z1(i,3),z1(i,4)]-[z1(i,5),z1(i,6)])^3)*(z1(i,4)-z1(i,6))), ((-m1/norm([z1(i,5),z1(i,6)]-[z1(i,1),z1(i,2)])^3)*(z1(i,5)-z1(i,1)))+((-m2/norm([z1(i,5),z1(i,6)]-[z1(i,3),z1(i,4)])^3)*(z1(i,5)-z1(i,3))), ((-m1/norm([z1(i,5),z1(i,6)]-[z1(i,1),z1(i,2)])^3)*(z1(i,6)-z1(i,2)))+((-m2/norm([z1(i,5),z1(i,6)]-[z1(i,3),z1(i,4)])^3)*(z1(i,6)-z1(i,4)))];

    z2(i,:)=y(i,:)+((1/2) .*k2(i,:));
    k3(i,:)=tau*[z2(i,7), z2(i,8), z2(i,9), z2(i,10),z2(i,11),z2(i,12), ((-m2/norm([z2(i,1),z2(i,2)]-[z2(i,3),z2(i,4)])^3)*(z2(i,1)-z2(i,3)))+((-m3/norm([z2(i,1),z2(i,2)]-[z2(i,5),z2(i,6)])^3)*(z2(i,1)-z2(i,5))), ((-m2/norm([z2(i,1),z2(i,2)]-[z2(i,3),z2(i,4)])^3)*(z2(i,2)-z2(i,4)))+((-m3/norm([z2(i,1),z2(i,2)]-[z2(i,5),z2(i,6)])^3)*(z2(i,2)-z2(i,6))), ((-m1/norm([z2(i,3),z2(i,4)]-[z2(i,1),z2(i,2)])^3)*(z2(i,3)-z2(i,1)))+((-m3/norm([z2(i,3),z2(i,4)]-[z2(i,5),z2(i,6)])^3)*(z2(i,3)-z2(i,5))), ((-m1/norm([z2(i,3),z2(i,4)]-[z2(i,1),z2(i,2)])^3)*(z2(i,4)-z2(i,2)))+((-m3/norm([z2(i,3),z2(i,4)]-[z2(i,5),z2(i,6)])^3)*(z2(i,4)-z2(i,6))), ((-m1/norm([z2(i,5),z2(i,6)]-[z2(i,1),z2(i,2)])^3)*(z2(i,5)-z2(i,1)))+((-m2/norm([z2(i,5),z2(i,6)]-[z2(i,3),z2(i,4)])^3)*(z2(i,5)-z2(i,3))), ((-m1/norm([z2(i,5),z2(i,6)]-[z2(i,1),z2(i,2)])^3)*(z2(i,6)-z2(i,2)))+((-m2/norm([z2(i,5),z2(i,6)]-[z2(i,3),z2(i,4)])^3)*(z2(i,6)-z2(i,4)))];

    
    z3(i,:)=y(i,:)+k3(i,:);
    k4(i,:)=tau*[z3(i,7), z3(i,8), z3(i,9), z3(i,10),z3(i,11),z3(i,12), ((-m2/norm([z3(i,1),z3(i,2)]-[z3(i,3),z3(i,4)])^3)*(z3(i,1)-z3(i,3)))+((-m3/norm([z3(i,1),z3(i,2)]-[z3(i,5),z3(i,6)])^3)*(z3(i,1)-z3(i,5))), ((-m2/norm([z3(i,1),z3(i,2)]-[z3(i,3),z3(i,4)])^3)*(z3(i,2)-z3(i,4)))+((-m3/norm([z3(i,1),z3(i,2)]-[z3(i,5),z3(i,6)])^3)*(z3(i,2)-z3(i,6))), ((-m1/norm([z3(i,3),z3(i,4)]-[z3(i,1),z3(i,2)])^3)*(z3(i,3)-z3(i,1)))+((-m3/norm([z3(i,3),z3(i,4)]-[z3(i,5),z3(i,6)])^3)*(z3(i,3)-z3(i,5))), ((-m1/norm([z3(i,3),z3(i,4)]-[z3(i,1),z3(i,2)])^3)*(z3(i,4)-z3(i,2)))+((-m3/norm([z3(i,3),z3(i,4)]-[z3(i,5),z3(i,6)])^3)*(z3(i,4)-z3(i,6))), ((-m1/norm([z3(i,5),z3(i,6)]-[z3(i,1),z3(i,2)])^3)*(z3(i,5)-z3(i,1)))+((-m2/norm([z3(i,5),z3(i,6)]-[z3(i,3),z3(i,4)])^3)*(z3(i,5)-z3(i,3))), ((-m1/norm([z3(i,5),z3(i,6)]-[z3(i,1),z3(i,2)])^3)*(z3(i,6)-z3(i,2)))+((-m2/norm([z3(i,5),z3(i,6)]-[z3(i,3),z3(i,4)])^3)*(z3(i,6)-z3(i,4)))];

    y(i+1,:)=y(i,:)+((1/6)*((k1(i,:)+(2*k2(i,:))+(2*k3(i,:))+k4(i,:))));


    %RungeKutta5
    kk1(i,:)=tau*[yy(i,7), yy(i,8), yy(i,9), yy(i,10),yy(i,11),yy(i,12), ((-m2/norm([yy(i,1),yy(i,2)]-[yy(i,3),yy(i,4)])^3)*(yy(i,1)-yy(i,3)))+((-m3/norm([yy(i,1),yy(i,2)]-[yy(i,5),yy(i,6)])^3)*(yy(i,1)-yy(i,5))), ((-m2/norm([yy(i,1),yy(i,2)]-[yy(i,3),yy(i,4)])^3)*(yy(i,2)-yy(i,4)))+((-m3/norm([yy(i,1),yy(i,2)]-[yy(i,5),yy(i,6)])^3)*(yy(i,2)-yy(i,6))), ((-m1/norm([yy(i,3),yy(i,4)]-[yy(i,1),yy(i,2)])^3)*(yy(i,3)-yy(i,1)))+((-m3/norm([yy(i,3),yy(i,4)]-[yy(i,5),yy(i,6)])^3)*(yy(i,3)-yy(i,5))), ((-m1/norm([yy(i,3),yy(i,4)]-[yy(i,1),yy(i,2)])^3)*(yy(i,4)-yy(i,2)))+((-m3/norm([yy(i,3),yy(i,4)]-[yy(i,5),yy(i,6)])^3)*(yy(i,4)-yy(i,6))), ((-m1/norm([yy(i,5),yy(i,6)]-[yy(i,1),yy(i,2)])^3)*(yy(i,5)-yy(i,1)))+((-m2/norm([yy(i,5),yy(i,6)]-[yy(i,3),yy(i,4)])^3)*(yy(i,5)-yy(i,3))), ((-m1/norm([yy(i,5),yy(i,6)]-[yy(i,1),yy(i,2)])^3)*(yy(i,6)-yy(i,2)))+((-m2/norm([yy(i,5),yy(i,6)]-[yy(i,3),yy(i,4)])^3)*(yy(i,6)-yy(i,4)))];
        
    zz1(i,:)=yy(i,:)+((2/9) .*kk1(i,:));
    kk2(i,:)=tau*[zz1(i,7), zz1(i,8), zz1(i,9), zz1(i,10),zz1(i,11),zz1(i,12), ((-m2/norm([zz1(i,1),zz1(i,2)]-[zz1(i,3),zz1(i,4)])^3)*(zz1(i,1)-zz1(i,3)))+((-m3/norm([zz1(i,1),zz1(i,2)]-[zz1(i,5),zz1(i,6)])^3)*(zz1(i,1)-zz1(i,5))), ((-m2/norm([zz1(i,1),zz1(i,2)]-[zz1(i,3),zz1(i,4)])^3)*(zz1(i,2)-zz1(i,4)))+((-m3/norm([zz1(i,1),zz1(i,2)]-[zz1(i,5),zz1(i,6)])^3)*(zz1(i,2)-zz1(i,6))), ((-m1/norm([zz1(i,3),zz1(i,4)]-[zz1(i,1),zz1(i,2)])^3)*(zz1(i,3)-zz1(i,1)))+((-m3/norm([zz1(i,3),zz1(i,4)]-[zz1(i,5),zz1(i,6)])^3)*(zz1(i,3)-zz1(i,5))), ((-m1/norm([zz1(i,3),zz1(i,4)]-[zz1(i,1),zz1(i,2)])^3)*(zz1(i,4)-zz1(i,2)))+((-m3/norm([zz1(i,3),zz1(i,4)]-[zz1(i,5),zz1(i,6)])^3)*(zz1(i,4)-zz1(i,6))), ((-m1/norm([zz1(i,5),zz1(i,6)]-[zz1(i,1),zz1(i,2)])^3)*(zz1(i,5)-zz1(i,1)))+((-m2/norm([zz1(i,5),zz1(i,6)]-[zz1(i,3),zz1(i,4)])^3)*(zz1(i,5)-zz1(i,3))), ((-m1/norm([zz1(i,5),zz1(i,6)]-[zz1(i,1),zz1(i,2)])^3)*(zz1(i,6)-zz1(i,2)))+((-m2/norm([zz1(i,5),zz1(i,6)]-[zz1(i,3),zz1(i,4)])^3)*(zz1(i,6)-zz1(i,4)))];

    zz2(i,:)=yy(i,:)+((1/12) .*kk1(i,:))+((1/4) .*kk2(i,:));
    kk3(i,:)=tau*[zz2(i,7), zz2(i,8), zz2(i,9), zz2(i,10),zz2(i,11),zz2(i,12), ((-m2/norm([zz2(i,1),zz2(i,2)]-[zz2(i,3),zz2(i,4)])^3)*(zz2(i,1)-zz2(i,3)))+((-m3/norm([zz2(i,1),zz2(i,2)]-[zz2(i,5),zz2(i,6)])^3)*(zz2(i,1)-zz2(i,5))), ((-m2/norm([zz2(i,1),zz2(i,2)]-[zz2(i,3),zz2(i,4)])^3)*(zz2(i,2)-zz2(i,4)))+((-m3/norm([zz2(i,1),zz2(i,2)]-[zz2(i,5),zz2(i,6)])^3)*(zz2(i,2)-zz2(i,6))), ((-m1/norm([zz2(i,3),zz2(i,4)]-[zz2(i,1),zz2(i,2)])^3)*(zz2(i,3)-zz2(i,1)))+((-m3/norm([zz2(i,3),zz2(i,4)]-[zz2(i,5),zz2(i,6)])^3)*(zz2(i,3)-zz2(i,5))), ((-m1/norm([zz2(i,3),zz2(i,4)]-[zz2(i,1),zz2(i,2)])^3)*(zz2(i,4)-zz2(i,2)))+((-m3/norm([zz2(i,3),zz2(i,4)]-[zz2(i,5),zz2(i,6)])^3)*(zz2(i,4)-zz2(i,6))), ((-m1/norm([zz2(i,5),zz2(i,6)]-[zz2(i,1),zz2(i,2)])^3)*(zz2(i,5)-zz2(i,1)))+((-m2/norm([zz2(i,5),zz2(i,6)]-[zz2(i,3),zz2(i,4)])^3)*(zz2(i,5)-zz2(i,3))), ((-m1/norm([zz2(i,5),zz2(i,6)]-[zz2(i,1),zz2(i,2)])^3)*(zz2(i,6)-zz2(i,2)))+((-m2/norm([zz2(i,5),zz2(i,6)]-[zz2(i,3),zz2(i,4)])^3)*(zz2(i,6)-zz2(i,4)))];

    
    zz3(i,:)=yy(i,:)+((69/128) .*kk1(i,:))+((243/128) .*kk2(i,:)) + ((135/64) .*kk3(i,:));
    kk4(i,:)=tau*[zz3(i,7), zz3(i,8), zz3(i,9), zz3(i,10),zz3(i,11),zz3(i,12), ((-m2/norm([zz3(i,1),zz3(i,2)]-[zz3(i,3),zz3(i,4)])^3)*(zz3(i,1)-zz3(i,3)))+((-m3/norm([zz3(i,1),zz3(i,2)]-[zz3(i,5),zz3(i,6)])^3)*(zz3(i,1)-zz3(i,5))), ((-m2/norm([zz3(i,1),zz3(i,2)]-[zz3(i,3),zz3(i,4)])^3)*(zz3(i,2)-zz3(i,4)))+((-m3/norm([zz3(i,1),zz3(i,2)]-[zz3(i,5),zz3(i,6)])^3)*(zz3(i,2)-zz3(i,6))), ((-m1/norm([zz3(i,3),zz3(i,4)]-[zz3(i,1),zz3(i,2)])^3)*(zz3(i,3)-zz3(i,1)))+((-m3/norm([zz3(i,3),zz3(i,4)]-[zz3(i,5),zz3(i,6)])^3)*(zz3(i,3)-zz3(i,5))), ((-m1/norm([zz3(i,3),zz3(i,4)]-[zz3(i,1),zz3(i,2)])^3)*(zz3(i,4)-zz3(i,2)))+((-m3/norm([zz3(i,3),zz3(i,4)]-[zz3(i,5),zz3(i,6)])^3)*(zz3(i,4)-zz3(i,6))), ((-m1/norm([zz3(i,5),zz3(i,6)]-[zz3(i,1),zz3(i,2)])^3)*(zz3(i,5)-zz3(i,1)))+((-m2/norm([zz3(i,5),zz3(i,6)]-[zz3(i,3),zz3(i,4)])^3)*(zz3(i,5)-zz3(i,3))), ((-m1/norm([zz3(i,5),zz3(i,6)]-[zz3(i,1),zz3(i,2)])^3)*(zz3(i,6)-zz3(i,2)))+((-m2/norm([zz3(i,5),zz3(i,6)]-[zz3(i,3),zz3(i,4)])^3)*(zz3(i,6)-zz3(i,4)))];

    zz4(i,:)=yy(i,:)+((17/12) .*kk1(i,:))+((27/4) .*kk2(i,:)) + ((27/5) .*kk3(i,:)) + ((16/15) .*kk4(i,:));
    kk5(i,:)=tau*[zz4(i,7), zz4(i,8), zz4(i,9), zz4(i,10),zz4(i,11),zz4(i,12), ((-m2/norm([zz4(i,1),zz4(i,2)]-[zz4(i,3),zz4(i,4)])^3)*(zz4(i,1)-zz4(i,3)))+((-m3/norm([zz4(i,1),zz4(i,2)]-[zz4(i,5),zz4(i,6)])^3)*(zz4(i,1)-zz4(i,5))), ((-m2/norm([zz4(i,1),zz4(i,2)]-[zz4(i,3),zz4(i,4)])^3)*(zz4(i,2)-zz4(i,4)))+((-m3/norm([zz4(i,1),zz4(i,2)]-[zz4(i,5),zz4(i,6)])^3)*(zz4(i,2)-zz4(i,6))), ((-m1/norm([zz4(i,3),zz4(i,4)]-[zz4(i,1),zz4(i,2)])^3)*(zz4(i,3)-zz4(i,1)))+((-m3/norm([zz4(i,3),zz4(i,4)]-[zz4(i,5),zz4(i,6)])^3)*(zz4(i,3)-zz4(i,5))), ((-m1/norm([zz4(i,3),zz4(i,4)]-[zz4(i,1),zz4(i,2)])^3)*(zz4(i,4)-zz4(i,2)))+((-m3/norm([zz4(i,3),zz4(i,4)]-[zz4(i,5),zz4(i,6)])^3)*(zz4(i,4)-zz4(i,6))), ((-m1/norm([zz4(i,5),zz4(i,6)]-[zz4(i,1),zz4(i,2)])^3)*(zz4(i,5)-zz4(i,1)))+((-m2/norm([zz4(i,5),zz4(i,6)]-[zz4(i,3),zz4(i,4)])^3)*(zz4(i,5)-zz4(i,3))), ((-m1/norm([zz4(i,5),zz4(i,6)]-[zz4(i,1),zz4(i,2)])^3)*(zz4(i,6)-zz4(i,2)))+((-m2/norm([zz4(i,5),zz4(i,6)]-[zz4(i,3),zz4(i,4)])^3)*(zz4(i,6)-zz4(i,4)))];


    yy(i+1,:)=yy(i,:)+((1/9)*((kk1(i,:)+((9/20)*kk3(i,:))+((16/45)*kk4(i,:))+((1/12)*kk4(i,:)))));

%{

    error = max(norm(yy(i+1,:)-y(i+1,:))./norm(y(i+1,:)))/(2^4 - 1);
    
    if error>10e-11
        tau=tau*0.9*((10e-11/error)^(1/4+1));
    else
        tau=tau*1.1*((10e-11/error)^(1/4+1));
    end
    
%}   
    t(i+1)=t(i)+tau;

    if t(i+1)>tmax
        break;
    end

end

scatter(y(:,1),y(:,2), 'red','DisplayName','Body 1');
hold on
scatter(y(:,3),y(:,4), 'blue','DisplayName','Body 2');
hold on
scatter(y(:,5),y(:,6), 'green','DisplayName','Body 3');
title("The trajectory of the three bodies");
legend('show');
xlabel('x(t)');
ylabel('y(t)');



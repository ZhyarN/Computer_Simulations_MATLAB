%Nasruddin_Moia_Exercise_6_1_Group_1

clc;
clear;


%Initials__________________________________________________________________
L = 1;
N = 100;
a = L/N;



%Part1_____________________________________________________________________


f1=@(x) (7*sin(2*pi*x/L)) + (3*sin(4*pi*x/L)) + (2*sin(6*pi*x/L));
f2=@(x) (7*cos(2*pi*x/L)) + (3*cos(4*pi*x/L)) + (2*cos(6*pi*x/L));

x = linspace(0, L, N);

y1 = f1(x);
y2 = f2(x);

k=linspace(0,2*pi/L,N);

yk1 = DFTT(x,y1,N);%coeffiecients of fx1
yk2 = DFTT(x,y2,N);%coeffiecients of fx2



magnitude1=abs(yk1);
phase1=angle(yk1);
display("magnitudes of the first function");
display(magnitude1);
display("phases of the first function");
display(phase1);

magnitude2=abs(yk2);
phase2=angle(yk2);
display("magnitudes of the second function");
display(magnitude2);
display("phases of the second function");
display(phase2);

figure(1)
plot(k,magnitude1,'b--')
hold on
plot(k,magnitude2,'g--')
title("The values of magnitude of the functions fx1 in blue and fx2 in green against k");
xlabel("k values");
ylabel("magnitude values")

figure(2)
plot(k,phase1,'b--')
hold on
plot(k,phase2,'g--')
title("The values of phases of the functions fx1 in blue and fx2 in green against k");
xlabel("k values");
ylabel("phases values")

%Discussion: the magnitudes of both function correspond to each other only
%differ in the intervals between k=0.25 until 6.09, but they converge back
%at a slight instance, and that is when k is around pi (3.10 here), and the
%reason for that is because the sin and cosine are periodic functions,
%which their values align roughly periodically (here roughly at 0, pi and 
% 2*pi). 




%part2_____________________________________________________________________


nonz1=nonzerocof(k,magnitude1,phase1);
display("the table depicts the k values and their non-zero magnitudes and the angle multiple of pi for fx1")
display(nonz1);
nonz2=nonzerocof(k,magnitude2,phase2);
display("the table depicts the k values and their non-zero magnitudes and the angle multiple of pi for fx2")
display(nonz2);




%part3_____________________________________________________________________

gk1=[];%the new values of magnitude of fx1 against phase of fx2
gk2=[];%the new values of magnitude of fx2 against phase of fx1
for i=1:length(k);
    gk1(i)=magnitude1(i)*exp(1i*phase2(i));
    gk2(i)=magnitude2(i)*exp(1i*phase1(i));
end

yg1=real(IFTT(k,gk1,N));%gx1 values
yg2=real(IFTT(k,gk2,N));%gx2 values

figure(3)
plot(y1,y2,'r--');
hold on
plot(yg1,yg2,'b--');
title("plotting the original values of fx1 against fx2 (red) with gx1 against gx2 (blue)")
xlabel("fx1,gx1");
ylabel("fx2,gx2");

%Discussion: what we observe is a 90 degree shift from the original y
%shapes that we have, and this is because we are exchanging the values of
%the angles of the cosine function into the sin function and vice versa.
%The shift happens because while originally the cosine function would be 1
%at an angle 0, it would now be 0 at the angle of sin, and the opposite is
%true for the sine function. Thus, their values would reverse, leading to a
%change in phase and resulting in a right angle rotation to the right.





%functions_________________________________________________________________

function a = DFTT(x,y,N) %this is a function for DFT_______________________
    a=[];
    fy=[];
    for j=0:N-1
        for o=0:N-1
        fy(j+1,o+1)=exp(-1i*2*pi*(o)*(j)/N);
        end
    end
    a=(1/(N^0.5))*(fy*transpose(y));
end


function b=IFTT(k,yk,N)%this is the IDFT___________________________________
    b=[];
    fx=[];
    for j=0:N-1
        for o=0:N-1
        fx(j+1,o+1)=(exp(1i*2*pi*(j)*(o)/N));
        end
    end
    b=1/(N^0.5)*(fx*transpose(yk));

end

function z=nonzerocof(kk,mag,pha)%this function provides back all the coeffieints and angles which have non-zero magnitude

    res=[];
    for i=1:length(kk)
        if mag(i)~=0
            res(i,:)=[kk(i);mag(i);pha(i)/pi];
        else
            continue
        end
    end
    z=res;
      
end

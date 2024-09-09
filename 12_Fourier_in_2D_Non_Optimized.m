%Nasruddin_Moia_Exercise_6_2_Group_1

clc;
clear;

%Initials__________________________________________________________________
M=6;
N=4;

x=rand(M,N);



%Part1_____________________________________________________________________
xx=real(IFT(FT(x,M,N),M,N));

display("The initial matrix we have is:");
display(x);
display("The matrix after it has been transformed and returned is:");
display(xx);
display("to check if there is any difference, we can subtract them, which results in:");
display(x-xx);

%Discussion: Although they are each other's inverses, we loose some
%precision when we transform it and inverse transform it. That's why we get
%a difference in results which is to the power of e-15, which is around
%matlab precision.



%Part2_____________________________________________________________________

load('Matrices.mat');

[MM,NN]=size(I1);

Fk1=FT(I1,MM,NN);
Fk2=FT(I2,MM,NN);

magnitude1=abs(Fk1);
phase1=angle(Fk1);

magnitude2=abs(Fk2);
phase2=angle(Fk2);

Gk1=[];
Gk2=[];

for p=1:M
    for q=1:N
    Gk1(p,q)=magnitude1(p,q)*exp(1i*phase2(p,q));
    Gk2(p,q)=magnitude2(p,q)*exp(1i*phase1(p,q));
    end
end

II1=real(IFT(Gk1,MM,NN));
II2=real(IFT(Gk2,MM,NN));

figure(1)
imagesc(I1);
title("Graph of I1");
figure(2)
imagesc(I2)
title("Graph of I2");
figure(3)
imagesc(II1);
title("Graph of I1 after we transformed it using the phase of I2")
figure(4)
imagesc(II2);
title("Graph of I2 after we transformed it using the phase of I1");

%Discussion: unfortunately, I couldn't run the results to see the
%difference since my laptop couldn't perform the task.But with changes in
%the phase, it is possible that the result is a rotational change like the
%previous example in 6_1.



%Fourier_Function__________________________________________________________

function a=FT(x,M,N)


XF=[];

for p=0:M-1
    for q=0:N-1
    z=0;
        for m=0:M-1
            for n=0:N-1
            z=z+(x(m+1,n+1)*exp(-1i*2*pi*p*m/M)*exp(-1i*2*pi*q*n/N));
            end
        end
        XF(p+1,q+1)=z;
    end
end
a=XF;
end




%Inverse_Fourier_Function__________________________________________________

function b=IFT(k,M,N)


INF=[];

for m=0:M-1
    for n=0:N-1
    z=0;
        for p=0:M-1
            for q=0:N-1
            z=z+(k(p+1,q+1)*exp(1i*2*pi*p*m/M)*exp(1i*2*pi*q*n/N));
            end
        end
        INF(m+1,n+1)=(1/(M*N))*z;
    end
end
b=INF;
end





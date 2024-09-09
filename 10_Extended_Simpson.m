%Nasruddin_Moia_3_Simpson_Extended
clc;
clear;
format long;

N=10;

cof=[];%creates a loop for the coefficients of Simpson
for i=1:N+1
    if i==1 || i==N+1
        cof(i)=1;
    else
        if mod(i,2)==0;
            cof(i)=4;

        elseif mod(i,2)==1;
            cof(i)=2;
        end
    end
end


h=1/N;
res=0;

resus=[];

for n=1:10 %calculates the integral through Extended Simpson for each n and n+1
x=linspace(n,n+1,N+1);
    for i=1:N+1
    res=res+((h/3)*(1/(x(i)*exp(x(i))))*cof(i));
    end
    resus(n)=res;
end

total=0;%creates the summation mentioned for all the results according to the given n
for j=1:length(resus)
    total=total+(((-1)^j)*resus(j));

end

semilogx(1:10,abs(resus))
xlabel("n");
ylabel("absolute value of the terms of the sum");
display(total);

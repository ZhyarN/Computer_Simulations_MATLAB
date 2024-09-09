%Nasruddin_Moia_Exercise_11_1_function


function [x] = pivgaussel(A,b)
[m,n]=size(A);
if m~=n | n~=size(b,1), error('not a square matrix problem'); end;

B=[A b];
N=size(B,2);




for k=1:n-1
    P=0;
    for j=k:n
        if abs(B(j,k))>=P
            P=abs(B(j,k));
            Pe=j;
        end
    end
    B([Pe,k],:)=B([k,Pe],:);
    
    fac=1/B(k,k);
    for i=k+1:n
        fac1=fac*B(i,k);
        B(i,k)=0;
        B(i,k+1:N)=B(i,k+1:N)-B(k,k+1:N)*fac1; 
    end
end





% Solution by backsubstitution :
x=zeros(size(b)); % predefinition of x
for k=n:-1:1
  x(k,:)=B(k,n+1:N);
  for j=k+1:n
    x(k,:)=x(k,:)-B(k,j)*x(j,:);
  end
  x(k,:)=x(k,:)/B(k,k);
end
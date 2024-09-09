%Nasruddin_Moia_Exercise_11_2_function

%This is an adjusted Gaussel that only provides back the computational cost
%of each calculation step of the given Gaussel

function [compcost1,compcost2,compcostT] = gausselcost(A,b)

[m,n]=size(A);
if m~=n | n~=size(b,1), error('not a square matrix problem'); end;

B=[A b];
N=size(B,2);

% bring the matrix into triangular form (Gauss elimination):

compcost1=0;%the computational cost of the elimination step


for k=1:n-1,    % loop over columns where the zeros will appear
  fac=1/B(k,k);
  compcost1=compcost1+1;

  for i=k+1:n   % loop over rows where subtractions take place
    fac1=fac*B(i,k);% factor
    compcost1=compcost1+1;
    B(i,k)=0; % new zero by construction
    B(i,k+1:N)=B(i,k+1:N)-B(k,k+1:N)*fac1;% subtraction
    compcost1=compcost1+1;
  end
end

% Solution by backsubstitution :
compcost2=0; %the computational cost of the backsubstitution step

x=zeros(size(b)); % predefinition of x
for k=n:-1:1
  x(k,:)=B(k,n+1:N);

  for j=k+1:n
    x(k,:)=x(k,:)-B(k,j)*x(j,:);
    compcost2=compcost2+1;
  end
  x(k,:)=x(k,:)/B(k,k);
  compcost2=compcost2+1;

end

compcostT=compcost1+compcost2; %the total computational cost
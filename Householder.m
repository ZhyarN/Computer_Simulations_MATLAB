function [x] = Householder(B,b)
z=length(B);
I=eye(z);
II=tril(ones(z,z));

R(:,:)=B;

for i=1:z-1 %My householder reduction algorithm
x(:,i)=R(:,i).*II(:,i);
sigma=norm(x(:,i));
s=elsign(x(i,:));
sige=s*sigma.*I(:,i);
u(:,i)=transpose(x(:,i)-sige);
P(:,:,i)=I-((u(:,i)*transpose(u(:,i))/(0.5.*norm(u(:,i))^2)));
R=P(:,:,i)*R;
end


Q=P(:,:,1);
for i=2:z-1
    Q=P(:,:,i)*Q;
end


Q=transpose(Q);

[m,n]=size(B);
x_i=zeros(size(b));
BB=[R transpose(Q)*b];
N=size(BB,2);

for k=n:-1:1
  x_i(k,:)=BB(k,n+1:N);
  for j=k+1:n
    x_i(k,:)=x_i(k,:)-BB(k,j)*x_i(j,:);
  end
  x_i(k,:)=x_i(k,:)/BB(k,k);
  end


[x]=x_i;

function r=elsign(a)
if a>=0
    r=+1;
else
    r=-1;
end
end

end
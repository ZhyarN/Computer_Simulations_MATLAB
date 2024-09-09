function cost1 = costHouseholder(B,b)
z=length(B);
I=eye(z);
II=tril(ones(z,z));

R(:,:)=B;

cost=0;

for i=1:z-1 %My householder reduction algorithm

x(:,i)=R(:,i).*II(:,i);
cost=cost+length(R(:,i));

sigma=norm(x(:,i));
cost=cost+length(x(:,i));
cost=cost+length(x(:,i))-1;
cost=cost+1;

s=elsign(x(i,:));


sige=s*sigma.*I(:,i);
cost=cost+1;
cost=cost+length(I(:,i));

u(:,i)=transpose(x(:,i)-sige);
cost=cost+length(x(:,i));

P(:,:,i)=I-((u(:,i)*transpose(u(:,i))/(0.5.*norm(u(:,i))^2)));
cost=cost+length(x(:,i));%for the squares in the norm
cost=cost+length(x(:,i))-1;%for the additions in the norm
cost=cost+1;%for the 0.5 power of the norm
cost=cost+1;%for the norm squared
cost=cost+1;%for the 0.5*norm
cost=cost+length(u(:,i))^2;%for the vector dot product above
cost=cost+length(u(:,i))^2;%for the elemental division of under and above
cost=cost+length(u(:,i))^2;%for the subtraction of I from uut/norm(u)

R=P(:,:,i)*R;
cost=cost+(length(P)*length(R)*length(R));%for the dot product between P and R, only multiplictions
cost=cost+(length(P)*length(R)*(length(R)-1));%for the additions happening in the dot product for each element
end


Q=P(:,:,1);

for i=2:z-1
    Q=P(:,:,i)*Q;
    cost=cost+(length(P)*length(Q)*length(Q));%for each time we multiply a P by Q
    cost=cost+(length(P)*length(Q)*(length(Q)-1));%for the additions happening in the dot product for each element
end


Q=transpose(Q);

[m,n]=size(B);
x_i=zeros(size(b));
BB=[R transpose(Q)*b];
cost=cost+length(Q)^2;%we do matrix by vector multiplications
cost=cost+(length(Q)*(length(Q)-1));%number of additions in the above matrix vector product
N=size(BB,2);

for k=n:-1:1
  x_i(k,:)=BB(k,n+1:N);
  for j=k+1:n
    x_i(k,:)=x_i(k,:)-BB(k,j)*x_i(j,:);
    cost=cost+length(x(j,:));%for the multiplication
    cost=cost+length(x(k,:));%for the subtraction
  end
  x_i(k,:)=x_i(k,:)/BB(k,k);
  cost=cost+length(x(k,:));%for the division

  end


[x]=x_i;

cost1=cost;

function r=elsign(a)
if a>=0
    r=+1;
else
    r=-1;
end
end

end
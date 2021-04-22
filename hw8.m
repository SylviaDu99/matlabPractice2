rand('seed',314);
x=rand(40,1);
y=rand(40,1);
class=[2*x<y+0.5]+1;
A1=[x(find(class==1)),y(find(class==1))];
A2=[x(find(class==2)),y(find(class==2))];


cvx_begin
variable z(2)
variable b
minimize(norm(z))
subject to
    A1*z+b<=-1
    A2*z+b>=1
cvx_end

plot(A1(:,1),A1(:,2),'*','MarkerSize',6)
hold on
plot(A2(:,1),A2(:,2),'d','MarkerSize',6)
hold on
fimplicit(@(x, y) z(1)*x+z(2)*y+b, [0, 1]);

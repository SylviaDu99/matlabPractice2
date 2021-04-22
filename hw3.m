clc
close all

x=[-2, -1, 0, 1, 2];
y=[2, -10, 0, 2, 1];

p=polyfit(x, y, 2);
v=polyval(p, x);

a=p(1, 1);
b=p(1, 2);
c=p(1, 3);

plot(x, y, '*');
hold on
plot(x, v, '-');
hold off
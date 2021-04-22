clc;
clear all;

epsilon = 1e-5;
f = @(x) 2*x(1)^2+3*x(2)^2+4*x(3)^2+2*x(1)*x(2)-2*x(1)*x(3)-8*x(1)-4*x(2)-2*x(3);
g = @(x) [4*x(1)+2*x(2)-2*x(3)-8;6*x(2)+2*x(1)-4;8*x(3)-2*x(1)-2];
A = [2, 1, -1;1, 3, 0;-1, 0, 4];
x0 = [0;0;0]

[x, fun_val, iter] = gradient_method_projection(f, g ,x0, A, epsilon)
clc;
clear all;

A = hilb(5);
x0 = [1;2;3;4;5];
epsilon = 1e-4;
s = 1;
D = inv(diag(diag(A)));
[x1,fun_val_1, i1] = gradient_method_backtracking(@(x)x'*A*x, @(x)2*A*x, x0, s, 0.5, 0.5, epsilon);
[x2,fun_val_2, i2] = gradient_method_backtracking(@(x)x'*A*x, @(x)2*A*x, x0, s, 0.1, 0.5, epsilon);
[x3,fun_val_3, i3] = gradient_method_quadratic(A,[0;0;0;0;0],x0,epsilon);
[x4,fun_val_4, i4] = gradient_scaled_quadratic(A,[0;0;0;0;0],D,x0,epsilon);
[x5,fun_val_5, i5] = gradient_scaled_backtracking(@(x)x'*A*x, @(x)2*A*x, D, x0, s, 0.1, 0.5, epsilon);

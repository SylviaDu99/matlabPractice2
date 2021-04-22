clc;
clear all;

epsilon = 1e-5;
alpha=0.5;
beta=0.5;
f1=@(x) -13+x(1)+((5-x(2))*x(2)-2)*x(2);
f2=@(x) -29+x(1)+((1+x(2))*x(2)-14)*x(2);
gf1=@(x) [1;-3*x(2)^2+10*x(2)-2];
gf2=@(x) [1;3*x(2)^2+2*x(2)-14];
f=@(x) f1(x)^2+f2(x)^2;
grad=@(x) [2*f1(x)+2*f2(x); 2*f1(x)*((-3)*x(2)^2+10*x(2)-2)+2*f2(x)*(3*x(2)^2+2*x(2)-14)];
hes=@(x) [4 24*x(2)-32; 24*x(2)-32 60*x(2)^4-160*x(2)^3+24*x(2)^2-480*x(2)+24*x(1)+24];
[x11,fun_val_11, i11] = gradient_method_backtracking(f, grad, [-50; 7], 1, alpha, beta, epsilon);
[x12,fun_val_12, i12] = gradient_method_backtracking(f, grad, [20; 7], 1, alpha, beta, epsilon);
[x13,fun_val_13, i13] = gradient_method_backtracking(f, grad, [20; -18], 1, alpha, beta, epsilon);
[x14,fun_val_14, i14] = gradient_method_backtracking(f, grad, [5; -10], 1, alpha, beta, epsilon);
i21 = newton_hybrid(f, grad, hes, [-50; 7], alpha, beta, epsilon);
i22 = newton_hybrid(f, grad, hes, [20; 7], alpha, beta, epsilon);
i23 = newton_hybrid(f, grad, hes, [20; -18], alpha, beta, epsilon);
i24 = newton_hybrid(f, grad, hes, [5; -10], alpha, beta, epsilon);
i31 = gauss_newton_backtracking(f, f1, f2, gf1, gf2, grad, [-50; 7], alpha, beta, epsilon);
i32 = gauss_newton_backtracking(f, f1, f2, gf1, gf2, grad, [20; 7], alpha, beta, epsilon);
i33 = gauss_newton_backtracking(f, f1, f2, gf1, gf2, grad, [20; -18], alpha, beta, epsilon);
i34 = gauss_newton_backtracking(f, f1, f2, gf1, gf2, grad, [5; -10], alpha, beta, epsilon);


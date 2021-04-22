function [x,fun_val, iter]=gradient_method_projection(f,g,x0,A,epsilon)
% Gradient projection method with constant stepsize rule
%
% INPUT
%=======================================
% f ......... objective function
% x0......... initial point
% epsilon ... tolerance parameter for stopping rule
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value
% iter .... the number of iterations
x=x0;
fun_val=f(x);
grad=g(x);
iter=0;
L=2*norm(A);
t=1/L;
temp=x;
x=x-t*grad;
for i =1:length(x)
    if x(i) <0
        x(i) = 0;
    end
end
while (norm(x-temp)>epsilon)
    iter=iter+1;
    temp=x;
    x=x-t*grad;
    for i =1:length(x)
        if x(i) <0
            x(i) = 0;
        end
    end
    fun_val=f(x);
    grad=g(x);
    fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val);
end
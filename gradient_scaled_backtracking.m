function [x,fun_val, iter]=gradient_scaled_backtracking(f,g,D,x0,s,alpha,beta,epsilon)
% Gradient method with backtracking stepsize rule
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% D ......... the scaling matrix
% x0......... initial point
% s ......... initial choice of stepsize
% alpha ..... tolerance parameter for the stepsize selection
% beta ...... the constant in which the stepsize is multiplied
% at each backtracking step (0<beta<1)
% epsilon ... tolerance parameter for stopping rule
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value
% iter .... the number of iterations
x=x0;
grad=g(x);
fun_val=f(x);
iter=0;
while (norm(grad)>epsilon)
    iter=iter+1;
    t=s;
    while (fun_val-f(x-t*D*grad)<alpha*t*grad'*D*grad)
        t=beta*t;
    end
    x=x-t*D*grad;
    fun_val=f(x);
    grad=g(x);
    fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val);
end
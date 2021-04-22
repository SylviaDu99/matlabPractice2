function x=newton_backtracking(f,g,h,x0,alpha,beta,epsilon)
% Newton's method with backtracking
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% h ......... hessian of the objective function
% x0......... initial point
% alpha ..... tolerance parameter for the stepsize selection strategy
% beta ...... the proportion in which the stepsize is multiplied
% at each backtracking step (0<beta<1)
% epsilon ... tolerance parameter for stopping rule
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value
x=x0;
gval=g(x);
hval=h(x);
d=hval\gval;
iter=0;
while ((norm(gval)>epsilon)&&(iter<10000))
    iter=iter+1;
    t=1;
    while(f(x-t*d)>f(x)-alpha*t*gval'*d)
        t=beta*t;
    end
    x=x-t*d;
    fprintf('iter= %2d f(x)=%10.10f\n',iter,f(x))
    gval=g(x);
    hval=h(x);
    d=hval\gval;
end
if (iter==10000)
    fprintf('did not converge\n')
end
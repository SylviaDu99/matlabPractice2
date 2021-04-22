function iter=gauss_newton_backtracking(f,f1,f2,gf1, gf2,g,x0,alpha,beta,epsilon)
% Newton's method with backtracking
% OUTPUT
% iter ...... iterations
x=x0;
iter=0;
gval=g(x);
df1=gf1(x);
df2=gf2(x);
while ((norm(gval)>epsilon)&&(iter<10000))
    F=[f1(x); f2(x)];
    J=[df1.'; df2.'];
    JT=J.';
    d=(inv(JT*J))*JT*F;
    iter=iter+1;
    t=1;
    while(f(x-t*d)>f(x)-alpha*t*gval'*d)
        t=beta*t;
    end
    x=x-t*d;
    fprintf('iter= %2d f(x)=%10.10f\n',iter,f(x))
    gval=g(x);
    df1=gf1(x);
    df2=gf2(x);
end
if (iter==10000)
    fprintf('did not converge\n')
end
% Use this template to help you solve the actual problem. 
f = @(x) (2*x.^3+3*x-1)*cos(x);
%a=-1;
%b=1;
tol = 10^-5  ;
N = 100;

c = bisection_method(f,-1,1,tol,N)
%c1 = bisection_method(f,-1.5,2.5,tol,N) % The interval here is [-1,1]
%c2 = bisection_method(f,-0.5,2.4,tol,N) % The interval here is [-4, 3.16]
%c3 = bisection_method(f,-0.5,3,tol,N)
%c4 = bisection_method(f,-3,-0.5,tol,N)


function [c,n,err] = bisection_method(f,a,b,tol,N)
%function to solve the root-finding problem f(x) = 0 over [a,b] using bisection
% INPUTS:
% f function at hand
% a,b bounds of the interval
% tol: error tolerance
% N: maximum number of iterations
% Condition: we need f(a)* f(b)<0 to find a solution
%OUTPUTS:
% c the root
% n the number of iterations made
% err the error

if f(a)*f(b) >= 0
    fprintf('Careful ! either solution on the boundary or no solution \n');   
else
    
    err = (b-a)/2;
    k = 0;
    while err >= tol && k <= N
        x = (b+a)/2;
        if f(x) == 0
            c=x;
            fprintf('Found solution! This is %23.16f \n', c);
            n = k;
            err = 0.0;
            break;
        end
        if f(a)*f(x)<0
            b = x;
        end
        if f(x)*f(b)<0
            a = x;
        end
        err = (b-a)/2;
               
        if err<tol || f(x)==0
            c=x;
            n = k;
            fprintf('The fixed point iteration converged in %d steps.\n', k);
            break;
        end
        k = k+1;
    end
    if k == N
        n=k;
        fprintf('The bisection did NOT converge!\n');
    end
    
end

end

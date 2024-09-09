%
% trapez.m
%
% numerical integration of func(x) between the limits a and b
% computation of approximations using the trapezoidal rule
%     for n=0: initialization of T_1
%         n>0: T_N -> T_2N , where 2N = 2^n
%

func = @x x.^2; % Defining the function to integrate into x

a = 0; % Set integration bounds 
b = 1;

TN = 0; % Set to 0 for the first iteration 
n = 4;  % Number of iterations

disp(['Result: ', (T2N)]); % Display the result

function [T2N] = trapez(func,a,b,TN,n);

if n < 0
      error('negative n in trapez');
elseif n == 0                % only one interval
      T2N = .5*(b-a)*(feval(func,a) + feval(func,b));
else
      h = (b-a)/2^n;          % new step size
      T2N = 0;
      for x=a+h:2*h:b        % sum over new (internal) points
            T2N = T2N + feval(func,x);
      end
      T2N = h*T2N + .5*TN;    % new approximation
end

% In this first part I tried to simulate some results (I left a generic one) 
% I didn't get any results, only errors.

% In the second part, I also tried to implement the extended equations (trapezoidal and simpson). 
% But  was also an error, so I'll leave everything together here to explain.

% trape_rule = trape(f, a, b, n); % declaring the functions
% sim_rule = simp(f, a, b, n);

% function trape_rule = trape(f, a, b, n)
%    h = (b - a) / (2 * n);
%    x_values = a + h * (0:2 * n);
%    trape_rule = h / 2 * (f(x_values(1) + 2 * sum(f(x_values(2)) + f(x_values(3));

% function sim_rule = sim(f, a, b, n)
%    h = (b - a) / (2 * n);
%   x_values = a + h * (0:2 * n);
%    sum_1 = f(x_values(1)) + f(x_values(2 * n + 1));
%   sum_2 = 4 * sum(f(x_values(2)));
%    sum_3 = 2 * sum(f(x_values(3)));
%   result = h / 3 * (sum_1 + sum_2 + sum3);

% I compiled these functions in another script with some initial values and iterations. 
% but I only got an error, if you can give me feedback I would appreciate it 
% or I can attach the other script.

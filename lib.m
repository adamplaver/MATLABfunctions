clear all; clf;

fprintf('This is a library of functions and formulas, running it will not do anything.');

end;

% MATLAB Function and formula libray.
% Created for Models at UC.
% For informational use only.

% INDEX ----------------
% 1 | 2-Pt Reverse Estimate of 1st Derivative
% 2 | 3-pt Estimate of 1st Derivative
% 3 | Estimate of 2nd Derivative
% 4 | Newton Raphson for Solving f(x) = 0
% 5 | Right Riemann Sum for Integral
% 6 | Trapezoidal Sum for Integral
% 7 | Function Grapher
% 8 | Area Between Curves
% ----------------------

% 2-Pt Reverse Estimate of 1st Derivative
% 	Estimates the derivative of f(x) at n, given f(n) and f(n-deltaT)
%		deltaT = change in x relative to n
fPrime(n) = (f(n)-f(n-deltaT))/deltaT;

% 3-pt Estimate of 1st Derivative
%	Pretty much the same as the 2-pt, except it requires the points to be 
%	before and after f(n), it is more accurate though.
%		deltaT = change in x relative to n
fPrime(n) = (f(n+deltaT)-f(n-deltaT))/(2*deltaT);

% Estimate of 2nd Derivative
%	A combination of the 2-pt and 3-pt estimate that gives a pretty decent
%	estimate at the 2nd derivative.
%		deltaT = change in x relative n
fDoublePrime = (f(n+deltaT)-2*f(n)+f(n-deltaT))/(deltaT^2);

% Newton Raphson for Solving f(x) = 0
%	A really CPU intensive way to solve the roots of a function.
%	Requires an intial guess.
%		f(x) = Function given
%		fDP(x) = Second derivative of the function
%		x(n) = Current guess
%		x(1) = Intial guess
%		tol = Tolerance in answer
n = 1;
x(1) = 0;
while (guess >= tol)
	x(n+1) = x(n) - f(x(n))/fDP(x(n));
	guess = abs(x(n) - x(n-1));
	n = n+1;
end
ans = x(n)

% Right Riemann Sum for Integral
% 	Returns a sum that's a bit lower than the intergral it's given
%		end = end point
%		f(n) = function
%		deltaT = change in each n value (usually 1)
for n = 2:end
	ans = ans + f(n)*deltaT;
end

% Trapezoidal Sum for Integral
% 	Another form of sumination for an intergral, but with higher accuracy
%	and more CPU time.
%		end = end point
%		f(n) = function
%		deltaT = change in each n value (usually 1). If it changes, then
%			the deltaT must be calculated in the for loop.
deltaT = 1;
for n = 1:end-1
	% deltaT = abs(f(n+1)-f(n));
	ans = ans + ((f(n)+f(n+1))/2)*deltaT;
end

% Function Grapher
%	Given a function and a range, returns the values of the function in
%	the given range in the form of an array. Graphs the function
%	during the process.
%		f(n) = function
%		out(n) = output
%		start = start point
%		end = end point
%		x = array of points used for plotting
%		accuracy = How many points of data to generate (Optional)
accuracy = 1;
x = start:1/accuracy:end;
for n = start:1/accuracy:end
	out(n) = f(n);
	plot(x(n),out(n),'r*'); hold on
end

% Area Between Curves
%	Finds the area between two functions / data sets.
%		dataTop(n) = values for top function
%		dataBottom(n) = values for the lower function
%		x(n) = x values for the data sets. If not given, then
%			it will assume it is 0 to the length of data1.
if length(x) < 0
	x(1) = 0;
	for n = 2:length(data1)
		x(n) = 1 + x(n-1);
	end
end
% Assume the deltaX stays the same throughout.
% Otherwise calculate it for each iteration.
deltaX = x(2) - x(1);
area = 0;
for n = 2:length(x)
	% deltaX = abs(x(n) - x(n-1));
	area = area + .5 * ((dataTop(n)-dataBottom(n))+(dataTop(n-1)-dataBottom(n-1)))*deltaX;
end
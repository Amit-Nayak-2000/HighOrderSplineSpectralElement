function [t] = parametrize(x,y)
% INPUTS
% x: x coordinate array
% y: y coordinate array
% x & y are assumed to be identical in size.
% OUTPUT
% t: Parameterized array.


N = length(x);
t = zeros(1, N);

totalarclength = 0;

for i=2:N
    totalarclength = totalarclength + sqrt((x(i) - x(i-1)).^2 + (y(i) - y(i-1)).^2);
end

t(1) = 0;

for i=2:N
    t(i) = t(i-1) + sqrt((x(i) - x(i-1)).^2 + (y(i) - y(i-1)).^2);
end

t = t./totalarclength;

end


function [Xresult,Yresult] = ChebySpline(x, y, elebounds, porder, sorder)
%% CHEBYSPLINE

% INPUTS
% x: x coordinate points (array).
% y: y coordinate points (array).
% x & y must be the same size.

% elebounds: Element boundaries in parameterized space or fractions (array).
% Must be in the range of [0,1], EG: [0, 0.15, 0.4, 0.7, 1].

% porder: Polynomial order to calculate Chebyshev nodes (integer). 
% If it is not given, by default it will be 6.

% sorder: Spline order (integer). 
% If it is not given, by default it will be the minimum between 
% the polynomial order and 5.

% OUTPUTS
% Xresult: Mapped chebyshev nodes (x-axis) for each element evaluated using high
% order spline (Matrix, each row is an element).

% Yresult: Mapped chebyshev nodes (y-axis) for each element evaluated using high
% order spline (Matrix, each row is an element).

% METHOD
% First, if the polynomial order or spline order are not given, default values are assigned.
% Then, the x & y data are parametrized and splines are constructed according to spline order. 
% Next, the Chebyshev nodes are constructed to polynomial order.
% The result matrices are allocated according to the number of elements.
% Finally, the x & y splines are evaluated with the nodes mapped to the
% element boundaries via an Affine map. 
%% Default values of order parameters if not given
if ~exist('porder','var')
  porder = 6;
  pstr = ['Polynomial order automatically set to: ', num2str(porder)];
  disp(pstr);
end

if ~exist('sorder','var')
  sorder = min(porder, 5);
  sstr = ['Spline order automatically set to: ', num2str(sorder)];
  disp(sstr);
end
%% Parameterize data and construct high order spline for evaluation
t = parametrize(x, y);
xspline = spapi(sorder, t, x);
yspline = spapi(sorder, t, y);

%% Construct Chebyshev nodes according to polynomial order
[nodes, ] = chebnodes(porder);

%% Determining number of sub divisions and preallocating size of result matrices.
numofdiv = numel(elebounds) - 1;
Xresult = zeros(numofdiv, porder+1);
Yresult = zeros(numofdiv, porder+1);

%% Evaluate mapped chebyshev nodes of each sub division using splines.
for i = 1:numofdiv
    Xresult(i, :) = fnval(xspline, affinemap(nodes, elebounds(i), elebounds(i+1)));
    Yresult(i, :) = fnval(yspline, affinemap(nodes, elebounds(i), elebounds(i+1)));
end 
 
end


%TEST CASE: Using NACA0012 airfoil.
xtop = [];
ytop = [];
ctr = 1;

%Parameter array.
t = linspace(0.0, 1.0, 200);

%Construct airfoil data using analytic equation.
for i = t
   [xtop(ctr), ytop(ctr)] = NACA0012Func(i, 1);
   ctr = ctr + 1;
end

%Element boundaries.
bounds = [0, 0.13, 0.4, 0.78, 0.8, 1];

%Obtain results.
[Xresult,Yresult] = ChebySpline(xtop, ytop, bounds, 23, 5);


%Plot results.
for i=1:numel(bounds)-1
    plot(Xresult(i, :), Yresult(i, :), "LineWidth", 1.5);
    hold on;
end

legend("First Element", "Second Element", "Third Element", "Fourth Element", "Fifth Element"); 




function [x,y] = NACA0012Func(t,top)
% USED FOR TEST CASE
% INPUTS
% t: value in parameterized space [0,1]
% top: boolean for top of airfoil (1=top, 0=bot).
% OUTPUTS
% x: x coordinate of NACA0012 Airfoil
% y: y coordinate of NACA0012 Airfoil

if top == 1
    x = t^2;
    y = 0.6*(0.2969*t - 0.1260*t^2 - 0.3516*t^4 +0.2843*t^6-0.1036*t^8);
    
else
    x = t^2;
    y = -0.6*(0.2969*t - 0.1260*t^2 - 0.3516*t^4 +0.2843*t^6-0.1036*t^8);
end

end


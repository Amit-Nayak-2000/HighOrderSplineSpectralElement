function [nodes,weights] = chebnodes(N)
% INPUT
% N: Polynomial order.
% OUTPUTS
% nodes: Chebyshev nodes.
% weights: Chebyshev weights.


nodes = zeros(1,N+1);
weights = zeros(1,N+1);

for j=0:N
    nodes(j+1) = -cos((j*pi)/N);
    weights(j+1) = pi/N;
end

weights(1) = weights(1) / 2;
weights(N+1) = weights(N+1) / 2;

end


function [t] = affinemap(s, ts, te)
% INPUTS
% s: Node value.
% ts: Starting bound in parameterized space.
% te: Ending bound in parameterized space.
% OUTPUT
% t: Mapped nodal value within parameterized space bounds.

t = ts + (1/2).*(s+1)*(te-ts);

end


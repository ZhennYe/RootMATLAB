% long map(long x, long in_min, long in_max, long out_min, long out_max)
% {
%   return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
% }

val= .1;
from_min = 0;
from_max = 4;
to_min = 0;
to_max = 1023;

2
(val-from_min)*(to_max-to_min)/(from_max-from_min)+to_min
function [m,pnts,obj]=drawSlopeLine(varargin)
% h=axeshandle
%m=slope
%pnts=endpoints [x1 y1 x2 y2];
%obj = line object, to remove from plot do "delete(obj);"


if(nargin<1)
    h=gca;
end
hold(h,'on');
[x,y]=ginput(2);

obj=line('xdata',x,'ydata',y,'linestyle','-','color','k');
m=diff(y)/diff(x);
pnts=([x(1),y(1),x(2),y(2)]);

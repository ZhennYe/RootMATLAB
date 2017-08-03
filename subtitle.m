function [ax,h]=subtitle(text,size)
%
%Centers a title over a group of subplots.
%Returns a handle to the title and the handle to an axis.
% [ax,h]=subtitle(text,size)
% if size is not specified does default
% returns handles to both the axis and the title.
% ax=subtitle(text)
% returns a handle to the axis only.

ax=axes('Units','Normal','Position',[.075 .075 .85 .85],'Visible','off');
set(get(ax,'Title'),'Visible','on')
set(get(ax,'Title'),'FontSize',23);
if nargin > 1
    title(text,'FontSize',size);
else
    title(text);
end
h=get(ax,'Title');
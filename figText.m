function figText(handle,tSize,varargin)
%change figure's font size for all text
%handle= figure handle
%tSize = textSize
figure(handle);
set(findall(gcf,'-property','FontSize'),'FontSize',tSize);

if(nargin>=3)
    set(gca,'box','on','linewidth',varargin{1});
else
    set(gca,'box','on');
end


end
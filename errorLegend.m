function ce=errorLegend(c,names)
%function H=errorLegend(c,names)
%c is struct containing shaded errorbar handles
%names is a list containing names of legends for handles
%example:
%names = {'40 deg', '50 deg', '60 deg'}
%c = shadedErrorbar(...);
%errorLegend(c,names)
ce = zeros(4,size(c,2));
x = zeros(1,size(c,2));
for i = 1:size(c,2)
ce(1,i) = c(i).edge(1,1);
ce(2,i) = c(i).edge(1,2);
ce(3,i) = c(i).patch;
ce(4,i) = c(i).mainLine;
end

for i=1:size(ce,2)
    x(i) = hggroup;
    set(ce(:,i),'Parent',x(i))
    set(get(get(x(i),'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on');
end
legend (names);


%% deprecated code


% c(1)=shadedErrorBar(1:size(md,2),maxd,maxde,{'color','r',},.5);
% c(2)=shadedErrorBar(1:size(md,2),mind,minde,{'color','b',},.5);
% c(3)=shadedErrorBar(1:size(md,2),maxmind,maxminde,{'color','g'},.5);
% names = {'Max Displacement','Min Displacement', 'Total Displacement'};
% ce = errorLegend(c,names);
% for i=1:size(ce,2)
%     x(i) = hggroup;
%     set(ce(:,i),'Parent',x(i))
%     set(get(get(x(i),'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% end
% legend(names)
% for i = 1:length(c)
% ce(1,i) = c(i).mainLine;
% ce(2,i) = c(i).patch;
% ce(3,i) = c(i).edge(1,1);
% ce(4,i) = c(i).edge(1,2);
% end
% minGroup = hggroup;
% maxGroup = hggroup;
% maxminGroup = hggroup;
% 
% set(ce(:,1),'Parent',minGroup);
% set(ce(:,2),'Parent',maxGroup);
% set(ce(:,3),'Parent',maxminGroup);
% set(get(get(minGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(maxGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(maxminGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% legend('Max Displacement','Min Displacement', 'Total Displacement')
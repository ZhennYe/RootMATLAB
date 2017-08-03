function figLabels(handle,titlez,xaxisz,yaxisz,legendz,figT)
%set all function labels in a single program and size
%titlez= fig title text
%xaxisz= xaxis text
%yaxisz= yaxis text
%legendz= legend text
%figT= 1 or 0 to change size of font
figure(handle);
title(titlez);
xlabel(xaxisz);
ylabel(yaxisz);
legend(legendz);
if(figT)
    figText(figure(handle),12); %titleSize, labelSize
end

    
    
    

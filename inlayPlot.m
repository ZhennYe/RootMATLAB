function inlayPlot(h1,sizez,posz)
%outputs handle of plot containing inlay
%inputs: 
%h1=initial handle of object containing first plot
%sizez= width and height [x,y]= x[0,1] y=[0,1]
%pos= position of plot [x,y] x=[0,1] y=[0,1]

figure(h1.Number);
oldAxis=h1.Children;
oldPlot=h1.Children.Children;
newAxis=axes('pos',[posz(1), posz(1)+sizez(1), posz(2), posz(2)+sizez(2)]);
% 
% 
% 
%     hc  = get(hf,'children') %get h1.Children = h1.axes
%     hgc = get(hc, 'children'); %get axis children (line)
%     set(hgc, 'parent',ha); %set parent of line to new axis
%     
% 
% 
% set(
% 
% plot(
% %%
% sizez = [.25,.25];
% posz  = [.5,.5];
% 
% t=0:.01:10;
% y1=cos(t);
% y2=sin(t);
% 
% h1=figure(1);
% 
% 
% p1=plot(t,y1);
% h2=figure(2);
% p2=plot(t,y2);
% 
% ax1=h1.Children;
% ax2=ax1;
% ax2.Children=p1;
% %%
% plot(1:5,11:15,'rx','markersize',12); 
% hold on
% plot(1.5:4.5,12:15,'bo','markersize',12); 
% ch = get(gca,'children');
% x1 = get(ch(1),'xdata'); 
% y1 = get(ch(1),'ydata'); 
% x2 = get(ch(2),'xdata'); 
% y2 = get(ch(2),'ydata'); 
% %%
% axes('pos',[.6 .2 .25 .25])
% plot(x1,y1,'rp-')
% hold on
% plot(x2,y2,'bs-')
% 
% %%
% hf= figure(1)
% plot(t,y1);
% 
% ha(1) = subplot(1,2,1);
% ha(2) = subplot(1,2,2);
% 
%     hc  = get(hf,'children') %get h1.Children = h1.axes
%     hgc = get(hc, 'children'); %get axis children (line)
%     set(hgc, 'parent',ha); %set parent of line to new axis
% end
% 
% % c1=h1.Children;
% % c2=f2.Children;
% % c3=[c1 c2];
% % c3(2).Position=[posz(1), posz(1)+sizez(1), posz(2), posz(2)+sizez(2)];
% % 
% % ff=figure(h1.Number);
% % ff.Children=c3;
% % f3=figure(3);
% % axes('pos',[posz(1), posz(1)+sizez(1), posz(2), posz(2)+sizez(2)])
% 
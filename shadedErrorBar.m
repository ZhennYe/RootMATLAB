function H=shadedErrorBar(x,y,errBar,lineProps,transparent,outerLines)
% function H=shadedErrorBar(x,y,errBar,lineProps,transparent,outerLines)
%
% Purpose
% Makes a 2-d line plot with a pretty shaded error bar made
% using patch. Error bar color is chosen automatically.
%
% Inputs
% x - vector of x values [optional, can be left empty]
% y - vector of y values or a matrix of n observations by m cases
%     where m has length(x);
% errBar - if a vector we draw symmetric errorbars. If it has a
%          size of [2,length(x)] then we draw asymmetric error bars
%          with row 1 being the upper bar and row 2 being the lower
%          bar. ** alternatively ** errBar can be a cellArray of
%          two function handles. The first defines which statistic
%          the line should be and the second defines the error
%          bar.
% lineProps - [optional,'-k' by default] defines the properties of
%             the data line. e.g.:
%             'or-', or {'-or','markerfacecolor',[1,0.2,0.2]}
% transparent - [optional, 0 by default] if ==1 the shaded error
%               bar is made transparent, which forces the renderer
%               to be openGl. However, if this is saved as .eps the
%               resulting file will contain a raster not a vector
%               image.
% outerLines - [0 by default] if == 1 the shaded error
%               bar will have lines outlining the errorbar patch
%               the linewidth of outline will be specified by
%               outerLines
%
%
% Outputs
% H - a structure of handles to the generated plot objects.
%
%
% Examples
% y=randn(30,80); x=1:size(y,2);
% shadedErrorBar(x,mean(y,1),std(y),'g');
% shadedErrorBar(x,y,{@median,@std},{'r-o','markerfacecolor','r'});
% shadedErrorBar([],y,{@median,@std},{'r-o','markerfacecolor','r'});
%
% Overlay two transparent lines
% y=randn(30,80)*10; x=(1:size(y,2))-40;
% shadedErrorBar(x,y,{@mean,@std},'-r',1);
% hold on
% y=ones(30,1)*x; y=y+0.06*y.^2+randn(size(y))*10;
% shadedErrorBar(x,y,{@mean,@std},'-b',1);
% hold off
%
%
% Rob Campbell - November 2009



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Error checking
narginchk(3,6);


%Process y using function handles if needed to make the error bar
%dynamically
if iscell(errBar) && ~isvector(y)
    fun1=errBar{1};
    fun2=errBar{2};
    errBar=fun2(y);
    y=fun1(y);
elseif ~iscell(errBar) && isvector(y)
    y=y(:)';
else
    error('2nd and 3rd input arguments are not compatible')
end

if isempty(x)
    x=1:length(y);
else
    x=x(:)';
end

if length(x) ~= length(y)
    error('inputs x and y are not of equal lengths')
end


%If only one error bar is specified then we will mirror it, turning it into
%both upper and lower bars.
if length(errBar)==length(errBar(:))
    errBar=repmat(errBar(:)',2,1);
else
    f=find(size(errBar)==2);
    if isempty(f), error('errBar has the wrong size'), end
    if f==2, errBar=errBar'; end
end

if length(x) ~= length(errBar)
    error('inputs x and y must have the same length as errBar')
end


%Set default options


defaultProps={'-'};
if nargin<4 || isempty(lineProps)
    lineProps=defaultProps;
end
if ~iscell(lineProps)
    lineProps={lineProps};
end


if nargin<5 || ~isnumeric(transparent)
    transparent=0;
end


%flag to see if color was defined
definedCol=0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot the main line. We plot this first in order to extract the RGB values
% for the line colour. I am not aware of a function that does this.

%give first plot a specific color
h=gca;
colIdx=h.ColorOrderIndex;
H.mainLine=plot(x,y,lineProps{:});
if colIdx~=h.ColorOrderIndex %if specific color was not specified in line props
    h.ColorOrderIndex=colIdx;
else
    definedCol=1;
end
col=get(H.mainLine,'color');
% Work out the color of the shaded region and associated lines
% Using alpha requires the render to be openGL and so you can't
% save a vector image. On the other hand, you need alpha if you're
% overlaying lines. We therefore provide the option of choosing alpha
% or a de-saturated solid colour for the patch surface.


edgeColor=col+(1-col)*0.55;
patchSaturation=0.15; %How de-saturated or transparent to make the patch
if transparent
    faceAlpha=transparent;
    patchColor=col;
    set(gcf,'renderer','painters')
    warning('if the plot is high freq, opengl can look better');
else
    faceAlpha=1;
    patchColor=col+(1-col)*(1-patchSaturation);
    set(gcf,'renderer','painters')
end


%Calculate the y values at which we will place the error bars
uE=y+errBar(1,:);
lE=y-errBar(2,:);



%Add the error-bar plot elements
holdStatus=ishold;
if ~holdStatus, hold on,  end


%Make the cordinats for the patch
yP=[lE,fliplr(uE)];
xP=[x,fliplr(x)];

%remove any nans otherwise patch won't work
xP(isnan(yP))=[];
yP(isnan(yP))=[];


H.patch=patch(xP,yP,1,'facecolor',patchColor,...
    'edgecolor','none',...
    'facealpha',faceAlpha);

%###EDITED### removes patch from legend annotation
set(get(get(H.patch,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');

if(exist('outerLines','var') && outerLines)
    %Make nice edges around the patch.
    H.edge(1)=plot(x,lE,'-','color',edgeColor,'linewidth',outerLines);
    H.edge(2)=plot(x,uE,'-','color',edgeColor,'linewidth',outerLines);
    %###EDITED### removes outer lines from legend annotation
    H.edge(1).Annotation.LegendInformation.IconDisplayStyle='off';
    H.edge(2).Annotation.LegendInformation.IconDisplayStyle='off';
    %set line plot layer on top
    %(edge2,edge1,patch,line)->(line,edge2,edge1,patch)
    h.Children([1 2 3 4])=h.Children([4 1 2 3]);
    h.ColorOrderIndex=colIdx;
else
     %set line plot layer on top
    %(patch,line)->(line,patch)
    h.Children([1 2])=h.Children([2 1]);
end

if(~definedCol) 
    h.ColorOrderIndex=mod(colIdx,7)+1;
end

if ~holdStatus, hold off, end


function out_str=pts(varargin)
%does a disp() but accepts numbers without doing a num2str
out_str = '';


for ii = 1:length(varargin)
    if isnumeric(varargin{ii}) %if current index of string is numeric
        cidx = num2str(varargin{ii});
    else
        cidx = varargin{ii};
    end
    out_str = horzcat(out_str,cidx);
end
disp(out_str);
end

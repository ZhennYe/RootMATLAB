function out=dir2(folder,varargin)
out=dir(folder);
out=out(~ismember({out.name},{'.','..'}));

if length(varargin)>0
    for i=1:length(varargin)
        if(varargin{i}=='folders') %only take folders
            out=out(find([out(:).isdir]));
        end
    end
end
function out=dir2(folder,varargin)
%if no varargin take all entries
%if varargin{1} == 'folders' only take folders
%if varargin{1} ~= 'folders' take only files
out=dir(folder);
out=out(~ismember({out.name},{'.','..'}));

if length(varargin)>0
    for i=1:length(varargin)
        if(varargin{i}=='folders') %only take folders
            out=out(find([out(:).isdir]));
        else
            out=out(find(~[out(:).isdir]));
        end
    end
end
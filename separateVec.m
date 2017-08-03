function [ varargout] = separateVec(mat,dim)
%dim=1, split up by rows
%dim=2, split up by cols
if (dim==1)
    dims=size(mat,2);
elseif (dim==2)
    dims=size(mat,1);
else
    error('invalid row specification');
end
for i=1:dims
    if (dim==1)
        
        varargout{i}=mat(:,i);
    elseif(dim==2)
        varargout{i}=mat(i,:);
        
    else
        error('invalid row specification');
    end
end

% contours 
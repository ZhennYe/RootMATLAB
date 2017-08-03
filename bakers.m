
% mnew = magic(4);
mnew = zeros(13,13);
mnew(3,4) = 10;
mnew(3,9) = 10;
mnew(7,4) = 10;
mnew(8,5:8) = 10;
mnew(7,9) = 10;


figure(1)
imagesc(mnew);
rr = size(mnew,1)-1;
cc = size(mnew,2)-1;
a = 1/4*rr;
N = 2;
for c = 1:3
    mold = mnew;
    for rows = 1:size(mold,1)%rows
        for cols =1:size(mold,2)%cols
            if rows-1 <= rr*1/2%                 xnew = 2*cols;
                ynew = floor(rr-(rows-1)/2+1);
            else %                 xnew = rr*2-2*cols;
                ynew = floor((rows-1)/2)+1;
            end
            if (cols-1) <= rr*1/2
                xnew = 2*(cols-1)+1;
            else
                xnew = rr*2-2*(cols-1)+1;
            end
                
   

            
             [cols,rows,xnew,ynew]
%              pause;
             mnew(ynew,xnew)= mold(rows,cols);
            
%              pause
%  pause
        end
    end
    size(mnew)
    figure(2)
    imagesc(mnew)
    pause;
end
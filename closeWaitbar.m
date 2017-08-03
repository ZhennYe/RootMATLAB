function closeWaitbar
% Close all waitbars
% help section
     wh=findall(0,'tag','TMWWaitbar');
     delete(wh);
end

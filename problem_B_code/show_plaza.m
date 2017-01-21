function h = show_plaza(plaza, h, n)
%
% show_plaza  To show the plaza matrix as a image
% 
% USAGE: h = show_plaza(plaza, h, n)
%        plaza = plaza matrix
%                1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%        h = handle of the graphics
%        n = pause time
%
% zhou lvwen: zhou.lv.wen@gmail.com


[L, W] = size(plaza); %get its dimensions
temp = plaza;
temp(temp==1) = 0;

PLAZA(:,:,1) = plaza;
PLAZA(:,:,2) = plaza;
PLAZA(:,:,3) = temp;

PLAZA = 1-PLAZA;
PLAZA(PLAZA>1)=PLAZA(PLAZA>1)/6;


if ishandle(h)
    set(h,'CData',PLAZA)
    pause(n)
else
    figure('position',[20,50,200,700])
    h = imagesc(PLAZA);    
    hold on
    % draw the grid
    plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')
    plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')
    axis image
    set(gca, 'xtick', [], 'ytick', []);
    pause(n)
end
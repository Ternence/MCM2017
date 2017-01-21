function [plaza, v, time] =  switch_lanes(plaza, v, time)
%
% switch_lanes  Merge to avoid obstacles.
%  
% The vehicle will attempt to merge if its forward path is obstructed (dn = 0). 
% The vehicle then randomly chooses an intended direction, right or left. If 
% that intended direction is blocked, the car will move in the other direction
% unless both directions are blocked (the car is surrounded). 
% 
% USAGE: [plaza, v, time] =  switch_lanes(plaza, v, time)
%        plaza = plaza matrix
%                1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%        v = velocity matrix
%        time = time matrix, to trace the time that the car cost to pass the plaza.
%
% zhou lvwen: zhou.lv.wen@gmail.com

[L, W] = size(plaza);
found = find(plaza==1);
if ~isempty(found)
    found = found(randperm(length(found)));
end
for k=found'
    if (plaza(k+1)~=0 | plaza(k-1)==1) & rem(k,L)~=floor(L/2)
        if (rand < .5 )
            if plaza(k+L) == 0 & plaza(k+L+1) == 0
                plaza(k+L) = 1;
                plaza(k) = 0;
                v(k+L) = v(k);
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            elseif plaza(k-L) == 0 & plaza(k-L+1) == 0
                plaza(k-L) = 1;
                plaza(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            end
        else
            if plaza(k-L) == 0 & plaza(k-L+1) == 0
                plaza(k-L) = 1;
                plaza(k) = 0;
                v(k-L) = v(k);
                v(k) = 0;
                time(k-L) = time(k);
                time(k) = 0;
            elseif plaza(k+L) == 0 & plaza(k+L+1) == 0
                plaza(k+L) = 1;
                plaza(k) = 0;
                v(k+L) = v(k);
                v(k) = 0;
                time(k+L) = time(k);
                time(k) = 0;
            end
        end
    end
end

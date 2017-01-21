function [plaza, v, time] = move_forward(plaza, v, time, vmax)
% 
% move_forward   car move forward governed by NS algorithm:
%
% 1. Acceleration. If the vehicle can speed up without hitting the speed limit
% vmax it will add one to its velocity, vn -> vn + 1. Otherwise, the vehicle 
% has constant speed, vn -> vn .
%
% 2. Collision prevention. If the distance between the vehicle and the car ahead
% of it, dn , is less than or equal to vn , i.e. the nth vehicle will collide
% if it doesn’t slow down, then vn -> dn − 1.
%
% 3. Random slowing. Vehicles often slow for non-traffic reasons (cell phones,
% coffee mugs, even laptops) and drivers occasionally make irrational choices.
% With some probability pbrake , vn -> vn − 1, presuming vn > 0.
%
% 4. Vehicle movement. The vehicles are deterministically moved by their velocities, 
% xn -> xn + vn.
%
% USAGE: [plaza, v, time] = move_forward(plaza, v, time, vmax)
%        plaza = plaza matrix
%                1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%        v = velocity matrix
%        time = time matrix, to trace the time that the car cost to pass the plaza.
%        vmax = max speed of car
%
% zhou lvwen: zhou.lv.wen@gmail.com

Service = 0.8; % Service rate
dt = 0.2; % time step

% Prob acceleration
probac = 0.7;
% Prob deceleration
probdc = 1;
% Prob of random deceleration
probrd = 0.3;
t_h = 1; % time factor

[L,W] = size(plaza);

% gap measurement for car in (i,j)
gap = zeros(L,W);
f = find(plaza==1);
for k=f'
    [i,j] = ind2sub([L,W], k);
    d = plaza(i+1:end, j);
    gap(k) = min( find([d~=0;1]) )-1;
end
gap(end,:) = 0;

% update rules for speed:
% 1 Speed up, provided room
k = find((gap(f) > v(f)*t_h) & (v(f) + 1 <= vmax) & (rand(size(f)) <= probac));
v(f(k)) = v(f(k)) + 1;
% 2 No crashing
k = find((v(f)*t_h > gap(f)) & (rand(size(f)) <= probdc));
v(f(k)) = gap(f(k));
% 3 Random decel
k = find(rand(size(f)) <= probrd);
v(f(k)) = max(v(f(k)) - 1,0);

% Service: enter and out the booths
booth_row = ceil(L/2);
for i = 2:W-1
    if (plaza(booth_row,i) ~= 1)
        if (plaza(booth_row-1,i) == 1)
            v(booth_row - 1 ,i) = 1;% enter into booth
        end
        plaza(booth_row,i) = -3;
    else % cars pass through service with exponential rate Service
        if (plaza(booth_row+1,i) ~= 1)&(rand > exp(-Service*dt))
            v(booth_row,i) = 1; % out booths
        else
            v(booth_row,i) = 0;
        end
     end
end


%3b March
plaza(f) = 0;
plaza(f+v(f)) = 1;

time(f + v(f)) = time(f) + 1;
time(plaza~=1) = 0;

v(f + v(f)) = v(f);
v(plaza~=1)=0;
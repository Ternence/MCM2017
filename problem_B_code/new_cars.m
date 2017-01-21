function [plaza, v, number_cars] = new_cars(Arrival, dt, plaza, v, vmax)
%
% new_cars   introduce new cars. Cars arrive at the toll plaza uniformly in
% time (the interarrival distribution is exponential with rate Arrival?). 
% "rush hour" phenomena can be consider by varying the arrival rate.
%
% USAGE: [plaza, v, number_cars] = new_cars(Arrival, dt, plaza, v, vmax)
%        Arrival = the mean total number of cars that arrives 
%        dt = time step
%        plaza = plaza matrix
%                1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%        v = velocity matrix
%        vmax = max speed of car
%
% zhou lvwen: zhou.lv.wen@gmail.com

% Find the empty lanes of the entrance where a new car can be add.
unoccupied = find(plaza(1,:) == 0);
n = length(unoccupied); % number of available lanes
% The number of vehicles must be integer and not exceeding the number of
% available lanes
number_cars =min( poissrnd(Arrival*dt,1), n);
if number_cars > 0 
    x = randperm(n);
    for i = 1:number_cars
         plaza(1, unoccupied(x(i))) = 1;
         v(1, unoccupied(x(i))) = vmax;
    end
end

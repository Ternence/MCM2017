% main.m
%
% This is a main script to simulate the approach, service, and departure of 
% vehicles passing through a toll plaza, , as governed by the parameters 
% defined below
%
%   iterations      =  the maximal iterations of simulation
%   B               =  number booths
%   L               =  number lanes in highway before and after plaza
%   Arrival         =  the mean total number of cars that arrives 
%   plazalength     =  length of the plaza
%   Service         =  Service rate of booth
%   plaza           =  plaza matrix
%                      1 = car, 0 = empty, -1 = forbid, -3 = empty&booth
%   v               =  velocity matrix
%   vmax            =  max speed of car
%   time            =  time matrix, to trace the time that the car cost to
%                      pass the plaza.
%   dt              =  time step
%   t_h             =  time factor
%   departurescount =  number of cars that departure the plaza in the step
%   departurestime  =  time cost of the departure cars
%   influx          =  influx vector
%   outflux         =  outflux vector
%   timecost        =  time cost of all car
%   h               =  handle of the graphics
%   
% zhou lvwen: zhou.lv.wen@gmail.com


clear;clc
iterations = 5000; % the maximal iterations of simulation
B = 3; % number booths
L = 6; % number lanes in highway before and after plaza
Arrival=4; % the mean total number of cars that arrives 

plazalength = 101; % length of the plaza
[plaza, v, time] = create_plaza(B, L, plazalength);
h = show_plaza(plaza, NaN, 0.01);

Service = 0.8; % Service rate
dt = 0.2; % time step
t_h = 1; % time factor
vmax = 5; % max speed

timecost = [];
for i = 1:iterations
    % introduce new cars
    [plaza, v, arrivalscount] = new_cars(Arrival, dt, plaza, v, vmax);
    
    h = show_plaza(plaza, h, 0.02);

    % update rules for lanes
    [plaza, v, time] = switch_lanes(plaza, v, time); % lane changes
    [plaza, v, time] = move_forward(plaza, v, time, vmax); % move cars forward
    [plaza, v, time, departurescount, departurestime] = clear_boundary(plaza, v, time);
    
    % flux calculations
    influx(i) = arrivalscount;
    outflux(i) = departurescount;
    timecost = [timecost, departurestime];
end

h = show_plaza(plaza, h, 0.01);
xlabel({strcat('B = ',num2str(B)), ...
strcat('mean cost time = ', num2str(round(mean(timecost))))})
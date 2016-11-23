%% Performance metric
% The performance metric is caclated based on all selected components as
% spesified in the assingment.
sum = 0;


%% Stock shaft
spesificWeight = 80e3; % [N/m^3] spesific weight of stainless steel

diameter = 17e-3; % [m] diameter of shafts
length = (12 + 2 + 2) * 25.4-3 ; % [m] length of shaft drum+middle+motor in inches
volume = pi*diameter^2/4 * length; % [m^3] total shaft volume
weight = volume * spesificWeight; % [kg] total mass of shafts
shaftCost = 15 * weight; % [$] total cost of shafts

cost = cost + shaftCost;

%% Shaft machining

%% Shaft splines

%% Keyways

%% Retaining ring grooves 

%% Bearings and shaft collars
boreDiameter = 15; % [mm] bore diameter of bearings
bearingPricePerUnit = 20 + 2*(boreDiameter - 10); % cost per bearing
bearingPrice = 2 * bearingPricePerUnit; % total cost of 2 bearings

cost = cost + bearingPrice;

%% Minor components (not contributing to cost)

%% Bolts

%% Total cost
print(sum);
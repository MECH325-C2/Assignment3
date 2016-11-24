%% Performance metric
% The performance metric is caclated based on all selected components as
% spesified in the assingment.
cost = 0;


%% Stock shaft
spesificWeight = 7.87e3; % [kg/m^3] spesific weight of stainless steel

diameter = 37e-3; % [m] diameter of shafts
length = 12 * 25.4e-3 ; % [m] length of shaft drum+middle+motor in inches
volume = pi*diameter^2/4 * length; % [m^3] total shaft volume
shaftWeight = volume * spesificWeight; % [kg] total mass of shafts
costShaft = 15 * shaftWeight % [$] total cost of shafts

cost = cost + costShaft;

%% Shaft machining
lengthRemoved = (1+1) * 25.4e-3; % [m]
outerDiameter = 37e-3; % [m] diameter of shafts
innerDiameter = 25e-3; % [m] diameter of bearings

removedVolume = pi * (outerDiameter^2 - innerDiameter^2)/4 * lengthRemoved; % [m^3] total volume of shaft to be removed
machiningWeight = removedVolume * spesificWeight; % [kg] total weight of material to be machined 
costMachining = 75 * machiningWeight

cost = cost + costMachining;

%% Shaft splines
% Not used

%% Keyways
keywayLength = 0.28 * 7.112e-3; % [m]
costKeyway = 15+0.5*keywayLength % total cost of machining keyways

cost = cost + costKeyway;

%% Retaining ring grooves 
perGroveCost = 10 + 0.5 * (innerDiameter - 10e-3);
costGrove = 2*perGroveCost % total cost of machining groves

cost = cost + costGrove;

%% Bearings and shaft collars
boreDiameter = 25; % [mm] bore diameter of bearings
bearingPricePerUnit = 20 + 2*(boreDiameter - 10); % cost per bearing
costBearings = 2 * bearingPricePerUnit % total cost of 2 bearings

cost = cost + costBearings;

%% Minor components (not contributing to cost)

%% Bolts
costBolts = 4 * (5 - 4) % total cost of four bolts

cost = cost + costBolts;

%% Total cost
display(['Total cost: ' num2str(cost)]);

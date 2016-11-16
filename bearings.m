function [ outputArguments ] = bearings( axialForce, radialForce, designLife, rotationalSpeed )

%{
axialForce F_a
radialForce F_r

designLife, L_D
rotationalSpeed [rev/min]

%}

%% Bearing calculations, using tapered roller bearings
% See example 11-8
K = 1.5; % geometry-factor initial guess is 1.5

% As this bearing is alone, it carries the net thrust load
Fe = 0.4*radialForce + KA * axialForce; % N, dynamic equivalent load. eq. 11-19

% 


xD = designLife * rotaitonalSpeed * 60/LR; % multiple of rating life



end

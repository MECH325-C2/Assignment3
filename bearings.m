%% Tapered roller bearing calculation
clc, clear,

%% Application-spesific variables

F_rA = 183.0 * 4.45 * 2.5; % [N]
F_rB = 319.8 * 4.45 * 2.5; % [N]
F_ae = 75 * 4.45 * 2.5; % [N]

R_D = 0.95; % reliability-factor

designLife = 2.5*4*250*16; % [hours]
rotationalSpeed = 120; % [rpm]

applicationFactor = 3; % a_f (see table 11-5), ASSUMPTION of machinery with moderate impact


%% Constants 
a = 10/3;   % for roller bearings in general
V = 1;      % as inner race rotates

L_D = designLife * rotationalSpeed * 60;    % [revolutions] desiered life
L_R = 90*10^6;                              % [revolutions] rating life
x_D = L_D / L_R;                            % dimensionaless multiple of rating life (for convenience)


%% Values used by Timken manufacturer (see top of page 590)
x_0 = 0;        % guaranteed life
b = 3/2;        % shape parameter
theta = 4.48;   % scale parameter


%% Bearing calculations, using tapered roller bearings
% See example 11-8


%% Bearings-spesific variables
K_A = 1.5; % geometry factor for A, initial guess is 1.5
K_B = 1.5; % geometry factor for B

R_DA = sqrt(R_D); % estimate R_D for each bearing
R_DB = sqrt(R_D); % estimate R_D for each bearing

while true
    
    F_iA = 0.47*F_rA/K_A;
    F_iB = 0.47*F_rB/K_B;
    
    F_eA = 0.4*F_rA + K_A*(F_iB+F_ae);
    F_eB = F_rB;

    % for bearing A
    C_10 = applicationFactor * F_eA * (x_D/(x_0+(theta-x_0)*(1-R_DA)^(1/b)))^(1/a); % eq 11-10, caltaloge entry C_10 should equal or exceed this value
    
    display(['For A: C_10 = ' num2str(C_10)]);
    K_Anew = input('New K = ');
    
    % for bearing B
    C_10 = applicationFactor * F_eB * (x_D/(x_0+(theta-x_0)*(1-R_DB)^(1/b)))^(1/a); % eq 11-10, caltaloge entry C_10 should equal or exceed this value

    display(['For B: C_10 = ' num2str(C_10)]);
    K_Bnew = input('New K = ');
    
    if (K_A == K_Anew && K_B == K_Bnew)
        break;
    else 
        K_A=K_Anew;
        K_B=K_Bnew;
    end
end


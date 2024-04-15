%%% FILE USED TO CHOOSE YOUR VARIABLE(S) THAT YOU WOULD LIKE TO VARY
%%% Written by Gael PILLONNET, version May 2023 

%% if you would like to fix all input variable (1D mode), keep this part (and comment others parts)
Var_i_name='None';
Var_i=1;
Var_j_name='None';
Var_j=1;

%% if would like to vary only one variable (2D mode), keep this part (and comment others parts)
% Var_i_name='M';               % possible name: 'M','alpha','beta','rho','mode','gamma','Kf','delta'
% Var_i=linspace(0.05,0.5,10);  % give the values for the sweep
% Var_j_name='None';            % possible name: 'M','alpha','beta','rho','mode','gamma','Kf','delta'
% Var_j=1;                      % give the values for the sweep

%% if would like to vary two variables (3D mode), keep this part (and comment others parts)
% Var_i_name='M';                 % possible name: 'M','alpha','beta','rho','mode','gamma','Kf','delta'
% Var_i=linspace(0.05,0.15,5);    % give the values for the sweep
% Var_j_name='alpha';             % possible name: 'M','alpha','beta','rho','mode','gamma','Kf','delta'
% Var_j=linspace(0,2,5);          % give the values for the sweep
%%% FILE DEDICATED FOR DEFINE THE DEFAULT VALUE OF THE INPUT VARIABLES
%%% Written by Gael PILLONNET, version May 2023 

M=0.1;          % voltage conversion ratio
beta=0;         % beta
alpha=2;        % alpha
gamma=0;        % gamma=0 (inductor volume is limited by DCR), gamma=1 (inductor volume is limited by Isat)
mode=0;         % if =0 the drain-source voltage is considered for Vs (DS option in the article), =1 => the terminal voltage is considered for Vs (TV option in the article)
rho=100;        % ratio capacitor / inductor energy density
Kf=10;          % ratio between Fsw and Fres (must be >>1, =1 resonant mode where model is not valid)
delta=0.3;      % relative inductor current ripple delta_IL/Il
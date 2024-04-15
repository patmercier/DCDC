%%% FILE TO RUN FOR OBTAINING THE RESULTS OF THE BENCHMARKING (SEE README.PDF FOR THE PROCEDURE)
%%% Written by Gael PILLONNET, version May 2023 

%% clean from the previous Matlab state
clear
clc
all_fig=findall(0, 'type', 'figure');
close(all_fig)

%% INPUT VARIABLES - same notation than in the article
input_variable_definition

%% CHOOSE YOUR VARIABLE YOU WOULD LIKE TO VARY
input_variable_to_vary

%% DEFINE ALL TOPOLOGICAL VARIABLES
topological_variable_definition

%% INTERNAL VARIABLES FOR CODE DEFINITION
internal_variable_definition

%% THE ANALYTICAL CALCULATION OF DESIGN PARAMETERS BEGINS
for i=1:length(Var_i)
    for j=1:length(Var_j)
        which_variables_in_the_loop
        for k=1:Ntopo
            resolve_analytical_equations;
        end
        % Normalization of flying capacitor value (2ML acts as the baseline) and total volume value (related to 1B)
        Cf_ref=Cf(i,j,2);
        Vcf_ref=Vcf(i,j,2);
        Vt_ref=Vt(i,j,1);
        for k=1:Ntopo
            % flying capacitor values (compared to 2ML)
            Cf(i,j,k)=Cf(i,j,k)/Cf_ref;
            % Flying capacitor volume (compared to 2ML)
            Vcf(i,j,k)=Vcf(i,j,k)/Vcf_ref;
            % total passive volume (compared to 1B)
            Vt(i,j,k)=Vt(i,j,k)/Vt_ref;
        end
        % find the best topo (BT) considering a performance metric (used in 3D mode for plotting)
        [Vt_BT(i,j),BT_Vt(i,j)]=min(Vt(i,j,:)); % The Best Topology (BT) for achieving the minimal total volume (U_T) for each {var_i,var_j} couple: topology index is stored in BT_Vt and the min volume if stored in Vt_BT
        Vlr_BT(i,j)=Vlr(i,j,BT_Vt(i,j));        % Store the inductor volume for the best topology described above
        [Vl_BT(i,j),BT_Vl(i,j)]=min(Vl(i,j,:)); % The Best Topology (BT) for achieving the minimal inductor volume (U_L) for each {var_i,var_j} couple
        [A_BT(i,j),BT_A(i,j)]=min(Amin(i,j,:)); % The Best Topology (BT) for achieving the minimal switch area (A) for each {var_i,var_j} couple
        [BW_BT(i,j),BT_BW(i,j)]=max(BW(i,j,:)); % The Best Topology (BT) for achieving the miximal bandwidth (BW) for each {var_i,var_j} couple
    end
end

%% Plot the result
plot_result
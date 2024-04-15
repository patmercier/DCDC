%%% FILE USED FOR SETTING THE I and J VARIABLES IN THE MAIN LOOP
%%% Written by Gael PILLONNET, version May 2023 

%% Variable "i" definition
if strcmp(Var_i_name,'None')
    Var_i(i);   % no variable
else
    if strcmp(Var_i_name,'M')
        M=Var_i(i);
    else
        if strcmp(Var_i_name,'alpha')
            alpha=Var_i(i);
        else
            if strcmp(Var_i_name,'beta')
                beta=Var_i(i);
            else
                if strcmp(Var_i_name,'rho')
                    rho=Var_i(i);
                else
                    if strcmp(Var_i_name,'mode')
                        mode=Var_i(i);
                    else
                        if strcmp(Var_i_name,'gamma')
                            gamma=Var_i(i);
                        else
                            if strcmp(Var_i_name,'Kf')
                                Kf=Var_i(i);
                            else
                                if strcmp(Var_i_name,'delta')
                                    delta=Var_i(i);
                                else
                                    fprintf('the variable name defined is not allowed to vary (only M,alpha,beta,rho,mode,gamma,Kf,delta are possible).\n')
                                    stop
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%% Variable "j" definition
if strcmp(Var_j_name,'None')
    Var_j(j);   % no variable
else
    if strcmp(Var_j_name,'M')
        M=Var_j(j);
    else
        if strcmp(Var_j_name,'alpha')
            alpha=Var_j(j);
        else
            if strcmp(Var_j_name,'beta')
                beta=Var_j(j);
            else
                if strcmp(Var_j_name,'rho')
                    rho=Var_j(j);
                else
                    if strcmp(Var_j_name,'mode')
                        mode=Var_j(j);
                    else
                        if strcmp(Var_j_name,'gamma')
                            gamma=Var_j(j);
                        else
                            if strcmp(Var_j_name,'Kf')
                                Kf=Var_j(j);
                            else
                                if strcmp(Var_j_name,'delta')
                                    delta=Var_j(j);
                                else
                                    fprintf('the variable name defined is not allowed to vary (only M,alpha,beta,rho,mode,gamma,Kf,delta are possible).\n')
                                    stop
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

%% Internal variables for the loop
X(i,j)=Var_i(i);
Y(i,j)=Var_j(j);
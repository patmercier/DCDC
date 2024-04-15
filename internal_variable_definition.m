%%% FILE DEDICATED FOR SETTING INTERNAL VARIABLES FOR THE CODE
%%% Written by Gael PILLONNET, version May 2023 

%% for plotting
if strcmp(Var_i_name,'None') && strcmp(Var_j_name,'None')
    mode_plot='1D';
else
    if strcmp(Var_j_name,'None')
        mode_plot='2D';
    else
        mode_plot='3D';
    end
end

Ntopo=length(topo);     % number of topology screened
for i=1:Ntopo
    Vsr(i).value=Vs(i).value;
    if length(Vs(i).value)<10
        Vsr(i).value(10)=0;
    end
    Vstr(i).value=Vst(i).value;
    if length(Vst(i).value)<10
        Vstr(i).value(10)=0;
    end
end
plotColors=parula(Ntopo);

%% for the memory allocation of each table
Ni=length(Var_i);
Nj=length(Var_j);
Nk=Ntopo;
Nloop=Ni*Nj*Nk;
Romin(Ni,Nj,Ntopo)=0;
Amin(Ni,Nj,Ntopo)=0;
F(Ni,Nj,Ntopo)=0;
Lmin(Ni,Nj,Ntopo)=0;
Lv(Ni,Nj,Ntopo)=0;
L(Ni,Nj,Ntopo)=0;
OPT(Ni,Nj,Ntopo)=0;
Co(Ni,Nj,Ntopo)=0;
Cf(Ni,Nj,Ntopo)=0;
BW(Ni,Nj,Ntopo)=0;
Vl(Ni,Nj,Ntopo)=0;
Vcf(Ni,Nj,Ntopo)=0;
Vco(Ni,Nj,Ntopo)=0;
Vt(Ni,Nj,Ntopo)=0;
Vlr(Ni,Nj,Ntopo)=0;
Vcfr(Ni,Nj,Ntopo)=0;
Ron(Ni,Nj,Ntopo,10)=0;
Asw(Ni,Nj,Ntopo,10)=0;
Vtr_BT(Ni,Nj,Ntopo)=0;
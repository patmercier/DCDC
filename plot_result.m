%%% FILE DEDICATED FOR PLOTTING THE RESULTS OF THE BENCHMARKING
%%% Written by Gael PILLONNET, version May 2023 

fprintf('*** Topology Index Number = Topology Name *** \n');
for i=1:Ntopo
    fprintf('Index %d = ',i);
    fprintf(topo(i).namepaper)
    fprintf('\n');
    TopoIndex(i)=i;
    TopoName(i)=convertCharsToStrings(topo(i).namepaper);
end
T_topo=table(TopoIndex',TopoName');

%% Plotting when one input variable is variable (2D mode)
if mode_plot=='1D'
    
    for i=1:Ntopo
    % max achievable voltage conversion ratio
    Mmax1D(i)=Mmax(i).value;
    end
    
    for i=1:Ntopo   % define 1D vector (as i and j are not variable in 1D mode)
        Amin1D(i)=Amin(1,1,i);
        F1D(i)=F(1,1,i);
        L1D(i)=L(1,1,i);
        Co1D(i)=Co(1,1,i);
        Cf1D(i)=Cf(1,1,i);
        Vl1D(i)=Vl(1,1,i);
        Vco1D(i)=Vco(1,1,i);
        Vcf1D(i)=Vcf(1,1,i);
        Vt1D(i)=Vt(1,1,i);
        Vlr1D(i)=Vlr(1,1,i);
        Vcfr1D(i)=Vcfr(1,1,i);
        BW1D(i)=BW(1,1,i);
        OPT1D(i)=OPT(1,1,i);
    end
    for i=1:Ntopo
        Ron2D(i,:)=Ron(1,1,i,:);
        Asw2D(i,:)=Asw(1,1,i,:);
    end

    plot1D_1=[Amin1D',F1D',L1D',Co1D',Cf1D'/10];
    f1=figure(1);
    movegui(f1,'northwest');
    bar(plot1D_1)
    xlabel('Topology Index Number')
    ylabel('Design parameters')
    legend('A','F','L','C_O','C_F/10')
    grid on

    f2=figure(2);
    movegui(f2,'north');
    bar(1./Vt1D')
    xlabel('Topology Index Number')
    ylabel('Total Volume Reduction Gain (1/U_T)')
    grid on
   
    f3=figure(3);
    movegui(f3,'northeast');
    bar(BW1D')
    xlabel('Topology Index Number')
    ylabel('Bandwidth (BW)')
    grid on
    
    f4=figure(4);
    movegui(f4,'southwest');
    bar(Ron2D)
    xlabel('Topology Index Number')
    ylabel('On-State Resistance')
    legend('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10')
    title('ON-State of Each Switch')
    grid on

    f5=figure(5);
    movegui(f5,'south');
    bar(Asw2D)
    xlabel('Topology Index Number')
    ylabel('Switch Area')
    legend('S1','S2','S3','S4','S5','S6','S7','S8','S9','S10')
    title('Relative Area of Each Switch')
    grid on
   
    f6=uifigure;
    movegui(f6,'southeast');
    uit=uitable(f6);
    uit.Data=T_topo;
    uit.ColumnName={'Topo Index','Topo Name'};

% optional plotting
%     figure(7)
%     bar(Mmax1D)
%     xlabel('Topology Index Number')
%     ylabel('Maximal Natural Voltage Conversion Ratio')
%     title('Max Voltage Convertion Ratio')
%     grid on

%     figure(8)
%     bar(OPT1D)
%     xlabel('Topology Index Number')
%     title('Who is flying-capacitor-limited sizing (0 not limited, 1 otherwise)')
%     grid on

end

%% Plotting when one input variable is variable (2D mode)
legend_plot=convertCharsToStrings(topo(1).namepaper);
for i=2:Ntopo
    legend_plot=[legend_plot convertCharsToStrings(topo(i).namepaper)];
end

if mode_plot=='2D'
    
    for i=1:length(Var_i)
        Amin2D(i,:)=Amin(i,1,:);
        F2D(i,:)=F(i,1,:);
        L2D(i,:)=L(i,1,:);
        Co2D(i,:)=Co(i,1,:);
        Cf2D(i,:)=Cf(i,1,:);
        Vl2D(i,:)=Vl(i,1,:);
        Vco2D(i,:)=Vco(i,1,:);
        Vcf2D(i,:)=Vcf(i,1,:);
        Vt2D(i,:)=Vt(i,1,:);
        Vlr2D(i,:)=Vlr(i,1,:);
        Vcfr2D(i,:)=Vcfr(i,1,:);
        BW2D(i,:)=BW(i,1,:);
        OPT2D(i,:)=OPT(i,1,:);
    end
     
    f1=figure(1);
    movegui(f1,'northwest');
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,Amin2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Switch area (A)')
    legend(legend_plot)
    
    f2=figure(2);
    movegui(f2,'north');
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,1./Vt2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Volume reduction (1/U_T)')
    legend(legend_plot)
    
    f3=figure(3);
    movegui(f3,'northeast');
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,BW2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Bandwidth (BW)')
    legend(legend_plot)
    
    f4=figure(4);
    movegui(f4,'southwest');
    subplot(5,1,1)
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,Amin2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Switch Area (A)')
    legend(legend_plot)
    grid on
    
    subplot(5,1,2)
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,F2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Switching frequency (F)')
    grid on
    
    subplot(5,1,3)
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,L2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('inductor value (L)')
    grid on
    
    subplot(5,1,4)
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,Co2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Output capacitor value (C_O)')
    grid on
    
    subplot(5,1,5)
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,Cf2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Flying capacitor value (C_F)')
    grid on
    
    f5=figure(5);
    movegui(f5,'south');
    for ip=1:Ntopo
        switch mod(ip,4)
            case 0
                plotLine='-';
            case 1
                plotLine='--';
            case 2
                plotLine=':';
            case 3
                plotLine='-.';
        end
        plot(Var_i,Vlr2D(:,ip),plotLine,'Color',plotColors(ip,:),'lineWidth',2)
        hold on
    end
    xlabel(Var_i_name)
    ylabel('Inductor volume contribution (U_L/U_T)')
    legend(legend_plot)
    ylim([0 1])
    grid on
end

%% Plotting when two input variables are variable (3D mode)
if mode_plot=='3D'
       
    color_v=parula(Ntopo);
    axis_v=[min(Var_i) max(Var_i) min(Var_j) max(Var_j) 1 Ntopo 1 Ntopo];
    
    f1=figure(1);
    movegui(f1,'northwest');
    surface(X,Y,BT_A)
    xlabel(Var_i_name)
    ylabel(Var_j_name)
    title('Best topo to minimize A')
    axis(axis_v)
    colormap(jet(Ntopo))
    colorbar
    grid on
    
    f2=figure(2);
    movegui(f2,'north');
    surface(X,Y,BT_Vt)
    xlabel(Var_i_name)
    ylabel(Var_j_name)
    title('Best topo to minimize U_T')
    axis(axis_v)
    colormap(jet(Ntopo))
    colorbar
    grid on
    
    f3=figure(3);
    movegui(f3,'northeast');
    surface(X,Y,BT_BW)
    xlabel(Var_i_name)
    ylabel(Var_j_name)
    title('Best topo to maximize BW')
    axis(axis_v)
    colormap(jet(Ntopo))
    colorbar
    grid on
    
    f4=figure(4);
    movegui(f4,'southwest');
    colormap default
    surface(X,Y,1./Vt_BT)
    xlabel(Var_i_name)
    ylabel(Var_j_name)
    title('Total volume gain (1/U_T) for the best topology')
    
    colorbar
    grid on
    
    f5=figure(5);
    movegui(f5,'south');
    surface(X,Y,BT_Vl)
    xlabel(Var_i_name)
    ylabel(Var_j_name)
    title('Best topo to minimize U_L')
    axis(axis_v)
    colormap(jet(Ntopo))
    colorbar
    grid on
    
    f6=uifigure;
    movegui(f6,'southeast');
    uit=uitable(f6);
    uit.Data=T_topo;
    uit.ColumnName={'Topo Index','Topo Name'};
end
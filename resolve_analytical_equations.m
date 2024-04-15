%%% FILE DEDICATED FOR CALCULATING ALL DESIGN PARAMETERS BASED ON INPUT/TOPOLOGICAL VARIABLES
%%% Written by Gael PILLONNET, version May 2023 

if M<Mmax(k).value % if topo can achieve this voltage ratio

    %% choose the value of the Vs vector (mode=0, drain-source considered, terminal otherwise)
    Vs_q=Vs(k).value;
    Vst_q=Vst(k).value;
    if mode==0
        Vsw(k).value=Vs_q;
    else
        if mode==1
            Vsw(k).value=Vst_q;
        else
            fprintf('The mode variable can have only to value (0 or 1). Please see the definition of this variable in the paper \n')
            stop
        end
    end

    %% Variable assignement with the targeted M
    Ms=M;   % now the symbolic variable is a number
    C2i=double(subs(C2(k).value));  % to remplace the symboli variable defined in the C2 vector (using the symbolic Ms variable) by numbers
    Vswi=Vsw(k).value;
    Si=S(k).value;
    Ti=T(k).value;
    Vci=Vc(k).value;
    si=s(k).value;
    Ci=sqrt(C2i);                   % define the C vector (before it was C^2)
    l=Ti(1);p=Ti(2);m=Ti(3);d=Ti(4);% T vector stores [l p m d] values

    %% Switch area (A) determination
    Romin2L=sum(sqrt(double(subs(C2(1).value))).*Vsw(1).value.^(alpha/2))^2;    % calculate the minimal output impedance of the baseline topology (1B)
    Romin(i,j,k)=sum(Ci.*Vswi.^(alpha/2))^2;        % calculate the minimal output impedance for the same area for the given topology
    Amin(i,j,k)=Romin(i,j,k)/Romin2L;               % find the normalized switch area to obtain the same output impedance (Ro_1B=Ro_k)
    for q=1:length(Vswi)                            % calculate the on-state resistance of each switch in the toplogy and the associated area
        Ron(i,j,k,q)=Vswi(q)^(alpha/2)/Ci(q)*sum(Ci.*Vswi.^(alpha/2))/Romin2L;
        Asw(i,j,k,q)=Vswi(q).^2./Ron(i,j,k,q)/Romin2L;
    end
    if length(Vswi)<10      % compleye the Vs vector up to 10 for have the same vector length for following calulation
        Ron(i,j,k,10)=0;
    end

    %% switching frequency (F) determination

    F(i,j,k)=1/(sum(Si.*Vswi.^(alpha/2+beta).*Ci)*sum(Ci.*Vswi.^(alpha/2))/(1+2*sqrt(M*(1-M))));    % relative frequency to have the same switching loss compared to 2L-buck

    %% inductor value (L) determination

    % find the minimal inductor value for respecting the current inductor ripple
    Lmin(i,j,k)=d*l*(m-M)/(1-M)*1/(1+2*sqrt(M*(1-M)))*sum(Si.*Ci.*Vswi.^(alpha/2+beta))*sum(Ci.*Vswi.^(alpha/2));
    % find the L value for minimizing the total volume
    if k==1     % k=1 means: the baseline is calculated
        Lv(i,j,k)=0;
        a=rho/(delta*l^gamma)*(1-M);
        b=0;
    else
        if k==2 % k=2 means: the 2ML is calculate
            L2ML=Lmin(i,j,2);
        else
            L2ML=L(i,j,2);
        end       
        F2ML=F(i,j,2);  % calculate the switching frequency of 2ML topology
        a=rho/(delta*l^gamma)*(1-M);    % define a and b coefficient for total volume determination
        b=delta*Kf^2/(16*pi^2)*1/(1-M)*1/(F2ML^2*L2ML)*d^2*si*sum(Vci.^2)/F(i,j,k)^2;
        Lv(i,j,k)=sqrt(b/a);    % calculate the minimal inductor value to have the minimal total volume
    end
    if Lv(i,j,k)>Lmin(i,j,k)    % if this minimal value is higher than the minimal value caluclated for ripple required, then
        L(i,j,k)=Lv(i,j,k);     % the inductor value is limited by the size of capacitor (the capacitor volume is not negligible)
        OPT(i,j,k)=1;           % internal vairable to plot if required to see where you are limited by the capacitor (mainly close to the natural VCR)
    else
        L(i,j,k)=Lmin(i,j,k);   % the inductor is not limited by the capacitor volume. The inductor value is only fixed by the inductor ripple
        OPT(i,j,k)=0;
    end

    %% capacitor values (Co, Cf) determination
    Co(i,j,k)=d/p*(m-l*M)/(1-M)/(L(i,j,k)*F(i,j,k)^2);
    Cf(i,j,k)=d^2*si/(L(i,j,k)*F(i,j,k)*F(i,j,k));    % flying capacitor value

    %% Bandwidth (BW) determination
    BW(i,j,k)=1/sqrt(L(i,j,k)*Co(i,j,k));
    if k==1 % if you calculate the baseline (1B is always the first topology calculate for normalization purpose)
        BW_1B(i,j)=BW(i,j,k);
    else
        BW(i,j,k)=BW(i,j,k)/BW_1B(i,j);
    end

    %% Normalized volume
    Vl(i,j,k)=L(i,j,k)/l^gamma;         % the (noramlized) inductor volume
    Vcf(i,j,k)=sum(Cf(i,j,k)*Vci.^2);   % the (normalized) total flying capacitor volume
    Vco(i,j,k)=Co(i,j,k);               % the (normalized) output capacitor volume
    Vt(i,j,k)=a*L(i,j,k)+b/L(i,j,k);    % the (normalized) total passive volume (the output capacitor is excluded, see paper assumption)
    Vlr(i,j,k)=a*L(i,j,k)/Vt(i,j,k);    % the relative contribution of inductor volume in the total volume
    Vcfr(i,j,k)=b/L(i,j,k)/Vt(i,j,k);   % the relative contribution of flying capacitors in the total volume

    %% if the topology cannot generate the targeted M, the design values are not calculated
else
    Romin(i,j,k)=NaN;
    Amin(i,j,k)=NaN;
    F(i,j,k)=NaN;
    Lmin(i,j,k)=NaN;
    Lv(i,j,k)=NaN;
    L(i,j,k)=NaN;
    OPT(i,j,k)=NaN;
    Co(i,j,k)=NaN;
    Cf(i,j,k)=NaN;
    BW(i,j,k)=NaN;
    Vl(i,j,k)=NaN;
    Vcf(i,j,k)=NaN;
    Vco(i,j,k)=NaN;
    Vt(i,j,k)=NaN;
    Vlr(i,j,k)=NaN;
    Vcfr(i,j,k)=NaN;
    Ron(i,j,k,1:10)=NaN;
    Asw(i,j,k,1:10)=NaN;
end
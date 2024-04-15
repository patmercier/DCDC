%%% FILE DEDICATED FOR SETTING THE TOPOLOGIES THAT YOU WOULD LIKE TO COMPARE
%%% Written by Gael PILLONNET, version May 2023 

%%% The voltage conversion ratio is defined by Ms (not M), Ms is a symbolic variable
syms Ms

%%% 1B TOPOLOGY (2-level buck)
% Leave the 1B topology, the first defined, you cannot comment the 1B as it serves as the toplogy baseline 
rank=1;
topo(rank).fullname='1-phase 2-level buck';
topo(rank).namepaper='1B';
C2(rank).value=[Ms 1-Ms];       % C vector (square) = C^2, Ms is the voltage conversion ratio (M), please use Ms, not M
Vs(rank).value=[1 1];           % Vs vector if DS is considered
Vst(rank).value=[1 1];          % Vs vector is the terminal voltage is considered
S(rank).value=[1 1];            % S vector for the switching activity
T(rank).value=[1 1 1 1];        % T vector represents [l,p,m,d] coefficients defined in the paper
Vc(rank).value=0;               % Vc vector (DC voltage across each flying capacitor)
s(rank).value=0;                % S coefficient as defined in the paper
Mmax(rank).value=1;             % maximal voltage conversion ratio of the topology

%%% 2ML TOPOLOGY (1-phase 3-level buck, FMCL3)
% Leave the 2ML topology, the second defined, you cannot comment the 2ML as it serves for C_F normalization
rank=rank+1;
topo(rank).fullname='1-phase 3-level buck';
topo(rank).namepaper='2ML';
C2(rank).value=[Ms 1-Ms Ms 1-Ms];
Vs(rank).value=[0.5 0.5 0.5 0.5];
Vst(rank).value=[1 0.5 1 0.5];
S(rank).value=[1 1 1 1];
T(rank).value=[1 2 1/2 1];
Vc(rank).value=1/2;
s(rank).value=1;
Mmax(rank).value=1/2;

%%% 3ML TOPOLOGY (1-phase 4-level buck, FCML4)
rank=rank+1;
topo(rank).fullname='1-phase 4-level buck';
topo(rank).namepaper='3ML';
C2(rank).value=[Ms 1-Ms Ms 1-Ms Ms 1-Ms];
Vs(rank).value=[1/3 1/3 1/3 1/3 1/3 1/3];
Vst(rank).value=[2/3 1/3 1 1/3 1 1/3];
S(rank).value=[1 1 1 1 1 1];
T(rank).value=[1 3 1/3 1];
Vc(rank).value=[1/3 2/3];
s(rank).value=2;
Mmax(rank).value=1/3;

%%% 3SP TOPOLOGY (1-phase 2-flying-cap series-parallel)
rank=rank+1;
topo(rank).fullname='1-phase 2-flying-cap series-parallel (N=3)';
topo(rank).namepaper='3SP';
C2(rank).value=[1-2*Ms Ms Ms/2 1-5/2*Ms Ms Ms/2 Ms/2];
Vs(rank).value=[1/3 1/3 1/3 1/3 2/3 2/3 2/3];
Vst(rank).value=[1/3 1/3 2/3 1/3 1 1 2/3];
S(rank).value=[2 1 2 1 1 1 2];
T(rank).value=[1 3 1/3 1];
Vc(rank).value=[1/3 1/3];
s(rank).value=2;
Mmax(rank).value=1/3;

%%% 3FB TOPOLOGY (1-phase 2-flying-cap Fibonacci)
rank=rank+1;
topo(rank).fullname='1-phase 2-flying-cap Fibonacci (N=3)';
topo(rank).namepaper='3FB';
C2(rank).value=[1-5/2*Ms 2*Ms 1-2*Ms Ms Ms Ms/2 Ms/2];
Vs(rank).value=[1/3 1/3 1/3 1/3 2/3 2/3 1/3];
Vst(rank).value=[1/3 2/3 1/3 1/3 1 2/3 1];
S(rank).value=[1 2 2 1 1 1 2];
T(rank).value=[1 3 1/3 1];
Vc(rank).value=[1/3 2/3];
s(rank).value=2;
Mmax(rank).value=1/3;

%%% 3DS TOPOLOGY (1-phase 2-flying-cap Split Dickson)
rank=rank+1;
topo(rank).fullname='1-phase 2-flying-cap Dickson (N=3)';
topo(rank).namepaper='3DS';
C2(rank).value=[3/4*Ms Ms 1/4 1/4+Ms/4 3/4*Ms 1/4+Ms/4 1/4];
Vs(rank).value=[1/3 2/3 1/3 1/3 1/3 1/3 1/3];
Vst(rank).value=[2/3 1 1/3 1/3 1 1/3 1/3];
S(rank).value=[2 1 1 2 1 1 1];
T(rank).value=[1 2 1/3 3/2];
Vc(rank).value=[1/3 2/3];
s(rank).value=2;
Mmax(rank).value=1/3;

%%% 4ML TOPOLOGY (1-phase 3-flying-cap multi-level topology, FCML4)
rank=rank+1;
topo(rank).fullname='1-phase 3-flying-cap FCML4';
topo(rank).namepaper='4ML';
C2(rank).value=[Ms 1-Ms Ms 1-Ms Ms 1-Ms Ms 1-Ms];
Vs(rank).value=[1/4 1/4 1/4 1/4 1/4 1/4 1/4 1/4];
Vst(rank).value=[1/2 1/4 3/4 1/4 1 1/4 1 1/4];
S(rank).value=[1 1 1 1 1 1 1 1];
T(rank).value=[1 4 1/4 1];
Vc(rank).value=[1/4 1/2 3/4];
s(rank).value=2;
Mmax(rank).value=1/4;

%%% 4SP TOPOLOGY (1-phase 3-flying-cap series-parallel)
rank=rank+1;
topo(rank).fullname='1-phase 3-flying-cap series-parallel (N=4)';
topo(rank).namepaper='4SP';
C2(rank).value=[1-3*Ms Ms Ms/3 1-11/3*Ms Ms Ms/3 Ms/3 Ms/3 Ms Ms/3];
Vs(rank).value=[1/4 1/4 1/4 1/4 1/4 1/2 1/2 3/4 3/4 3/4];
Vst(rank).value=[1/4 1/4 1/2 1/4 1/4 3/4 1/2 1 1 3/4];
S(rank).value=  [3 1 3 1 1 1 3 1 1 3];
T(rank).value=[1 4 1/4 1];
Vc(rank).value=[1/4 1/4 1/4];
s(rank).value=3;
Mmax(rank).value=1/4;

%%% 5FB TOPOLOGY (1-phase 3-flying-cap Fibonacci, N=5)
rank=rank+1;
topo(rank).fullname='1-phase 3-flying-cap Fibonacci (N=5)';
topo(rank).namepaper='5FB';
C2(rank).value=[1-14/3*Ms 3*Ms 1-3*Ms Ms/2 2*Ms Ms/3 Ms/3 Ms/3 Ms/2 Ms/2];
Vs(rank).value=[1/5 1/5 1/5 1/5 2/5 2/5 2/5 3/5 3/5 2/5];
Vst(rank).value=[1/5 2/5 1/5 1/5 3/5 2/5 2/5 1 3/5 1];
S(rank).value=[2 3 3 2 2 3 3 3 2 2];
T(rank).value=[1 5 1/5 1];
Vc(rank).value=[1/5 2/5 3/5];
s(rank).value=2/3;
Mmax(rank).value=1/5;

%%% 4DS TOPOLOGY (1-phase 3-flying-cap Split Dickson)
rank=rank+1;
topo(rank).fullname='1-phase 3-flying-cap dickson (N=4)';
topo(rank).namepaper='4DS';
C2(rank).value=[2/3*Ms 2/3*Ms 1/4+Ms 1/4+Ms 2/3*Ms 1/4-Ms/3 1/4-Ms/3 2/3*Ms];
Vs(rank).value=[1/4 1/2 1/4 1/4 1/2 1/4 1/4 1/4];
Vst(rank).value=[1/2 3/4 1/4 1/4 1 1/4 1/4 1];
S(rank).value=[1 1 1 1 1 1 1 1];
T(rank).value=[1 2 1/4 2];
Vc(rank).value=[1/4 1/2 3/4];
s(rank).value=2;
Mmax(rank).value=1/4;

%%% 1B2 TOPOLOGY (2-phase 2-level buck)
rank=rank+1;
topo(rank).fullname='2-phase 2-level buck';
topo(rank).namepaper='1B2';
C2(rank).value=[Ms/4 (1-Ms)/4 Ms/4 (1-Ms)/4];
Vs(rank).value=[1 1 1 1];
Vst(rank).value=[1 1 1 1];
S(rank).value=[1 1 1 1];
T(rank).value=[2 2 1 1];
Vc(rank).value=0;
s(rank).value=0;
Mmax(rank).value=1;

%%% 2DSD (double step down)
rank=rank+1;
topo(rank).fullname='2-phase Double Step-Down';
topo(rank).namepaper='2DSD';
C2(rank).value=[Ms/2 1/4+Ms Ms/2 1/4-Ms/2];
Vs(rank).value=[1/2 1/2 1 1/2];
Vst(rank).value=[1 1/2 1 1/2];
S(rank).value=[1 1 1 1];
T(rank).value=[2 2 1/2 2];
Vc(rank).value=1/2;
s(rank).value=1;
Mmax(rank).value=1/4;

%%% 4DSD (3-state double step down)
rank=rank+1;
topo(rank).fullname='2-phase 3-state Double Step-Down';
topo(rank).namepaper='4DSD';
C2(rank).value=[Ms/2 Ms/2 Ms/2 Ms/2 Ms 1/4+2*Ms 1/4-Ms];
Vs(rank).value=[1/2 1/2 1/2 1/2 1/2 1/4 1/4];
Vst(rank).value=[1 1/2 1 1/2 1/2 1/4 1/4];
S(rank).value=[1 1 1 1 2 2 2];
T(rank).value=[2 4 1/4 2];
Vc(rank).value=[1/2 1/4];
s(rank).value=2;
Mmax(rank).value=1/8;

%%% ADD NEW TOPOLOGY HERE
% if you would like to add an additional topology, define all topological
% parameters as previous example (the baseline, 1B, has to be the first topology described, and 2ML has to be the second one)
% Please use Ms, not M in the vector definition (as shown in the topology already described here)

%%% REMOVE A TOPOLOGY
% You can remove all topology described above EXCEPT 1B and 2ML as they act in the normalization procdeure (see the paper)
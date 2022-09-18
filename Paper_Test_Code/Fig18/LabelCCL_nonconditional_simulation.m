%% Fig. 18. Distinct sand-filled channels of unconditional simulation
% realizations using CCL
clear all;close all;clc;
addpath('../../export_fig-master');
addpath('../../relycode');
load('Theory_MultiTree_Snesim_nonconditon.mat');
% multiple search trees realization CCL 
[newlabel1,num1] = bwlabel(Theory_MultiTree_Snesim_nonconditon{1}{1});
% original Snesim realizationB CCL
[newlabel2,num2] = bwlabel(Theory_MultiTree_Snesim_nonconditon{1}{2});

figure(1);
% Set color mapping matrix
ColorMatrix=[0,139,0;255,255,0];

% Plot multiple search trees realization
axes1=subplot(1,2,1);
vislabels1(newlabel1,ColorMatrix);
axis on;
axis xy;
title(axes1,{'(a) multiple search trees realization'},'FontSize',14,...
    'position',[30.200000000000003,-7.846491228070176,0]);

set(axes1,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2],...
    'position',[0.1600 0.1100 0.3347 0.8150]);
colorbar('peer',axes1,'Ticks',[0.5 1.5],'fontsize',14,...
    'position',[0.83,0.11,0.025,0.123],'Visible','off');

% Plot original Snesim realization
axes2=subplot(1,2,2);
vislabels1(newlabel2,ColorMatrix);
axis on;
axis xy;
title(axes2,{'(b) original Snesim realization'},'FontSize',14,...
    'position',[30.200000000000003,-7.846491228070176,0]);
set(axes2,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2],...
    'position',[0.5200 0.1100 0.3347 0.8150]);
colorbar('peer',axes2,'Ticks',[0.5 1.5],'TickLabels',{'background','channel'},'fontsize',14,...
    'position',[0.855170549860202,0.111666666666668,0.017150046598325,0.123000000000001]);
set(gcf,'position',[2085,464,1073,420]);

% Fig. 18. Distinct sand-filled channels of unconditional simulation realizations using CCL
export_fig non-conditional_simulation_CCL.png -m2.5
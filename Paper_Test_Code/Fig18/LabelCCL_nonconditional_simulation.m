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

% create ellipse
annotation(gcf,'ellipse',...
    [0.235787511649581 0.257142857142857 0.0475302889095993 0.133333333333334],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create ellipse
annotation(gcf,'ellipse',...
    [0.30009319664492 0.538095238095242 0.0475302889095993 0.133333333333335],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create ellipse
annotation(gcf,'ellipse',...
    [0.601118359739048 0.445238095238099 0.0475302889095993 0.133333333333334],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create ellipse
annotation(gcf,'ellipse',...
    [0.656104380242308 0.538095238095243 0.0475302889095992 0.133333333333335],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create ellipse
annotation(gcf,'ellipse',...
    [0.600186393289839 0.254761904761907 0.0475302889095994 0.133333333333334],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create textbox
annotation(gcf,'textbox',...
    [0.215284249767008 0.255373346095801 0.0421013420633694 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create ellipse
annotation(gcf,'ellipse',...
    [0.244175209692451 0.440476190476192 0.0475302889095992 0.133333333333335],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create textbox
annotation(gcf,'textbox',...
    [0.226467847157502 0.529182869905328 0.0435916550646241 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create textbox
annotation(gcf,'textbox',...
    [0.289841565703633 0.657754298476758 0.0421013420633694 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create textbox
annotation(gcf,'textbox',...
    [0.575023299161228 0.255373346095803 0.0421013420633695 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create textbox
annotation(gcf,'textbox',...
    [0.579683131407267 0.524420965143424 0.043591655064624 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'b'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create textbox
annotation(gcf,'textbox',...
    [0.650512581547061 0.657754298476759 0.0421013420633695 0.0960076062851533],...
    'Color',[0 0 1],...
    'String',{'c'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% Fig. 18. Distinct sand-filled channels of unconditional simulation realizations using CCL
export_fig non-conditional_simulation_CCL.png -m2.5
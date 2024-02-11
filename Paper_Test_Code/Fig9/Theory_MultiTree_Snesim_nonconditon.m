%% Theory test, multiple trees and original Snesim, unconditional
% Fig. 9. Unconditional simulation realizations 
clear all;close all;clc
parpool('local', 4);
tic;
addpath('../../export_fig-master');
addpath(genpath('../../mGstat'));
addpath('../../relycode');

% training image
TI=channels;
TI=TI(1:2:end,1:2:end);

% Parameters setting
options.n_mulgrids=1;;
options.n_cond=[25 25 25 25];;
options.n_template=[81 81 81 81];

options.plot_interval=1;;

% set the data template and search tree
global T;
T = [];
global ST;
ST= [];
global Bool;

% Count the number of nodes for multiple search tree
global num;
num(4) = 0;

global num2;
num2(4) = 0;

% Multiple search tree and original Snesim comparision
Cal = {'MultiTree','OneTree'};
% Setting the size of work area
SIMT = {60};

for i = 1:size(SIMT,2)
    for j = 1:size(Cal,2)
        tic; 
        Bool = Cal{j};        
        SIM=ones(SIMT{i},SIMT{i})*NaN;
        rng(1);
        % Simulate
        [out{i}{j},outresult{i}{j}]=mps_snesim(TI,SIM,options);
        outresult{i}{j}.out = out{i}{j};
        % Statistic for the MST running time, the first element 2024.2.3
        elapsedTime(j) = toc;
    end  
end
toc;

%% Plot simulation results
figure(9);
% Define color mapping matrix
ColorMatrix=[0,139,0;255,255,0];

% Calculate color matrix
RGB_RE1=TI2RGB(out{1}{1},ColorMatrix);
RGB_RE2=TI2RGB(out{1}{2},ColorMatrix);

% Plot multiple search trees realization
axes1=subplot(1,2,1);imshow(RGB_RE1,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes1,{'(a) multiple search trees realization'},'FontSize',14,'position',...
    [30.200000000000003,-7.846491228070176,0]);

% set(axes1,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2]);
set(axes1,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2],'position',...
    [0.1600 0.1100 0.3347 0.8150]);
colorbar('peer',axes1,'Ticks',[0.5 1.5],'fontsize',14,'position',...
    [0.83,0.11,0.025,0.123],'Visible','off');

% Plot original Snesim realization
axes2=subplot(1,2,2);imshow(RGB_RE2,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes2,{'(b) original Snesim realization'},'FontSize',14,'position',...
    [30.200000000000003,-7.846491228070176,0]);
% set(axes2,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2]);
set(axes2,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2],'position',...
    [0.5200 0.1100 0.3347 0.8150]);
colorbar('peer',axes2,'Ticks',[0.5 1.5],'TickLabels',...
    {'background','channel'},'fontsize',14,'position',...
    [0.855170549860202,0.111666666666668,0.017150046598325,0.123000000000001]);
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
set(gcf, 'Color', 'white'); 
% Fig. 9. Unconditional simulation realizations 
export_fig non-conditional_simulation.jpg -m2
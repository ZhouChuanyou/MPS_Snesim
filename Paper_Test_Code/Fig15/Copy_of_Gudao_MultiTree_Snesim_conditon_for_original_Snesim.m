%% Gudao Oilfield test, multiple trees and original Snesim
clear all;close all;clc
tic; 
addpath('../../export_fig-master');
addpath(genpath('../../mGstat'));
addpath('../../relycode');
% training image
TI=load('Gudao_Ti.mat'); % Ng33 sublayer TI
TI = TI.data;
% Parameters setting
options.n_mulgrids=3;;
options.n_cond=[8 12 10];;
options.n_template=[14 22 25];
options.plot_interval=1;
% set the data template and search tree
global T; %single tree data template/original Snesim
T = [];
global ST;
ST= [];
global mT;  % multiple tree data template
mT = [];
global mST;  % multiple search tree
mST= [];
global Bool;

% Count the number of nodes for multiple search tree
global num;
num(4) = 0;
global num2;
num2(4) = 0;
% Multiple search tree and original Snesim comparision
Cal = {'OneTree','MultiTree'};

SIMT = {60};  % Not used in the program
for i = 1:size(SIMT,2)
    for j = 1:size(Cal,2)
        tic;
        Bool = Cal{j};        
        SIM=load('Gudao_condata.mat'); % Gudao hard data
        SIM= SIM.condata;
                
        rng(1);
        % Simulate
        [out{i}{j},outresult{i}{j}]=mps_snesim(TI,SIM,options);
        outresult{i}{j}.out = out{i}{j};     
        elapsedTime(j) = toc;
    end  
end
toc;

%% Plot simulation results
figure;
% Define color mapping matrix
ColorMatrix=[0,139,0;255,255,0];
ColorMatrixSIM=[0,139,0;255,255,0;255,255,255];

% Calculate color matrix
RGB_RE1=TI2RGB(out{1}{1},ColorMatrix);
RGB_RE2=TI2RGB(out{1}{2},ColorMatrix);

% Plot multiple search trees realization
axes1=subplot(1,2,1);imshow(RGB_RE1,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes1,{'(a) multiple search trees realization'},'FontSize',14,'Position',...
    [49.50008937387704,-14.35476432892137,0]);
set(axes1,'Xlim',[0,99],'Ylim',[0,94],'Clim',[0 2],'FontSize',13,...
    'position',[0.2,0.11,0.228866870190541,0.815]);
colorbar('peer',axes1,'Ticks',[0.5 1.5],...
    'TickLabels',{'background','channel'},'Visible','off');
set(gca,'XTickLabel',{'6.00','6.48','6.95','7.43','7.90'},...
    'XTick',[0,25,50,75,99],...
    'YTickLabel',{'3.00','3.57','4.04','4.52','4.90'},'YTick',[0,25,50,75,94]);

% Plot original Snesim realization
axes2=subplot(1,2,2);imshow(RGB_RE2,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes2,{'(b) original Snesim realization'},'FontSize',14,...
    'position',[49.50008937387704,-14.35476432892137,0]);
set(axes2,'Xlim',[0,99],'Ylim',[0,94],'Clim',[0 2],'FontSize',13,...
    'position',[0.490340909090909,0.11,0.228866870190541,0.815]);
colorbar('peer',axes2,'Ticks',[0.5 1.5],...
    'TickLabels',{'background','channel'},'FontSize',14,...
    'position',[0.719135236567414,0.152094154600476,0.01133344645389,0.123000000000001]);
set(gca,'XTickLabel',{'6.00','6.48','6.95','7.43','7.90'},...
    'XTick',[0,25,50,75,99],'YTickLabel',{'3.00','3.57','4.04','4.52','4.90'},...
    'YTick',[0,25,50,75,94]);
set(gcf,'position',[1936,414,1549,458]);
annotation('textbox','String','Y/(m)','position',...
    [0.206775750888321,0.818708114410708,0.044426493262436,0.071052630245686],'linestyle','none')
annotation('textbox','String','X/(m)','position',...
    [0.409840211674426,0.131980925258793,0.044426493262436,0.071052630245686],'linestyle','none')
annotation('textbox','String','Y/(m)','position',...
    [0.482073483231145,0.818708114410708,0.044426493262436,0.071052630245686],'linestyle','none')
annotation('textbox','String','X/(m)','position',...
    [0.685621345158849,0.131980925258793,0.044426493262436,0.071052630245686],'linestyle','none')
set(axes1,'Xlim',[0,99],'Ylim',[0,94],'Clim',[0 2],'FontSize',13,...
    'position',[0.208355188831504,0.11,0.228866870190541,0.815]);
set(axes2,'Xlim',[0,99],'Ylim',[0,94],'Clim',[0 2],'FontSize',13,...
    'position',[0.483775853678815,0.11,0.228866870190541,0.815]);
set(gcf, 'Color', 'white');
% Gudao_simulation.png
export_fig Gudao_simulation.png -m2.5
%% Theory test, multiple trees and original Snesim, conditional
% Fig. 11. Hard data and conditional simulation realizations
clear all;close all;clc
% parpool('local', 4);
tic;
addpath('../../export_fig-master');
addpath(genpath('../../mGstat'));
addpath('../../relycode');
set(groot, 'defaultAxesFontName', 'Times New Roman');
set(groot, 'defaultTextFontName', 'Times New Roman');

load('Theory_con_simulation.mat');
out = Theory_con_simulation;

%% Plot simulation results
figure(11);
% Define color mapping matrix
ColorMatrix=[0,139,0;255,255,0];
ColorMatrixSIM=[0,139,0;255,255,0;255,255,255];

% Calculate color matrix
RGB_RE1=TI2RGB(out{1}{1},ColorMatrix);
RGB_RE2=TI2RGB(out{1}{2},ColorMatrix);
% Set the simulating point to Nan in the sampling condition data to 2
SIM(isnan(SIM))=2;  
RGB_SIM=TI2RGB(SIM,ColorMatrixSIM);

%% Plot sampling condition data
set(gcf,'position',[138,495,1608,479]);
axes1=subplot(1,3,1);imshow(RGB_SIM,ColorMatrixSIM./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes1,{'(a) conditioning data'},'FontSize',14,'position',...
    [30.43328498675075,-10.072202166064972,0]);
set(axes1,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 3]);
colorbar('peer',axes1,'Ticks',[0.5 1.5 2.5],...
    'TickLabels',{'background','channel','unknown'},'FontSize',14,'Visible','on');

% Plot multiple search trees realization
axes2=subplot(1,3,2);imshow(RGB_RE1,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes2,{'(b) multiple search trees realization'},'FontSize',14,'position',...
    [30.43328498675075,-10.072202166064972,0]);
set(axes2,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2]);
colorbar('peer',axes2,'Ticks',[0.5 1.5],'TickLabels',{'background','channel'},'Visible','off');

% Plot original Snesim realization
axes3=subplot(1,3,3);imshow(RGB_RE2,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;
title(axes3,{'(c) original Snesim realization'},'FontSize',14,'position',...
    [30.43328498675075,-10.072202166064972,0]);
set(axes3,'Xlim',[0,60],'Ylim',[0,60],'Clim',[0 2]);
colorbar('peer',axes3,'Ticks',[0.5 1.5],'TickLabels',...
    {'background','channel'},'Visible','off');
axes3.Position = [0.61385788449059,0.11,0.172257372696506,0.815];

% create textbox
annotation(gcf,'textbox',...
    [0.42226368159204,0.275522778525647,0.029705573632514,0.099019609619589],...
    'Color',[0 0 1],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');

% create ellipse
annotation(gcf,'ellipse',...
    [0.437567164179104,0.251559251559252,0.036313432835821,0.125891728832905],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create ellipse
annotation(gcf,'ellipse',...
    [0.633462686567163,0.246361746361746,0.036313432835821,0.128638253638253],...
    'Color',[0 0 1],...
    'LineWidth',2,...
    'LineStyle','--');

% create textbox
annotation(gcf,'textbox',...
    [0.616915422885571 0.267172047836712 0.029705573632514 0.0990196096195894],...
    'Color',[0 0 1],...
    'String',{'a'},...
    'FontWeight','bold',...
    'FontSize',18,...
    'EdgeColor','none');
set(gcf, 'Color', 'white');
% Fig. 11. Hard data and conditional simulation realizations
export_fig conditional_simulation2.jpg -m2
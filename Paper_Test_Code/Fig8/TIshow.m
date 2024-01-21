%% Fig. 8. Training image
clear all;close all;clc
addpath('../../export_fig-master');
addpath('../../relycode');
figure(8);
% Set color mapping matrix
ColorMatrix=[0,139,0;255,255,0];

% data = TI;  % Here must give the data with TI.
TI=channels;
TI=TI(1:2:end,1:2:end);
data  = TI;
% Calculate color matrix
RGB_TI=TI2RGB(data,ColorMatrix);  

% Plot training image
axes1=subplot(1,1,1);imshow(RGB_TI,ColorMatrix./255,'InitialMagnification','fit');
axis on;
axis xy;

set(axes1,'Xlim',[0,125],'Ylim',[0,125],'Clim',[0 2]);
colorbar('peer',axes1,'Ticks',[0.5 1.5],'fontsize',14,'position',...
    [0.756,0.11,0.025,0.123],'TickLabels',{'background','channel'},'Visible','on');
set(gcf,'position',[2459,378,741,420]);
set(gcf, 'Color', 'white'); 
% Fig. 8. Training image
export_fig TI.jpg -m2
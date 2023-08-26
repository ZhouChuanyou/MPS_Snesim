clear;clc;
addpath('../../export_fig-master');
addpath('../../relycode');
%% Fig. 11. Variograms of the x and y directions in unconditional simulation realizations
clear;clc;
f = figure(11);
f.Position = [318,195,1146,420];
f.InnerPosition = [318,195,1146,420];

sub1h = subplot(1,2,1);
% ax = axes;
% ax(1).Box='on';

load('Theory_uncon_simulation.mat');
Multi = Theory_uncon_simulation{1}{1};
load('Unconditional_TI.mat');
TI = Unconditional_TI;
% TI = geoeas2matlab(TI,[80 80]);
[TIy,TIx,TIpair] = VariogramNew2(TI,'x',size(Multi,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);
hold on;

[Multiy,Multix,Multipair] = VariogramNew2(Multi,'x',size(Multi,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

Original = Theory_uncon_simulation{1}{2};
[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'x',size(Multi,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);

% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.25]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_x','Fontsize',12,'FontWeight','bold');
sub1h.Position = [0.1457,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.242,'x direction','FontSize',13);

sub2h = subplot(1,2,2);
% ax = axes;
% ax(1).Box='on';

[TIy,TIx,TIpair] = VariogramNew2(TI,'y',size(Multi,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);
hold on;

[Multiy,Multix,Multipair] = VariogramNew2(Multi,'y',size(Multi,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'y',size(Multi,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);
legend({'TI','Multiple search trees','Original Snesim'},'Box','on',...
    'fontsize',11,'Position',[0.7200,0.3500,0.1632,0.1476]);
% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.28]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_y','Fontsize',12,'FontWeight','bold');
sub2h.Position = [0.5546,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.272,'y direction','FontSize',13);
export_fig Variogram_Unconditional.jpg -m2
% close(f);

%% Fig. 13. Variograms of the x and y directions in conditional simulation realizations
clear;clc;
f = figure(13);
f.Position = [318,195,1146,420];
f.InnerPosition = [318,195,1146,420];

sub1h = subplot(1,2,1);
% ax = axes;
% ax(1).Box='on';
load('Theory_con_simulation.mat');
Multi = Theory_con_simulation{1}{1};
load('Conditional_TI.mat');
TI = Conditional_TI;
% TI = geoeas2matlab(TI,[80 80]);
[TIy,TIx,TIpair] = VariogramNew2(TI,'x',size(Multi,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);
hold on;

[Multiy,Multix,Multipair] = VariogramNew2(Multi,'x',size(Multi,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

Original = Theory_con_simulation{1}{2};
[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'x',size(Multi,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);
% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.28]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_x','Fontsize',12,'FontWeight','bold');
sub1h.Position = [0.1457,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.272,'x direction','FontSize',13);

sub2h = subplot(1,2,2);
% ax = axes;
% ax(1).Box='on';
[TIy,TIx,TIpair] = VariogramNew2(TI,'y',size(Multi,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);
hold on;

[Multiy,Multix,Multipair] = VariogramNew2(Multi,'y',size(Multi,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'y',size(Multi,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);
legend({'TI','Multiple search trees','Original Snesim'},'Box','on',...
    'fontsize',11,'Position',[0.7200,0.3500,0.1632,0.1476]);

% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.28]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_y','Fontsize',12,'FontWeight','bold');
sub2h.Position = [0.5546,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.272,'y direction','FontSize',13);
export_fig Variogram_Conditional.jpg -m2
% close(f);

%% Fig. 17. Variograms of the x and y directions in practical simulation realizations of the Gudao Oilfield
f = figure(17);
f.Position = [318,195,1146,420];
f.InnerPosition = [318,195,1146,420];

sub1h = subplot(1,2,1);
% ax = axes;
% ax(1).Box='on';
TI = load('Gudao_Ti.mat');
TI = TI.data;
% TI = geoeas2matlab(TI,[80 80]);
[TIy,TIx,TIpair] = VariogramNew2(TI,'x',size(TI,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
hold on;
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);

Multi = loadgeoeas('multiple search trees.out');
Multi = geoeas2matlab(Multi,[99 94]);
[Multiy,Multix,Multipair] = VariogramNew2(Multi,'x',size(TI,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

Original = loadgeoeas('original Snesim.out');
Original = geoeas2matlab(Original,[99 94]);
[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'x',size(TI,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);'Color','red','Marker','+','LineWidth',1
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);

Sisim = loadgeoeas('Sisim.out');
Sisim = geoeas2matlab(Sisim,[99 94]);
[Sisimy,Sisimx,Sisimpair] = VariogramNew2(Sisim,'x',size(TI,2)-1);
SisimyS = smooth(Sisimx,Sisimy,0.2,'loess');
% scatter(Sisimx,SisimyS);
% plot(Sisimx,SisimyS,'Color','black','Marker','>','LineWidth',1);
% legend({'TI','Multiple search trees','Original Snesim','Sisim'},'Box','on',...
%     'fontsize',11,'Position',[0.5595,0.1888,0.3339,0.2292]);
% legend({'TI','Multiple search trees','Original Snesim','Sisim'},'Box','on',...
%     'fontsize',11);
% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.30]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_x','Fontsize',12,'FontWeight','bold');
sub1h.Position = [0.1457,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.29,'x direction','FontSize',13);

sub2h = subplot(1,2,2);
% ax = axes;
% ax(1).Box='on';
TI = load('Gudao_Ti.mat');
TI = TI.data;
% TI = geoeas2matlab(TI,[80 80]);
[TIy,TIx,TIpair] = VariogramNew2(TI,'y',size(TI,2)-1);
TIyS = smooth(TIx,TIy,0.2,'loess');
% scatter(TIx,TIyS);
hold on;
plot(TIx,TIyS,'Color','magenta','Marker','o','LineWidth',1);

Multi = loadgeoeas('multiple search trees.out');
Multi = geoeas2matlab(Multi,[99 94]);
[Multiy,Multix,Multipair] = VariogramNew2(Multi,'y',size(TI,2)-1);
MultiyS = smooth(Multix,Multiy,0.2,'loess');
% scatter(Multix,MultiyS);
plot(Multix,MultiyS,'Color','blue','Marker','*','LineWidth',1);

Original = loadgeoeas('original Snesim.out');
Original = geoeas2matlab(Original,[99 94]);
[Originaly,Originalx,Originalpair] = VariogramNew2(Original,'y',size(TI,2)-1);
OriginalyS = smooth(Originalx,Originaly,0.2,'loess');
% scatter(Originalx,OriginalyS);
plot(Originalx,OriginalyS,'Color','red','Marker','+','LineWidth',1);

Sisim = loadgeoeas('Sisim.out');
Sisim = geoeas2matlab(Sisim,[99 94]);
[Sisimy,Sisimx,Sisimpair] = VariogramNew2(Sisim,'y',size(TI,2)-1);
SisimyS = smooth(Sisimx,Sisimy,0.2,'loess');
% scatter(Sisimx,SisimyS);
% plot(Sisimx,SisimyS,'Color','black','Marker','>','LineWidth',1);
% legend({'TI','Multiple search trees','Original Snesim','Sisim'},'Box','on',...
%     'fontsize',11,'Position',[0.5595,0.1888,0.3339,0.2292]);
legend({'TI','Multiple search trees','Original Snesim'},'Box','on',...
    'fontsize',11,'Position',[0.7167,0.2280,0.1632,0.1476]);

% set(ax,'FontSize',12)
set(gca,'FontSize',11); % ax.FontSize = 11;
ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',12);
ylabel('\gamma_y','Fontsize',12,'FontWeight','bold');
sub2h.Position = [0.5546,0.1117,0.3346,0.8132];
set(gca,'Box','on');
text(2,0.328,'y direction','FontSize',13);
export_fig Variogram_Gudao.jpg -m2
% close(f);

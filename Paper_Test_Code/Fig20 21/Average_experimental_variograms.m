clear;clc;
addpath('../../export_fig-master');
addpath('../../relycode');
f = figure(20);
% f.Position = [318,195,1146,420];
% f.InnerPosition = [318,195,1146,420];
% set(get(f, 'JavaFrame'), 'Maximized', true);
set(f,'units','normalized','outerposition',[0 0 1 1]);

% ax = axes;
% ax(1).Box='on';
%% Unconditional
subplot(3,4,1);
load('Theory_uncon_600simulation.mat');
celln = size(Theory_uncon_600simulation,2);
lagl = size(Theory_uncon_600simulation{1}{1}{1},2)-1;
REy = NaN(celln,lagl);REyS = NaN(celln,lagl);
% m_x
for i = 1:celln
    RE = Theory_uncon_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx1 = REx;
mREyS1 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.382,'a1','FontSize',13);
set(gca,'Box','on');
% m_y
subplot(3,4,2);
for i = 1:celln
    RE = Theory_uncon_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx2 = REx;
mREyS2 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.478,'a2','FontSize',13);
set(gca,'Box','on');
% s_x
subplot(3,4,3);
for i = 1:celln
    RE = Theory_uncon_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx3 = REx;
mREyS3 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.380,'b1','FontSize',13);
set(gca,'Box','on');
% s_y
subplot(3,4,4);
for i = 1:celln
    RE = Theory_uncon_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx4 = REx;
mREyS4 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.478,'b2','FontSize',13);
set(gca,'Box','on');

%% Conditional
subplot(3,4,5);
% ax = axes;
% ax(1).Box='on';
load('Theory_con_600simulation.mat');
celln = size(Theory_uncon_600simulation,2);
lagl = size(Theory_con_600simulation{1}{1}{1},2)-1;
REy = NaN(celln,lagl);REyS = NaN(celln,lagl);
% m_x
for i = 1:celln
    RE = Theory_con_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx5 = REx;
mREyS5 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.286,'c1','FontSize',13);
set(gca,'Box','on');
% m_y
subplot(3,4,6);
for i = 1:celln
    RE = Theory_con_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx6 = REx;
mREyS6 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.478,'c2','FontSize',13);
set(gca,'Box','on');
% s_x
subplot(3,4,7);
for i = 1:celln
    RE = Theory_con_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx7 = REx;
mREyS7 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.290,'d1','FontSize',13);
set(gca,'Box','on');
% s_y
subplot(3,4,8);
for i = 1:celln
    RE = Theory_con_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx8 = REx;
mREyS8 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.477,'d2','FontSize',13);
set(gca,'Box','on');

%% Practical
subplot(3,4,9);
% ax = axes;
% ax(1).Box='on';
TI = load('Gudao_Ti.mat');
TI = TI.data;
load('Gudao_600simulation.mat');
celln = size(Theory_uncon_600simulation,2);
lagl = size(TI,2)-1;
REy = NaN(celln,lagl);REyS = NaN(celln,lagl);
% m_x
for i = 1:celln
    RE = Gudao_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx9 = REx;
mREyS9 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.382,'e1','FontSize',13);
set(gca,'Box','on');
% m_y
subplot(3,4,10);
for i = 1:celln
    RE = Gudao_600simulation{i}{1}{1};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','blue','Marker','*','LineWidth',1);    
REx10 = REx;
mREyS10 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.382,'e2','FontSize',13);
set(gca,'Box','on');
% s_x
subplot(3,4,11);
for i = 1:celln
    RE = Gudao_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'x',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx11 = REx;
mREyS11 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.380,'f1','FontSize',13);
set(gca,'Box','on');
% s_y
subplot(3,4,12);
for i = 1:celln
    RE = Gudao_600simulation{i}{1}{2};
    % RE = geoeas2matlab(RE,[80 80]);
    [REy(i,:),REx,~] = VariogramNew2(RE,'y',lagl);
    REyS(i,:) = smooth(REx,REy(i,:),0.2,'loess');
    % scatter(REx,REyS);
    hold on;
    plot(REx,REyS(i,:),'Color',[192./255 192./255 192./255],'LineStyle','-','LineWidth',0.8);    
end
mREyS = mean(REyS);
plt = plot(REx,mREyS,'Color','red','Marker','+','LineWidth',1);    
REx12 = REx;
mREyS12 = mREyS;
% legend(plt,{'Average experimental variogram'},'Box','on',...
%     'fontsize',11,'Position',[0.3831,0.84,0.4696,0.0629]);
% set(ax,'FontSize',12)
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.380,'f2','FontSize',13);
set(gca,'Box','on');
set(gcf, 'Color', 'white');
export_fig Average_experimental_variograms1.jpg -m1.2
% close(f);

%% TI with each other
f = figure(21);
% set(get(f, 'JavaFrame'), 'Maximized', true);
set(f,'units','normalized','outerposition',[0 0 1 1]);
%% Unconditional x
subplot(3,2,1);
plt1 = plot(REx1,mREyS1,'Color','b','Marker','*','LineWidth',1);
plt1.Parent.Position = [0.2341,0.7093,0.2280,0.2157];
hold on;
plot(REx3,mREyS3,'Color','r','Marker','+','LineWidth',1); 
load('Unconditional_TI.mat');
[REy,REx]=VariogramNew2(Unconditional_TI,'x',size(REx1,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.235,'a','FontSize',11,'fontweight','bold');
set(gca,'Box','on');

%% Unconditional y
subplot(3,2,2);
plt2 = plot(REx2,mREyS2,'Color','b','Marker','*','LineWidth',1);
plt2.Parent.Position = [0.505,0.7093,0.2280,0.2157];
hold on;
plot(REx4,mREyS4,'Color','r','Marker','+','LineWidth',1); 
[REy,REx]=VariogramNew2(Unconditional_TI,'y',size(REx2,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.285,'b','FontSize',13);
set(gca,'Box','on');

%% Conditional x
subplot(3,2,3);
plt3 = plot(REx5,mREyS5,'Color','b','Marker','*','LineWidth',1);
plt3.Parent.Position = [0.2341,0.4096,0.2280,0.2157];
hold on;
plot(REx7,mREyS7,'Color','r','Marker','+','LineWidth',1); 
load('Conditional_TI.mat');
[REy,REx]=VariogramNew2(Conditional_TI,'x',size(REx5,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
set(gca,'FontSize',13); % ax.FontSize = 11;
ylim([0,0.2656]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.25,'c','FontSize',13);
set(gca,'Box','on');

%% Conditional y
subplot(3,2,4);
plt4 = plot(REx6,mREyS6,'Color','b','Marker','*','LineWidth',1);
plt4.Parent.Position = [0.505,0.4096,0.2280,0.2157];
hold on;
plot(REx8,mREyS8,'Color','r','Marker','+','LineWidth',1); 

[REy,REx]=VariogramNew2(Conditional_TI,'y',size(REx6,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
set(gca,'FontSize',13); % ax.FontSize = 11;
% ylim([0,0.34]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.285,'d','FontSize',13);
set(gca,'Box','on');

%% Practical x
subplot(3,2,5);
plt5 = plot(REx9,mREyS9,'Color','b','Marker','*','LineWidth',1);
plt5.Parent.Position = [0.2341,0.1099,0.2280,0.2157];
hold on;
plot(REx11,mREyS11,'Color','r','Marker','+','LineWidth',1); 
Gudao_Ti=load('Gudao_Ti.mat');
Gudao_Ti = Gudao_Ti.data;
[REy,REx]=VariogramNew2(Gudao_Ti,'x',size(REx9,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
set(gca,'FontSize',13); % ax.FontSize = 11;
set(gca,'yTick',[0,0.05,0.1,0.15,0.2,0.25,0.3]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_x','Fontsize',13,'FontWeight','bold');
text(1.912,0.28,'e','FontSize',13);
set(gca,'Box','on');

%% Practical y
subplot(3,2,6);
[REy,REx]=VariogramNew2(Gudao_Ti,'y',size(REx10,2));
REyS = smooth(REx,REy,0.2,'loess');
% scatter(TIx,TIyS);
plot(REx,REyS,'Color','magenta','Marker','o','LineWidth',1);
hold on;
plt6 = plot(REx10,mREyS10,'Color','b','Marker','*','LineWidth',1);
plt6.Parent.Position = [0.505,0.1099,0.2280,0.2157];
plot(REx12,mREyS12,'Color','r','Marker','+','LineWidth',1); 

set(gca,'FontSize',13); % ax.FontSize = 11;
set(gca,'yTick',[0,0.05,0.1,0.15,0.2,0.25,0.3]);
set(gca,'xminortick','on');set(gca,'yminortick','on');
xlabel('Distance','Fontsize',13);
ylabel('\gamma_y','Fontsize',13,'FontWeight','bold');
text(1.912,0.28,'f','FontSize',13);
set(gca,'Box','on');
legend({'TI','Multiple search trees','Original Snesim'},'Box','on',...
    'fontsize',11,'Position',[0.6289,0.1250,0.09821,0.06288]);

% Creating axes
axes7 = axes('Parent',f,...
    'Position',[0.3955,0.7718,0.0509,0.05071]);
hold(axes7,'on');

% Creating multiple rows using a matrix input in plot
plot71 = plot(REx1,mREyS1,'LineWidth',1);
plot72 = plot(REx3,mREyS3,'LineWidth',1);
plot73 = plot(REx,REy,'LineWidth',1);

set(plot71,'Marker','*','Color',[0 0 1]);
set(plot72,'Marker','+','Color',[1 0 0]);
set(plot73,'Marker','o','Color',[1 0 1]);
xlim([8 12])
ylim([0.185 0.202])

box(axes7,'on');
hold(axes7,'off');
% Setting the attributes of the remaining coordinate areas
set(axes7,'FontSize',12,'XMinorTick','on','YMinorTick','on');
% Creating arrow
annotation(f,'arrow',[0.278886554621849 0.395483193277311],...
    [0.870182555780933 0.771656400617824],'LineStyle','--');
% Creating arrow
annotation(f,'arrow',[0.279936974789916 0.394432773109244],...
    [0.890466531440162 0.82262996941896],'LineStyle','--');
% Creating rectangle
annotation(f,'rectangle',[0.267 0.8702 0.01241 0.01982]);

% Creating textbox
annotation(f,'textbox',...
    [0.3955 0.8156 0.05305 0.03548],...
    'String','Scale 3.5:1',...
    'LineStyle','none',...
    'FontSize',11,...
    'FitBoxToText','off');

% Creating ylabel
ylabel('\gamma_x','FontWeight','bold','FontSize',12,'Position',[6.8,0.195,-1]);

% Creating xlabel
xlabel('Distance','FontSize',11,'Position',[10,0.178,-1]);
set(gcf, 'Color', 'white');
export_fig Average_experimental_variograms2.jpg -m1.2
% close(f);
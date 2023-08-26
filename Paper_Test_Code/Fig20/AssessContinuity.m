%% Fig. 20. Frequency of CCL for theoretical and practical tests
%% Statistics
clear all;close all;clc;
dbstop if error
addpath('../../export_fig-master');
addpath('../../relycode');
load('Theory_uncon_600simulation.mat');
load('Theory_con_600simulation.mat');
load('Gudao_600simulation.mat');
for i = 1:size(Theory_uncon_600simulation,2)
    for j = 1:2
        [label_img{1}{i}{j},num{1}{i}{j}]=CCL(Theory_uncon_600simulation{i}{1}{j},1);
        [label_img{2}{i}{j},num{2}{i}{j}]=CCL(Theory_con_600simulation{i}{1}{j},1);
        [label_img{3}{i}{j},num{3}{i}{j}]=CCL(Gudao_600simulation{i}{1}{j},3);        
    end
end
% Unconditional simulation
num1 = [];area1 = [];anr1 = []; % multiple search trees: CLL number N;CCL area A;A/N
num2 = [];area2 = [];anr2 = []; % original Snesim
% Conditional simulation
num3 = [];area3 = [];anr3 = [];
num4 = [];area4 = [];anr4 = [];
% Practical simulation of Gudao
num5 = [];area5 = [];anr5 = [];
num6 = [];area6 = [];anr6 = [];

for k = 1:size(num,2)
    for i=1:size(num{1},2)
        for j = 1:2
            if j == 1
                if k == 1
                    num1 = [num1 num{k}{i}{j}];
                    area1=[area1 length(find(label_img{k}{i}{j}))];
                    anr1 = [anr1 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                elseif k==2
                    num3 = [num3 num{k}{i}{j}];
                    area3=[area3 length(find(label_img{k}{i}{j}))];
                    anr3 = [anr3 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                else
                    num5 = [num5 num{k}{i}{j}];
                    area5=[area5 length(find(label_img{k}{i}{j}))];
                    anr5 = [anr5 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                end
            else
                if k==1
                    num2 = [num2 num{k}{i}{j}];                    
                    area2=[area2 length(find(label_img{k}{i}{j}))];
                    anr2 = [anr2 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                elseif k==2
                    num4 = [num4 num{k}{i}{j}];
                    area4=[area4 length(find(label_img{k}{i}{j}))];
                    anr4 = [anr4 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                else
                    num6 = [num6 num{k}{i}{j}];
                    area6=[area6 length(find(label_img{k}{i}{j}))];
                    anr6 = [anr6 length(find(label_img{k}{i}{j}))/num{k}{i}{j}];
                end
            end
        end
    end
end
%% data handle
N1 = tabulate(num1);
N2 = tabulate(num2);
[N1,N2] = AdjustAS(N1,N2);
AN1 = tabulate(anr1);
AN2 = tabulate(anr2);
[AN1,AN2] = AdjustAS(AN1,AN2);

N3 = tabulate(num3);
N4 = tabulate(num4);
[N3,N4] = AdjustAS(N3,N4);
AN3 = tabulate(anr3);
AN4 = tabulate(anr4);
[AN3,AN4] = AdjustAS(AN3,AN4);

N5 = tabulate(num5);
N6 = tabulate(num6);
[N5,N6] = AdjustAS(N5,N6);
AN5 = tabulate(anr5);
AN6 = tabulate(anr6);
[AN5,AN6] = AdjustAS(AN5,AN6);

Mean1 = sum(N1(:,1).*N1(:,3)./100);
Mean2 = sum(N2(:,1).*N2(:,3)./100);
Mean3 = sum(N3(:,1).*N3(:,3)./100);
Mean4 = sum(N4(:,1).*N4(:,3)./100);
Mean5 = sum(N5(:,1).*N5(:,3)./100);
Mean6 = sum(N6(:,1).*N6(:,3)./100);

Std1=sqrt(sum(((N1(:,1)-Mean1).^2).*(N1(:,3)./100)));
Std2=sqrt(sum(((N2(:,1)-Mean2).^2).*(N2(:,3)./100)));
Std3=sqrt(sum(((N3(:,1)-Mean3).^2).*(N3(:,3)./100)));
Std4=sqrt(sum(((N4(:,1)-Mean4).^2).*(N4(:,3)./100)));
Std5=sqrt(sum(((N5(:,1)-Mean5).^2).*(N5(:,3)./100)));
Std6=sqrt(sum(((N6(:,1)-Mean6).^2).*(N6(:,3)./100)));

figure(20)
% Unconditioanl
sub1h = subplot(3,1,1);
sub1h.Position = [0.13,0.77371377033142,0.775,0.215735294117647];
set(gcf,'position',[526,33,676,962]);
% barh = bar(N1(:,1),[N1(:,2)./sum(N1(:,2)),N2(:,2)./sum(N2(:,2))]);hold on;
barh = bar(N1(:,1),[N1(:,3)./100,N2(:,3)./100]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([1.5,16.5]);
ylim([0,0.18]);
set(gca,'XTick',2:16);set(gca,'yminortick','on');
% ylim([0,max([N1(:,2);N2(:,2)])+0.5]);
% set(gca,'YTick',0:2:max([N1(:,2);N2(:,2)])+0.5);
% modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
% modelFun =  @(p,x) p(1).*exp(-((x-p(2))./p(3)).^2);
% startingVals = [8 2 5];
% startingVals = [90 9 4];

% xgrid1 = linspace(3,size(N1,1),100)';
% nlModel1 = fitnlm(N1(:,1),N1(:,2)./sum(N1(:,2)),modelFun,startingVals);
% lh1 = line(xgrid1,predict(nlModel1,xgrid1),'Color',[0.00,0.45,0.74],'LineWidth',1.5);
% xx = N1(:,1);yy=N1(:,2);
% yyS = smooth(xx,yy,0.2,'loess');
% plot(xx,yyS,'LineWidth',1);

% xgrid2 = linspace(2,16,100)';
% nlModel2 = fitnlm(N2(:,1),N2(:,2)./sum(N2(:,2)),modelFun,startingVals);
% lh2 = line(xgrid2,predict(nlModel2,xgrid2),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
% text(2.968443493383359,-5.411187629937631,...
%     '(a) Frequency of CCL for unconditional simulation realizations','FontSize',13);
text(2.2442,-0.05,...
    '(a) Frequency of CCL for unconditional simulation realizations','FontSize',13);

% Conditional
sub2h = subplot(3,1,2);
set(sub2h,'position',[0.13,0.461607404916229,0.775,0.215735294117647]);
barh = bar(N3(:,1),[N3(:,2)./sum(N3(:,2)),N4(:,2)./sum(N4(:,2))]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([0.5,16.5]);
ylim([0,0.22]);
set(gca,'XTick',1:16);set(gca,'yminortick','on');
% set(gca,'YTick',0:2:max([N3(:,2);N4(:,2)])+0.5);
% modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
% modelFun =  @(p,x) p(1).*exp(-((x-p(2))./p(3)).^2);
% startingVals = [9 5 310];
% startingVals = [90 9 4];
% xgrid3 = linspace(2,14,100)';
% nlModel3 = fitnlm(N3(:,1),N3(:,2)./sum(N3(:,2)),modelFun,startingVals);
% lh3 = line(xgrid3,predict(nlModel3,xgrid3),'Color',[0.00,0.45,0.74],'LineWidth',1.5);

% xgrid4 = linspace(1,16,100)';
% nlModel4 = fitnlm(N4(:,1),N4(:,2)./sum(N4(:,2)),modelFun,startingVals);
% lh4 = line(xgrid4,predict(nlModel4,xgrid4),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
text(1.603,-0.06,...
    '(b) Frequency of CCL for conditional simulation realizations','FontSize',13);

% Gudao
sub3h=subplot(3,1,3);
sub3h.Position = [0.13,0.14950103950104,0.775,0.215735294117647];
barh = bar(N5(:,1),[N5(:,2)./sum(N5(:,2)),N6(:,2)./sum(N6(:,2))]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([0.5,17.5]);
ylim([0,0.28]);
set(gca,'XTick',1:17);set(gca,'yminortick','on');
% ylim([0,max([N5(:,2);N6(:,2)])+2.2]);
% set(gca,'YTick',0:2:max([N5(:,2);N6(:,2)])+2.2);
% modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
% startingVals = [4 2 5];
% xgrid5 = linspace(1,7,100)';
% nlModel5 = fitnlm(N5(:,1),N5(:,2),modelFun,startingVals);
% lh1 = line(xgrid5,predict(nlModel5,xgrid5),'Color',[0.00,0.45,0.74],'LineWidth',1.5);

% xgrid6 = linspace(1,12,100)';
% startingVals6 = [10 2 5];
% nlModel6 = fitnlm(N6(:,1),N6(:,2),modelFun,startingVals6);
% lh2 = line(xgrid6,predict(nlModel6,xgrid6),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
text(-0.668,-0.08,...
    '(c) Frequency of CCL for practical simulation realizations of Ng3^3 sublayer',...
    'FontSize',13);

legend([barh(1),barh(2)],...
    {'multiple search trees','original Snesim'},'fontsize',11);
% Fig. 20. Frequency of CCL for theoretical and practical tests
export_fig FrequencyCCL.jpg -m2

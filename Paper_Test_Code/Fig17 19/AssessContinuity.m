%% Fig. 17. Frequency of CCL for theoretical and practical tests
clear all;close all;clc;
addpath('../../export_fig-master');
addpath('../../relycode');
load('Theory_uncon_100simulation.mat');
load('Theory_con_100simulation.mat');
load('Gudao_100simulation.mat');
for i = 1:size(Theory_uncon_100simulation,2)
    for j = 1:2
        [label_img{1}{i}{j},num{1}{i}{j}]=CCL(Theory_uncon_100simulation{i}{1}{j},1);
        [label_img{2}{i}{j},num{2}{i}{j}]=CCL(Theory_con_100simulation{i}{1}{j},1);
        [label_img{3}{i}{j},num{3}{i}{j}]=CCL(Gudao_100simulation{i}{1}{j},3);        
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
%% Unconditioanl
figure(17)
sub1h = subplot(3,1,1);
sub1h.Position = [0.13,0.77371377033142,0.775,0.215735294117647];
set(gcf,'position',[526,33,676,962]);
barh = bar(N1(:,1),[N1(:,2),N2(:,2)]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([2.5,15.5]);
ylim([0,max([N1(:,2);N2(:,2)])+0.5]);
set(gca,'YTick',0:2:max([N1(:,2);N2(:,2)])+0.5);
modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
startingVals = [10 2 5];
xgrid1 = linspace(4,size(N1,1),100)';
nlModel1 = fitnlm(N1(:,1),N1(:,2),modelFun,startingVals);
lh1 = line(xgrid1,predict(nlModel1,xgrid1),'Color',[0.00,0.45,0.74],'LineWidth',1.5);

xgrid2 = linspace(3,14,100)';
nlModel2 = fitnlm(N2(:,1),N2(:,2),modelFun,startingVals);
lh2 = line(xgrid2,predict(nlModel2,xgrid2),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
text(2.968443493383359,-5.411187629937631,...
    '(a) Frequency of CCL for unconditional simulation realizations','FontSize',13);

% Conditional
sub2h = subplot(3,1,2);
set(sub2h,'position',[0.13,0.461607404916229,0.775,0.215735294117647]);
barh = bar(N3(:,1),[N3(:,2),N4(:,2)]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([3.5,16.5]);
ylim([0,max([N3(:,2);N4(:,2)])+1]);
set(gca,'XTick',4:16);
set(gca,'YTick',0:2:max([N3(:,2);N4(:,2)])+0.5);
modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
startingVals = [10 2 5];
xgrid3 = linspace(4,13,100)';
nlModel3 = fitnlm(N3(:,1),N3(:,2),modelFun,startingVals);
lh1 = line(xgrid3,predict(nlModel3,xgrid3),'Color',[0.00,0.45,0.74],'LineWidth',1.5);

xgrid4 = linspace(5,16,100)';
nlModel4 = fitnlm(N4(:,1),N4(:,2),modelFun,startingVals);
lh2 = line(xgrid4,predict(nlModel4,xgrid4),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
text(4.134474027734509,-6.317437629937633,...
    '(b) Frequency of CCL for conditional simulation realizations','FontSize',13);

% Gudao
sub3h=subplot(3,1,3);
sub3h.Position = [0.13,0.14950103950104,0.775,0.215735294117647];
barh = bar(N5(:,1),[N5(:,2),N6(:,2)]);hold on;
set(barh(1),'EdgeColor',[0.00,0.45,0.74]);
set(barh(2),'EdgeColor',[0.85,0.33,0.10]);
xlim([0.5,12.5]);
ylim([0,max([N5(:,2);N6(:,2)])+2.2]);
set(gca,'YTick',0:2:max([N5(:,2);N6(:,2)])+2.2);
modelFun =  @(p,x) p(3) .* (x./p(1)).^(p(2)-1) .* exp(-(x./p(1)).^p(2));
startingVals = [4 2 5];
xgrid5 = linspace(1,7,100)';
nlModel5 = fitnlm(N5(:,1),N5(:,2),modelFun,startingVals);
lh1 = line(xgrid5,predict(nlModel5,xgrid5),'Color',[0.00,0.45,0.74],'LineWidth',1.5);

xgrid6 = linspace(1,12,100)';
startingVals6 = [10 2 5];
nlModel6 = fitnlm(N6(:,1),N6(:,2),modelFun,startingVals6);
lh2 = line(xgrid6,predict(nlModel6,xgrid6),'Color',[0.85,0.33,0.10],'LineWidth',1.5);
xlabel('Number of distinct sand-filled channels','FontSize',12);
ylabel('Frequency','Fontsize',12);
legend([barh(1),lh1,barh(2),lh2],...
    {'multiple search trees','','original Snesim',''},'fontsize',11);
text(-0.32544963638763,-6.788298833951,...
    '(c) Frequency of CCL for practical simulation realizations of Ng33 sublayer',...
    'FontSize',13);

% Fig. 17. Frequency of CCL for theoretical and practical tests
export_fig FrequencyCCL.jpg -m2.5


%% Fig. 19. CDF of A/N for unconditional simulation realizations
% Unconditioanl cdf
figure(19)
pd1 = fitdist(anr1','Weibull');
xgrid1 = linspace(min(anr1),max(anr1),100)';
cdfEst1 = cdf(pd1,xgrid1);
pa1 = paramci(pd1,'Alpha',.01);

pd2 = fitdist(anr2','Weibull');
xgrid2 = linspace(min(anr2),max(anr2),100)';
cdfEst2 = cdf(pd2,xgrid2);
pa2 = paramci(pd2,'Alpha',.01);

pa = [min([pa1(:,1);pa2(:,1)]),max([pa1(:,1);pa2(:,1)])];
ind1 = xgrid1>=min(pa) & xgrid1<=max(pa);
ax1=xgrid1(ind1);
ay1=cdfEst1(ind1);
area(ax1,ay1,'facecolor',[1,0,1],'edgecolor','none');
hold on;

ay2=cdf(pd2,ax1);
area(ax1,ay2,'facecolor',[1,1,1],'edgecolor','none');

leg1=line(xgrid1,cdfEst1,'Color',[0.00,0.00,1.00],'LineWidth',1.5);
leg2=line(xgrid2,cdfEst2,'Color',[1,0,0],'LineWidth',1.5);

plot([ax1(1),ax1(1)],[0,ay2(1)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);
plot([ax1(end),ax1(end)],[0,ay2(end)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);
plot([49.5,ax1(1)],[ay2(1),ay2(1)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);
plot([49.5,ax1(end)],[ay2(end),ay2(end)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);
plot([49.5,ax1(1)],[ay1(1),ay1(1)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);
plot([49.5,ax1(end)],[ay1(end),ay1(end)],'color',[1 0 1],'linestyle','--','LineWidth',1.5);

set(gca,'XTick',50:25:450);
xlim([49.5,450.5]);
ylim([0 1.02]);
text(pa(1),0.03,num2str(round(pa(1))));
text(pa(2),0.03,num2str(round(pa(2))));
text(54,ay2(1)-0.02,num2str(roundn(ay2(1),-2)));
text(54,ay2(end)-0.02,num2str(roundn(ay2(end),-2)));
text(54,ay1(1)+0.03,num2str(roundn(ay1(1),-2)));
text(54,ay1(end)+0.03,num2str(roundn(ay1(end),-2)));

box on;set(gca,'YminorGrid','on');set(gca,'XminorGrid','on');
xlabel('A/N of distinct sand-filled channels','FontSize',12);
ylabel('Cumulative Distribution Function','Fontsize',12);
legend([leg1,leg2],{'multiple search trees','original Snesim'},...
    'fontsize',11,'position',[0.542,0.737676190476191,0.3554,0.1107]);

% Fig. 19. CDF of A/N for unconditional simulation realizations
export_fig CDF.jpg -m2.5
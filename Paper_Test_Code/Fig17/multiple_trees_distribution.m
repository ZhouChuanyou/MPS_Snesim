%% Fig. 17. Frequency of nodes distribution after double retrieving
% MATLAB 2019b or later, for the object 'XEndPoints' of 'bar' at line 56.

clear all;close all;clc;
addpath('../../export_fig-master');
%% Unconditional simulation
figure(1);
% data 'num_uncondi'comes from variable 'num2'
% after Theory_MultiTree_Snesim_nonconditon.m finished 
num_uncondi = [1027,1153,61,1359];
bar(num_uncondi,0.4);
for i = 1:4
    freq_uncondi(i) = num_uncondi(i)/sum(num_uncondi);
end
bar(freq_uncondi,0.4);

%% Conditional simulation
figure(2) ;
% data 'num_condi'comes from variable 'num2'
% after Theory_MultiTree_Snesim_conditon.m finished 
num_condi = [931,1027,48,1123];
bar(num_condi,0.4);
for i = 1:4
    freq_condi(i) = num_condi(i)/sum(num_condi);
end
bar(freq_condi,0.4)

%% Gudao simulation
figure(3);
% data 'num_Gudao'comes from variable 'num2'
% after Gudao_MultiTree_Snesim_conditon.m finished
num_Gudao = [2552,4115,95,2256];
bar(num_Gudao,0.4);
for i = 1:4
    freq_Gudao(i) = num_Gudao(i)/sum(num_Gudao);
end
bar(freq_Gudao,0.4)

%% Fig. 17. Number of nodes distribution after double retrieving
figure(17);
set(gcf,'position',[313,231,904,629]);
sub1h = subplot(2,1,1);
num_all = [num_uncondi;num_condi;num_Gudao];
freq_all = [freq_uncondi;freq_condi;freq_Gudao];

len = {'1 tree','2 trees','3 trees','4 trees'};
cat = categorical({'(a) unconditional simulation','(b) conditional simulation',...
    '(c) practical simulation in Ng3^3'});
cat = reordercats(cat,{'(a) unconditional simulation','(b) conditional simulation',...
    '(c) practical simulation in Ng3^3'});
b_handle = bar(cat,num_all,'EdgeColor','none');
sub1h.FontSize = 12;
ylim([0,4500]);
set(gca,'YminorGrid','on');
for i = 1:4
    xtips1 = b_handle(i).XEndPoints; % MATLAB 2019b or later
    ytips1 = b_handle(i).YEndPoints;
    labels1 = string(roundn(b_handle(i).YData,-3));
    text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
end
legend(len,'Orientation','horizontal','fontsize',12,'position',...
    [0.138643073286188,0.874138845603619,0.433628312386243,0.039745626985932]);
ylabel('Number of nodes','fontsize',12);

%% Fig. 17. Frequency of nodes distribution after double retrieving
sub2h = subplot(2,1,2);
len = {'1 tree','2 trees','3 trees','4 trees'};
cat = categorical({'(a) unconditional simulation','(b) conditional simulation',...
    '(c) practical simulation in Ng3^3'});
cat = reordercats(cat,{'(a) unconditional simulation','(b) conditional simulation',...
    '(c) practical simulation in Ng3^3'});
b_handle = bar(cat,freq_all,'EdgeColor','none');
sub2h.FontSize = 12;
set(gca,'YminorGrid','on');
for i = 1:4
    xtips1 = b_handle(i).XEndPoints;
    ytips1 = b_handle(i).YEndPoints;
    labels1 = string(roundn(b_handle(i).YData,-3));
    text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
end
xlabel('Tests of mutiple search trees','fontsize',13);
ylabel('Frequency of nodes','fontsize',12);
sub2h.Position = [0.13,0.18814601932249,0.775,0.341162790697675];
set(gcf, 'Color', 'white');
% Fig. 17. Frequency of nodes distribution after double retrieving
export_fig Frequency.jpg -m2
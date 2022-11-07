%% Fig. 16. CCL operation
clear all;close all;clc;
addpath('../../export_fig-master');
addpath('../../relycode');
figure(1);
input_im=[0 0 0 0 0 1;
    0 0 0 0 0 1;
    0 1 0 0 0 1;
    0 1 0 0 0 0;
    0 1 1 1 0 0;
    0 0 0 0 0 0];

[output_im,~] = CCL(input_im);
ColorMatrix=[0,139,0;255,255,0];
subplot(1,2,1);
vislabels2(input_im,ColorMatrix)
axis on;
axis xy;
set(gca,'XTick',1:6,'ticklength',[0,0]);
hold on;

% grid added
for i=1.5:1:5.5    
    plot([i,i],[0.5,6.5],'color','b','linestyle',':','LineWidth',0.1);
    plot([0.5,6.5],[i,i],'color','b','linestyle',':','LineWidth',0.1);
end 
te = text(7.15,3.56,'\Rightarrow');
te.FontSize = 14;te.Color = 'k';te.FontWeight = 'bold';

subplot(1,2,2);
vislabels3(output_im,ColorMatrix)
axis on;
axis xy;
set(gca,'XTick',1:6,'ticklength',[0,0]);
hold on;
for i=1.5:1:5.5    
    plot([i,i],[0.5,6.5],'color','b','linestyle',':','LineWidth',0.1);
    plot([0.5,6.5],[i,i],'color','b','linestyle',':','LineWidth',0.1);
end

% Fig. 16. CCL operation
export_fig CCL.jpg -m2.5
% TI is a 2D matrix, Grid data; 
% ColorMatrix is color matrix, N*3, val:0-255
% Not just for TI, but also for the 2D Grid data
% By Doctor Lu Changsheng at Yangtze University, 15,8,2020
function [RGB]=TI2RGB(TI,ColorMatrix)
rown=size(TI,1);
coln=size(TI,2);
RGB=zeros(rown,coln,3);
ColorMatrix=ColorMatrix./255;
for i=1:rown
    for j=1:coln
        RGB(i,j,:)=ColorMatrix(TI(i,j)+1,:);
    end
end
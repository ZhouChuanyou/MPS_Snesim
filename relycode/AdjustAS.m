% Input two arrrays, adjust them to the same size with 0 added to the small
% array
% Input
% a1 = [1,0,0;2,0,0;3,0,0;4,2,2];
% a2 = [1,0,0;2,0,0;3,1,1];

% Output
% a1 = [1,0,0;2,0,0;3,0,0;4,2,2];
% a2 = [1,0,0;2,0,0;3,1,1;0 0 0];
function [a1,a2] = AdjustAS(a1,a2)
len1 = size(a1,1);
len2 = size(a2,1);
% add 0 to small array
a1(len1+1:len2,1) = len1+1:len2;
a2(len2+1:len1,1) = len2+1:len1;
end
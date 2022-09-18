function vislabels3(L,ColorMatrix)
%VISLABELS Visualize labels of connected components
%   VISLABELS is used to visualize the output of BWLABEL.
%
%   VISLABELS(L), where L is a label matrix returned by BWLABEL,
%   displays each object's label number on top of the object itself.
%
%   Note: VISLABELS requires the Image Processing Toolbox.
%
%   Example
%   -------
%       bw = imread('text.png');
%       L = bwlabel(bw);
%       vislabels(L)
%       axis([1 70 1 70])

%   Steven L. Eddins
%   Copyright 2008 The MathWorks, Inc.

% Form a grayscale image such that both the background and the
% object pixels are light shades of gray.  This is done so that the
% black text will be visible against both background and foreground
% pixels.

background_shade = 0;
foreground_shade = 1;
I = zeros(size(L), 'uint8');
I(L == 0) = background_shade;
I(L ~= 0) = foreground_shade;
[RGB]=TI2RGB(I,ColorMatrix);
% Display the image, fitting it to the size of the figure.
imageHandle = imshow(RGB,ColorMatrix./255,'InitialMagnification', 'fit');
% Add number into grid
for i = 1: size(L,1)
    for j= 1:size(L,2)
        text(j,i,num2str(L(i,j)),'Color',[0.3010 0.7450 0.9330],...
            'fontsize',14,'HorizontalAlignment','center');
    end
end
% Get the axes handle containing the image.  Use this handle in the
% remaining code instead of relying on gca.
axesHandle = ancestor(imageHandle, 'axes');

% Get the extrema points for each labeled object.
s = regionprops(L, 'Extrema');

% Superimpose the text label at the left-most top extremum location
% for each object.  Turn clipping on so that the text doesn't
% display past the edge of the image when zooming.
hold(axesHandle, 'on');
for k = 1:numel(s)
   e = s(k).Extrema;
   text(e(end,1)+0.06, e(end,2)+1.5, sprintf('%d', k), ...
      'Parent', axesHandle, ...
      'Clipping', 'on', ...
      'Color', 'r', ...
      'FontWeight', 'bold',...
      'fontsize',14,...
      'HorizontalAlignment','center');
end
hold(axesHandle, 'off');


% Alex Gangwish
% EECS 332 MP #1
% Connected Component Labeling

function [label_img, num] = CCL(imagearry, size_filter)
%CCL Connected Component Labeling for a binary image
%   Takes as input img, a binary image; and size_filter, the pixel area
%   threshold below which components are ignored; Returns label_img, a
%   representation of img with connected components labeled; and num, the
%   total number of distinct connected components.

% imagearry = imread(img);               % read in the image
label_img = zeros(size(imagearry));    % location for output
L = 0;                              % region counter
e_table = [0,0];                    % equivalency table

% First loop over image
for u = 1:size(imagearry, 1)
    for v = 1:size(imagearry, 2)
        if (imagearry(u, v) == 1)
            try                           % 9.9.2022
                lu = label_img(u-1, v);                
            catch
                lu = 0;                
            end
            try                           % 9.9.2022
                ll = label_img(u, v-1);
            catch
                ll =0;
            end
            
            if (lu == ll) && (lu ~= 0) && (ll ~= 0)    % adjacent labels are the same
                label_img(u, v) = lu;
            elseif (lu ~= ll) && ~(lu && ll)           % one of the labels is 0
                label_img(u, v) = max(lu, ll);
            elseif (lu ~= ll) && (lu > 0) && (ll > 0)  % both labels are different
                label_img(u, v) = min(lu, ll);
                if ~sum(ismember(e_table, [lu, ll], 'rows'))
                    e_table = [e_table; [lu, ll]];  % place pair in equivalency table
                end
            else
                L = L + 1;         % increment the label counter
                label_img(u, v) = L;
            end
        else
            label_img(u, v) = 0;
        end
    end
end

% Consolidate connected component labels
while size(e_table, 1) > 0
    for u = 1:size(label_img, 1)
        for v = 1:size(label_img, 2)
            % if pixel has a smaller equivalent label, switch to that label
            if max(e_table(size(e_table, 1), :)) == label_img(u, v)
                label_img(u, v) = min(e_table(size(e_table, 1), :));
            end
        end
    end
    % replace value of larger label with smaller equivalent in whole table
    e_table(e_table == max(e_table(size(e_table, 1),:))) = min(e_table(size(e_table,1),:));
    e_table = e_table(1:size(e_table)-1, :);
end

% get unique labels
labels = unique(label_img);
labels = labels(2:end, :);
num = size(labels, 1);

% remove components if smaller than size_filter
for i = 1:num
    if exist('size_filter', 'var')
        counts = histc(label_img(:), labels(i));
        if counts < size_filter
            label_img(label_img == labels(i)) = 0;
            labels(i) = 0;
        end
    end
end
% very good idea 2022.9.3
% remove labels that were too small
labels = labels(labels ~= 0);
num = size(labels, 1);

% replace existing labels with numeric order labels
for i = 1:num
    label_img(label_img == labels(i)) = i;
end

% dlmwrite('output.csv', label_img);

end


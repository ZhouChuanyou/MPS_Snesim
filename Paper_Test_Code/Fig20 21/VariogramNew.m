function [y,x,p] = VariogramNew(Matrix,direc)
% 2023.7.7 By Chuanyou Zhou
% Matrix：正常行列矩阵；
% direc：方向，填写字符'X','x'or'Y','y'
% y：变差函数值；
% x：滞后距lag
% pair：滞后距lag对应的数对

[r,c] = size(Matrix); % 行数，列数

% for i = 2:c
%     for j = 1:r
%         for k = 1:i-1
%             y(i-k) = y(i-k) + power(Matrix(j,i)-Matrix(j,k),2);
%             p(i-k) = p(i-k) + 1;
%         end
%     end
% end
switch direc
    case {'X','x'}
        y(1:c-1) = 0;
        p(1:c-1) = 0;
        for i = 2:c
            %     for j = 1:r  % 批处理，所有行一起计算
            for k = 1:i-1
                % :是批处理，所有行一起计算
                y(i-k) = y(i-k) + sum(power(Matrix(:,i)-Matrix(:,k),2));
                p(i-k) = p(i-k) + r;
            end
            %     end
        end
        x = 1:c-1;
        y = 0.5.*y./p;
    case {'Y','y'}
        y(1:r-1) = 0;
        p(1:r-1) = 0;
        for i = 2:r
            for k = 1:i-1
                y(i-k) = y(i-k) + sum(power(Matrix(i,:)-Matrix(k,:),2));
                p(i-k) = p(i-k) + c;
            end
        end
        x = 1:r-1; % 滞后距lag
        y = 0.5.*y./p; % 计算变差函数值γ
end

end
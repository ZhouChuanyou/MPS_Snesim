% Generate random number 0 1
% m: row number; n：column number
function A = get01(m,n)
rng(1);
B=rand(m,n); % generate random number
A=round(B); 
end
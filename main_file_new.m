clear all;
close all;
clc;
x = xlsread('/Users/ishaasamyuktha/Desktop/FYP-EPILEPSY/Normal data/34.xlsx'); 

for i = 1:19
    %disp(a(:, 1));
    [comp] = calf_main(x(:,i));
    opd(:,i) = [comp];
end
writematrix(opd,'34.xlsx')

% for i = 1:4
%     m = calf(a(:,i));
% end

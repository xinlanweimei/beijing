close all;
clear all;
clc;
load speechorgans.mat;
for i = 1 : 4
    SPEEORG.ORGS(1 , 6).contour{1 , i + 21} = SPEEORG.ORGS(1 , 6).contour{1 , 21 - i};
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
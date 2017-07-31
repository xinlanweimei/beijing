% ∂‘≥∆¥¶¿Ì
close all;
clear all;
clc;
load speechorgans.mat;
planes = 29;
for i = 1 : planes
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(1 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 17}(16 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(10 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 17}(1 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(11 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 17}(15 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(20 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 17}(30 , :);
    for j = 2 : 9
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(j + 10 , 1) = SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(11 - j , 1);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(j + 10 , 2) = 512 - SPEEORG.ORGS(1 , 9).contour{1 , i + 17}(11 - j , 2);
    end
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
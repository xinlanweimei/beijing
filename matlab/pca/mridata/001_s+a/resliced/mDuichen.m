% ∂‘≥∆¥¶¿Ì
close all;
clear all;
clc;
load speechorgans.mat;
planes = 26;
for i = 1 : planes
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(1 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 19}(16 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(10 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 19}(1 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(11 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 19}(15 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(20 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 19}(30 , :);
    for j = 2 : 9
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(j + 10 , 1) = SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(11 - j , 1);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(j + 10 , 2) = 512 - SPEEORG.ORGS(1 , 9).contour{1 , i + 19}(11 - j , 2);
    end
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
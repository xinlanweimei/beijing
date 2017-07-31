% 对称处理
close all;
clear all;
clc;
load speechorgans.mat;
planes = 28;%标记多少个横切片
for i = 1 : planes
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(1 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 16}(16 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(10 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 16}(1 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(11 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 16}(15 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(20 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + 16}(30 , :);
    for j = 2 : 9
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(j + 10 , 1) = SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(11 - j , 1);
    SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(j + 10 , 2) = 512 - SPEEORG.ORGS(1 , 9).contour{1 , i + 16}(11 - j , 2);
    end
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
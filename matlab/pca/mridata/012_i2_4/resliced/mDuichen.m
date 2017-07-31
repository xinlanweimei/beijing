% 对称处理
close all;
clear all;
clc;
load speechorgans.mat;
planes = 25;%<-----
k=15;%<--起始切片数目—1
for i = 1 : planes
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(1 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + k}(16 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(10 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + k}(1 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(11 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + k}(15 , :);
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(20 , :) = SPEEORG.ORGS(1 , 7).contour{1 , i + k}(30 , :);
    for j = 2 : 9
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(j + 10 , 1) = SPEEORG.ORGS(1 , 9).contour{1 , i + k}(11 - j , 1);
    SPEEORG.ORGS(1 , 9).contour{1 , i + k}(j + 10 , 2) = 512 - SPEEORG.ORGS(1 , 9).contour{1 , i + k}(11 - j , 2);
    end
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
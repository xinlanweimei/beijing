%将插值的矢状切片导入到横切片中，以便于自动确认舌头的前后边界
close all;
clear all;
clc;
index = 0;
planes = 9;
load('speechorgans.mat');
load('try.mat');
for i = 1 : 37
    for j = 1 : planes
        SPEEORG.ORGS(1 , 5).contour{1 , 16 + i}(j , 1) = by(1 , index + j);
        SPEEORG.ORGS(1 , 5).contour{1 , 16 + i}(j , 2) =  256 - by(1 , index + 2 * planes +j);
    end
    index = index + 3 * planes;
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
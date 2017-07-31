%将插值的矢状切片导入到横切片中，以便于自动确认舌头的前后边界
close all;
clear all;
clc;
index = 0;
planes = 30;
planes1 = 25;%<-----
load('speechorgans.mat');
load('tr2.mat');
for i = 1 : planes1
    for j = 1 : planes
        SPEEORG.ORGS(1 , 7).contour{1 , 22 + i}(j , 1) = b(1 , index + j);%<--"+i"之前的数字要修改
        SPEEORG.ORGS(1 , 7).contour{1 , 22 + i}(j , 2) =  256 - b(1 , index + 2 * planes +j);%<--"+i"之前的数字要修改
    end
    index = index + 3 * planes;
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
close all;
clear all;
clc;
load speechorgans.mat;
load t_tr.mat;


index = 0;
planes = 29;
speechNum = 21;%标记第几个音
y = 244 : 4 : 356;
for i = 1 : planes
    a = SPEEORG.ORGS(1 , 9).contour{1 , i + 16};%起始面
    a1 = a(: , 1);
    a2 = a(: , 2);
    for j = 1 : size(a , 1)
        b(1 , index + j) = a1(j);
        b(1 , index + size(a , 1) + j) = y(i);
        b(1 , index +  2 * size(a , 1) + j) = 256 - a2(j);
    end
    index = index + 3 * size(a , 1);
end


    tongue_tr(speechNum , :) = b(1 , :);

savename = strcat('E:\VS\VC6\20150625\3DGVTM\DynViews\pixel\' , 't_tr.mat');
save(savename , 'tongue_tr');
save('.\t_tr.mat' , 'tongue_tr');
close all;
clear all;
clc;
load speechorgans.mat;
index = 0;
z = -28 : 4 : 28;
for i = 1 : 15
    a = SPEEORG.ORGS(1 , 9).contour{1 , i + 13};
    a1 = a(: , 1);
    a2 = a(: , 2);
    for j = 1 : size(a , 1)
        b(1 , index + j) = a1(j);
        b(1 , index + size(a , 1) + j) = a2(j);
        b(1 , index +  2 * size(a , 1) + j) = z(i);
    end
    index = index + 3 * size(a , 1);
end

for k = 1 : 31
    tongue(k , :) = b(1 , :);
end
savename = strcat('E:\fuyin\20151020\3DGVTM\DynViews\pixel\' , 't_y_3.mat');
save(savename , 'tongue');
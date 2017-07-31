% 矢状面插值，自动生成部分横切片，还要修改相应的矢状面，来光滑处理曲面
close all;
clear all;
clc;
load speechorgans.mat;


speechNum = 3;%<-----
y1 = 268 : 4 : 368;%<-----
planes1 = 26;%<------
y = [y1 , y1];
z = -28 : 4 : 28;
planes = 15;
for i = 1 : planes
    index = 0;
    a = SPEEORG.ORGS(1 , 9).contour{1 , 13 + i};
    a1 = a(1 : 15 , 1);
    a2 = a(1 : 15 , 2);
    a3 = spline(a2 , a1 , y1);
    
    a1 = a(18 : 24 , 1);
    a2 = a(18 : 24 , 2);
    a4 = spline(a2 , a1 , y1);
    
    a5 = [a3 , a4];
    for j = 1 : size(y , 2)
        b(1 , index + i) = a5(j);
        b(1 , index + 2 * planes + i) = y(j);
        b(1 , index + 4 * planes + i) = z(i);
        index = mod((index + 6 * planes) , planes1 * 90 - 15);
    end
end

    tongue_tr(speechNum , 1 : planes1 * 90) = b(1 , :);

savename = strcat('E:\fuyin\20150715\3DGVTM\DynViews\pixel\' , 't_tmp.mat');
save(savename , 'tongue_tr');
save('.\t_tmp.mat' , 'tongue_tr');
save('.\resliced\tr2.mat' , 'b');
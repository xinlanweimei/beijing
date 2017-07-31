% 矢状面插值，自动生成部分横切片，还要修改相应的矢状面，来光滑处理曲面
close all;
clear all;
clc;
load('speechorgans.mat');
load t_tmp.mat;

speechNum = 1;
y1 = 228: 4 : 372; % 26 transverse planes
% z = -32 : 8 : 40;y = [y1 , y1];

z = -16 : 4 : 16;
% z = z + 256;
planes = 9;
for i = 1 : planes
    index = 0;
    a = SPEEORG.ORGS(1 , 6).contour{1 , 16 + i};
    a1 = a(: , 1);
    a2 = a(: , 2);
    a3 = spline(a2 , a1 , y1);
    for j = 1: length(y1);
        by(1,i + index) = a3(j);
        by(1,i + planes + index) = y1(j);
        by(1,i + 2*planes + index) = z(i);
        index = index + 3*planes;
    end
    

end

% tongue_tr(speechNum , :) = b(1 , :);

% savename = strcat('E:\VS\VC6\20150625\3DGVTM\DynViews\pixel\' , 't_tmp.mat');
% save(savename , 'tongue_tr');
% save('.\t_tmp.mat' , 'tongue_tr');
 save('.\resliced\try.mat' , 'by');
close all;
clear all;
clc;
load speechorgans.mat;
index = 0;
z = -16 : 4 : 16;
wallx = [];
wally = [];
wallz = [];
for i = 1 : 9
    a = SPEEORG.ORGS(1 , 6).contour{1 , i + 16};
    a1 = a(: , 1);
    a2 = a(: , 2);
    for j = 1 : size(a , 1)
        b(1 , index + j) = a1(j);
        wallx = [wallx;a1(j)];
        b(1 , index + size(a , 1) + j) = a2(j);
        wally = [wally;a2(j)];
        b(1 , index +  2 * size(a , 1) + j) = z(i);
        wallz = [wallz;z(i)];
    end
    index = index + 3 * size(a , 1);
end

for k = 1 :1
    tongue(k , :) = b(1 , :);
end
% savename = strcat('E:\VS\VC6\20150625\3DGVTM\DynViews\pixel\' , 't_a1.mat');
save('.\wall_i3.mat' , 'tongue');
for i = 1 : 9
    wallxx(:,i) = wallx(15*(i-1)+1:15*(i-1)+15,1);
    wallyy(:,i) = wally(15*(i-1)+1:15*(i-1)+15,1);
    wallzz(:,i) = wallz(15*(i-1)+1:15*(i-1)+15,1);
end
figure;
surf(wallxx,wallyy,wallzz);
 hold on;
%  plot3(wallx,wally,wallz,'r.');
 
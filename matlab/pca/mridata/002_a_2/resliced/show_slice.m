close all;
clear all;
clc;
load tr2.mat;
load speechorgans.mat;

im_tngsl=imread('002_a_2_20.tif');
index=0;
% index = index + 3 * 19;
 planes=30;

 for i=1:3
    index = index + 3 * planes;
 end;
    for j = 1 : planes
        x(j) = b(1 , index + j);
        y(j) =  256 - b(1 , index + 2 * planes +j);
    end
    

a = SPEEORG.ORGS(1 , 9).contour{1 , 20};
[maxy, ind]=max(a(:,2));

imshow(im_tngsl);
hold on;
plot(x,y,'r.');
hold on;
plot(a(:,1),a(:,2),'r.');
plot(a(3,1),a(3,2),'y.');
plot(a(18,1),a(18,2),'y.');
%����ֵ��ʸ״��Ƭ���뵽����Ƭ�У��Ա����Զ�ȷ����ͷ��ǰ��߽�
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
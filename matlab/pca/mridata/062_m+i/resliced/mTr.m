%����ֵ��ʸ״��Ƭ���뵽����Ƭ�У��Ա����Զ�ȷ����ͷ��ǰ��߽�
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
        SPEEORG.ORGS(1 , 7).contour{1 , 22 + i}(j , 1) = b(1 , index + j);%<--"+i"֮ǰ������Ҫ�޸�
        SPEEORG.ORGS(1 , 7).contour{1 , 22 + i}(j , 2) =  256 - b(1 , index + 2 * planes +j);%<--"+i"֮ǰ������Ҫ�޸�
    end
    index = index + 3 * planes;
end
savename = strcat('.\' , 'speechorgans.mat');
save(savename , 'SPEEORG');
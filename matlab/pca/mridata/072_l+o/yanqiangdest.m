close all;
clear all;
clc;
voweldir ='E:\��ǻ��\fuyin\071_l+u';
 destd='E:\��ǻ��\fuyin\072_l+o';

 
a=fullfile(voweldir,'speechorgans.mat');
load (a);
 firstorgans = SPEEORG.ORGS(1,6);
 
 
 destdir = fullfile(destd,'speechorgans.mat')
load (destdir);
SPEEORG.ORGS(1,6)=firstorgans;
save(destdir,'SPEEORG');

re=fullfile(voweldir,'resliced','speechorgans.mat');
load (re);
firstresorgans = SPEEORG.ORGS(1,6);

destresdir = fullfile(destd,'resliced','speechorgans.mat');
load (destresdir);
SPEEORG.ORGS(1,6) = firstresorgans;
save(destresdir,'SPEEORG');

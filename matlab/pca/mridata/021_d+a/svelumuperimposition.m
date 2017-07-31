close all;
clear all;
clc;
  load 'E:\Èםכס\fuyinfinished\015_x+i\speechorgans.mat';
  velumn=SPEEORG.ORGS(1,5);
%   lowlip=SPEEORG.ORGS(1,2);
  clear SPEEORG;
  load 'speechorgans.mat';
  SPEEORG.ORGS(1,5)=velumn; 
%  SPEEORG.ORGS(1,2)=lowlip;
 
  save('speechorgans.mat','SPEEORG');
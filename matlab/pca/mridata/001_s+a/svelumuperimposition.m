close all;
clear all;
clc;
  load 'E:\����\yuanyin_liu\005_i_1\speechorgans.mat';
  velumn=SPEEORG.ORGS(1,5);
%   lowlip=SPEEORG.ORGS(1,2);
  clear SPEEORG;
  load 'speechorgans.mat';
  SPEEORG.ORGS(1,5)=velumn; 
%  SPEEORG.ORGS(1,2)=lowlip;
 
  save('speechorgans.mat','SPEEORG');
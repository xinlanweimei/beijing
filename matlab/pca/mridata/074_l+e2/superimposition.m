close all;
clear all;
clc;
  load 'E:\lipannotation\fuyinliu\071_l+u\speechorgans.mat';
  uplip=SPEEORG.ORGS(1,1);
  lowlip=SPEEORG.ORGS(1,2);
  clear SPEEORG;
  load 'speechorgans.mat';
  SPEEORG.ORGS(1,1)=uplip; 
 SPEEORG.ORGS(1,2)=lowlip;
 
  save('speechorgans.mat','SPEEORG');
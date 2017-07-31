close all;
clear all;
clc;
load speechorgans.mat;
for i=1:41
aa=SPEEORG.ORGS(1 , 1).contour{1 , i};
if ~isempty(aa)
    firnum=i;
    break;
end
end
 num=21-firnum;

 z= -(num)*4:4:0;

 for i=firnum:21
    a = SPEEORG.ORGS(1 , 1).contour{1 , i};
    a1=a(:,1);
    a2=a(:,2);
    for j=1:size(a,1)
        uplip(1,(i-firnum)*3*size(a,1)+j)=a1(j);
        uplip(1,(i-firnum)*3*size(a,1)+size(a,1)+j)=a2(j);
        uplip(1,(i-firnum)*3*size(a,1)+size(a,1)*2+j)=z(i-firnum+1); 
        
        uplip(1,j+(2*21-i-firnum)*3*size(a,1))=a1(j);
         uplip(1,size(a,1)+j+(2*21-i-firnum)*3*size(a,1))=a2(j);
          uplip(1,size(a,1)*2+j+(2*21-i-firnum)*3*size(a,1))=-z(i-firnum+1);
    end
  end
     plot_three(uplip,12,num*2+1,1);
 
 

a=[];
a1=[];
a2=[];
for i=firnum:21
    a = SPEEORG.ORGS(1 , 2).contour{1 , i};
    a1=a(:,1);
    a2=a(:,2);
    for j=1:size(a,1)
        lowlip(1,(i-firnum)*3*size(a,1)+j)=a1(j);
        lowlip(1,(i-firnum)*3*size(a,1)+size(a,1)+j)=a2(j);
        lowlip(1,(i-firnum)*3*size(a,1)+size(a,1)*2+j)=z(i-firnum+1); 
        
        lowlip(1,j+(2*21-i-firnum)*3*size(a,1))=a1(j);
         lowlip(1,size(a,1)+j+(2*21-i-firnum)*3*size(a,1))=a2(j);
          lowlip(1,size(a,1)*2+j+(2*21-i-firnum)*3*size(a,1))=-z(i-firnum+1);
    end
  end
 
     hold on;
     plot_three(lowlip,18,num*2+1,1);
     
     

% savename = strcat('E:\tongue mark\20160322\3DGVTM\DynViews\pixel\' , 't_s+i.mat');
% save(savename , 'tongue');
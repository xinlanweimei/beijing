close all;
clear all;
clc;
load speechorgans.mat;
load 'E:\lipannotation\lowlip.mat';
load 'E:\lipannotation\uplip.mat'

speechnum=10;
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
  
 nl=num*2+1;
%      plot_three(uplip,12,num*2+1,1);
 uplipreg=[];
     for i=1:12
         for j=1:nl
         con(j,1)=uplip(1,(j-1)*3*size(a,1)+i);
         con(j,2)=uplip(1,(j-1)*3*size(a,1)+size(a,1)+i);
         con(j,3)=uplip(1,(j-1)*3*size(a,1)+2*size(a,1)+i);
      
         end
         connew=[];
             connew=three_intp(con,20);
             for i = 2 : 19%光滑处理
        connew(i,1)=(connew(i-1,1)+connew(i,1)*2+connew(i+1,1))/4;
        connew(i,2)=(connew(i-1,2)+connew(i,2)*2+connew(i+1,2))/4;
        connew(i,3)=(connew(i-1,3)+connew(i,3)*2+connew(i+1,3))/4;
  end
             
             
             
        lend=20;
%              for k=1:lend
      uplipreg=[uplipreg connew(:,1)' connew(:,2)' connew(:,3)'];
      
             
             
     end
     
     uplipnew(speechnum,:)=uplipreg(1,:);
      
     save('E:\lipannotation\uplip.mat','uplipnew');
     plot_three(uplipreg,20,12,1);
     
     
 

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
%      plot_three(lowlip,18,num*2+1,1);
     
    lowlipreg=[];
     for i=1:18
         for j=1:nl
         con(j,1)=lowlip(1,(j-1)*3*size(a,1)+i);
         con(j,2)=lowlip(1,(j-1)*3*size(a,1)+size(a,1)+i);
         con(j,3)=lowlip(1,(j-1)*3*size(a,1)+2*size(a,1)+i);
      
         end
         connew=[];
             connew=three_intp(con,20);
             
              for i = 2 : 19%光滑处理
        connew(i,1)=(connew(i-1,1)+connew(i,1)*2+connew(i+1,1))/4;
        connew(i,2)=(connew(i-1,2)+connew(i,2)*2+connew(i+1,2))/4;
        connew(i,3)=(connew(i-1,3)+connew(i,3)*2+connew(i+1,3))/4;
  end
             
        lend=20;
%              for k=1:lend
      lowlipreg=[lowlipreg connew(:,1)' connew(:,2)' connew(:,3)'];
      
             
             
     end
      
     lowlipnew(speechnum,:)=lowlipreg(1,:);
      save('E:\lipannotation\lowlip.mat','lowlipnew');
     plot_three(lowlipreg,20,18,1);
     
     
     

% savename = strcat('E:\tongue mark\20160322\3DGVTM\DynViews\pixel\' , 't_s+i.mat');
% save(savename , 'tongue');
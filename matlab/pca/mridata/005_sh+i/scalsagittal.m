close all;
clear all;
clc;
load speechorgans.mat;
 load E:\»ÌÎÒ\velumn\ivelumn.mat;
 speechnum=14;
index = 0;
mark=25;% ”“≤‡±ﬂΩÁÕº∆¨±‡∫≈£ª
 
 zbou=(mark-21)*4;

 
z = -1*zbou: 4: zbou;

for i = 1 : (mark-21)
    SPEEORG.ORGS(1 , 5).contour{1 ,21-i  } = SPEEORG.ORGS(1 , 5).contour{1 , 21 + i};
end
for i = 1 :length(z)
    a = SPEEORG.ORGS(1 , 5).contour{1 , i +(20-(mark-21))};
    a1 = a(: , 1);
    a2 = a(: , 2);
    for j = 1 : size(a , 1) 
        b(1 , index + j) = a1(j);
        b(1 , index + size(a , 1) + j) = a2(j);
        b(1 , index +  2 * size(a , 1) + j) = z(i);
    end
    index = index + 3 * size(a , 1);
end


for k = 1 : 1
    ivelumnsag(speechnum , :) = b(1 , :);
end
savename = strcat('E:\»ÌÎÒ\velumn\' , 'ivelumn.mat');%<-----
save(savename , 'ivelumnsag');

clear;
clc;
Img=imread('test3.tif');
Img = Img(221:370,81:220);
% Img=Img(:,:,1);
%%% Img=imread('mri_nonuniform.bmp');  % uncommont this line to use ther other vessel image
Img=double(Img);
%****************参数设置**********************%
iterNum = 500;
lambda1 = 1.0;
lambda2 = 1.0;
nu = 0.003*255*255;%长度项的系数
epsilon = 1;%迪克啦系数
sigma=3.0;    % scale parameter in Gaussian kernel

%*************手工选取初始水平集**************%
figure(1);imagesc(Img, [0, 255]);colormap(gray);hold on; axis off;
%text(6,6,'Left click to get points, right click to get end point','FontSize',[12],'Color', 'r');
title('Left click to get points, right click to get end point');
BW=roipoly;
c0=2;
initialLSF=c0*2*(0.5-BW);
u=initialLSF;
hold on;
[c,h] = contour(u,[0 0],'r');  %绘制等高线,c存放等高线上点对应的x和y
%c的第一行点x值，第二行存点y值；h为等高线的句柄

%***********三维水平集的显示*********************%
figure(2);
mesh(-u);%取反以便观看
hold on;
contour(u,[0 0],'r','LineWidth',3);
title('初始水平集函数');
axis on;
view([-80 45]); %其作用为通过方位角AZ和俯视角EL设置观察图形的视点，其中AZ和EL的说明如下:
%当x轴平行于观察者，y轴垂直于观察者时，AZ为0，以此为起点，绕着z轴顺时针转动
%AZ为正，逆时针转动，AZ为负
pause(0.1);
%**************高斯核函数，图像平滑*************************************%
K=fspecial('gaussian',round(2*sigma)*2+1,sigma); % Gaussian kernel
Img;
KI=conv2(Img,K,'same');  %图像卷积
KONE=conv2(ones(size(Img)),K,'same');%高斯核与常值1函数的卷积，在计算LBF时会用到
 
%*****************选用 单谷 还是 双谷 距离调整函数*****************%
choose=2;%默认为双谷；1为单谷，2为双谷
if choose==2
    style_function='double_well';
    timestep =0.1;
    mu = 1;%距离保持项的系数
elseif choose==1
    style_function='double_sigle';
    timestep = 0.1;
    mu = 1;%距离保持项的系数
else
    disp('错误，请选择正确的系数');
end

% *****************水平集演化*********************************%
time = cputime;%演化前所用的时间
for n=1:iterNum
    Iter=1;
    % LSE: level set evolution. 
     u=SJX_LBF_Evolution(u,Img,K,KI,KONE,nu,timestep,mu,lambda1,lambda2,epsilon,Iter,style_function);
    if mod(n,10)==0
        pause(0.001);
        figure(1);
        imagesc(Img, [0, 255]);colormap(gray);hold on; axis off;
        contour(u,[0 0],'r');
        iterNum=[num2str(n), ' iterations'];
        title(iterNum);
        hold off;
    end
end
totaltime = cputime - time
imagesc(Img, [0, 255]);colormap(gray);hold on; axis off;
contour(u,[0 0],'r');
iterNum=[num2str(n), ' iterations'];
title(iterNum);
Img;
a=(u<0);
mask=a.*Img;
%mask=(mask~=0);
sigma=2.5;      %  标准差愈大俞平滑（图小而尖），即俞模糊
M=fspecial('gaussian',round(2*sigma)*2+1,sigma); % Gaussian kernel
mask=conv2(mask,M,'same');  %图像卷积
% mask=uint8(mask);
%imshow(mask);
%show=(mask~=0);
figure(3);imagesc(mask,[0,255]);colormap('gray');hold on;axis off;
%contour(show,[1,1],'r');
%*************演化最后的水平集函数*******************************%
figure(4);
mesh(-u);
hold on;
contour(u,[0,0],'r','LineWidth',4);
title('最终的水平集函数');
axis on;
 
 


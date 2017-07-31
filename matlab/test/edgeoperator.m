sourcePic=imread('lena.jpg'); %读取原图像
grayPic=mat2gray(sourcePic); %实现图像矩阵的归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;%为保留图像的边缘一个像素
robertsNum=0; %经roberts算子计算得到的每个像素的值
robertThreshold=0.2; %设定阈值
for j=1:m-1 %进行边界提取
    for k=1:n-1
        robertsNum = abs(grayPic(j,k)-grayPic(j+1,k+1)) + abs(grayPic(j+1,k)-grayPic(j,k+1));
        if(robertsNum > robertThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
subplot(221);imshow(newGrayPic);
title('roberts算子的处理结果');

sourcePic=imread('lena.jpg');%读取原图像
grayPic=mat2gray(sourcePic);%实现图像矩阵的归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;%为保留图像的边缘一个像素
sobelNum=0;%经sobel算子计算得到的每个像素的值
sobelThreshold=0.8;%设定阈值
for j=2:m-1 %进行边界提取
    for k=2:n-1
        sobelNum=abs(grayPic(j-1,k+1)+2*grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-2*grayPic(j,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k-1)+2*grayPic(j-1,k)+grayPic(j-1,k+1)-grayPic(j+1,k-1)-2*grayPic(j+1,k)-grayPic(j+1,k+1));
        if(sobelNum > sobelThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
subplot(222);imshow(newGrayPic);
title('Sobel算子的处理结果');


sourcePic=imread('lena.jpg');%读取原图像
grayPic=mat2gray(sourcePic);%实现图像矩阵的归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;%为保留图像的边缘一个像素
PrewittNum=0;%经Prewitt算子计算得到的每个像素的值
PrewittThreshold=0.5;%设定阈值
for j=2:m-1 %进行边界提取
    for k=2:n-1
        PrewittNum=abs(grayPic(j-1,k+1)-grayPic(j+1,k+1)+grayPic(j-1,k)-grayPic(j+1,k)+grayPic(j-1,k-1)-grayPic(j+1,k-1))+abs(grayPic(j-1,k+1)+grayPic(j,k+1)+grayPic(j+1,k+1)-grayPic(j-1,k-1)-grayPic(j,k-1)-grayPic(j+1,k-1));
        if(PrewittNum > PrewittThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
subplot(223);imshow(newGrayPic);
title('Prewitt算子的处理结果');

sourcePic=imread('lena.jpg');%读取原图像
grayPic=mat2gray(sourcePic);%实现图像矩阵的归一化操作
[m,n]=size(grayPic);
newGrayPic=grayPic;%为保留图像的边缘一个像素
LaplacianNum=0;%经Laplacian算子计算得到的每个像素的值
LaplacianThreshold=0.2;%设定阈值
for j=2:m-1 %进行边界提取
    for k=2:n-1
        LaplacianNum=abs(4*grayPic(j,k)-grayPic(j-1,k)-grayPic(j+1,k)-grayPic(j,k+1)-grayPic(j,k-1));
        if(LaplacianNum > LaplacianThreshold)
            newGrayPic(j,k)=255;
        else
            newGrayPic(j,k)=0;
        end
    end
end
subplot(224);imshow(newGrayPic);
title('Laplacian算子的处理结果')
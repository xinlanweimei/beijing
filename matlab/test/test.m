im=imread('test3.tif');                %读取原图  
figure,imshow(im,[]);title('Raw');  %显示原图  
  
im=im2bw(im);                       %转二值图像  
figure,imshow(im,[]),title('BW');   %显示二值图像  
  
im2=imfill(im,'holes');             %填充  
im3=bwperim(im2);                   %轮廓提取  
figure,imshow(im2,[]); title('')             %显示  
figure,imshow(im3,[]); 
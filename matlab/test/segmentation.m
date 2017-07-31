[index,img] = otsu('test1.tif');
[m,n] = size(img);
for i=1:m 
    for j=1:n 
        if img(i,j)>index
            img(i,j)=255; 
        else 
            img(i,j)=0; 
        end 
    end 
end  
subplot(121)
imshow(img);

I = imread('test1.tif');
if size(I,3) > 1
    I  = rgb2gray(I);
end
level = graythresh(I);  %将所求阈值进行规范化[0,1]
BW = im2bw(I,level);
subplot(122)
imshow(BW);
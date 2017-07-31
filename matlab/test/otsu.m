function [index,img]=otsu(file)
img = imread(file);
if size(img,3) > 1
    img  = rgb2gray(img);
end
counts = imhist(img);  %灰度值
num_pixel = numel(counts);%若是一幅图像，则numel(A)将给出它的像素数
p = counts / sum(counts); %概率
omega = cumsum(p);   %前i项累计概率
mu = cumsum(p .* (1:num_pixel)');  % 前i项i*p(i)的累积和
mu_t = mu(end);  % i*p(i)的累积和

sigma_b_squared = (mu_t * omega - mu).^2 ./ (omega .* (1 - omega));
[maxval,index] = max(sigma_b_squared);  %返回最大值
index = index-1;

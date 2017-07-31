function [bw] = kmeans(im)
% subplot(131);
% imshow(im);
[mu,mask]=k_means(im,4);
[m,n] = size(im);
result(:,:,1) = im;
result(:,:,2) = im;
result(:,:,3) = im;
bw = im;
for i = 1:m
    for j = 1:n
        if mask(i,j) == 2
            result(i,j,1) = 0;
            result(i,j,2) = 255;
            result(i,j,3) = 0;
            bw(i,j) = 255;
        else
            bw(i,j) = 0;
        end
    end
end
% subplot(132);
% imshow(result);
% subplot(133);
% imshow(bw);






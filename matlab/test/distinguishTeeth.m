clear;clc;
dirs = dir('../pca/mridata/');
m = 100;
n = 100;
count = m*n;

for i = 3:length(dirs)
    dirname = strcat('../pca/mridata/',dirs(i).name);
    subdirname = strcat(dirname,'/*.tif');
    subdir = dir(subdirname);
    for j = 1:length(subdir)
        filename =strcat(dirname,'/',subdir(j).name);
        Ori(:,:,j) = imread(filename);
        I(:,:,j) = Ori(221:300,101:200,j);
        rate(j) = size(find(I(:,:,j) == 255),1) / count;
    end
    totalrate(i-2,:) = rate;
    index{i-2} = find(totalrate(i-2,:)<0.06);
end

% dirs = dir('./fuyin/033_t+a/*.tif');
% % for i = 1:size(dirs,1)
% %    filename = dirs(i).name;
% %    Ori(:,:,i) = imread(filename);
% %    I(:,:,i) = Ori(221:300, 101:200,i);
% %    imshow(I(:,:,i));
% %    average(i) = mean2(I(:,:,i));
% % end
% % index = find(average<180);
%
% m = 100;
% n = 100;
% count = m*n;
% for i = 1:size(dirs,1)
%    filename = dirs(i).name;
%    Ori(:,:,i) = imread(filename);
%    I(:,:,i) = Ori(241:340,121:220,i);
%    imshow(I(:,:,i));
%    rate(i) = size(find(I(:,:,i) == 255),1) / count;
% end
% index = find(rate<0.15);
% % index = find(index > 10);
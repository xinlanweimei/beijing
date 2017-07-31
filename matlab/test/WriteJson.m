% Writes scan.json file
clear;clc;
dirs = dir('./yuanyin/029_o_1/*.tif');
xSize = 512;
ySize = 512;
zSize = 41;
totalSize = xSize*ySize*zSize;
for i = 1:size(dirs,1)
   filename = dirs(i).name;
   imgNew(:,:,i) = imread(filename);
end
% imshow3D(imgNew);
origin = struct('x',0,'y',0,'z',0);
dimensions = struct('x',xSize,'y',ySize,'z',zSize);
spacings = struct('x',1,'y',1,'z',1);
img = double(reshape(imgNew,[1,totalSize]));
scan = struct('origin',origin,'dimensions',dimensions,'spacings',spacings,'data',img);
savejson('',scan,'scan.json');
%读取json文件，并且将三维矩阵的mri图像显示出来
% addpath('..\jsonlab-1.5'); %添加下载包的存放路径
clear;clc;
[fileName,pathName] = uigetfile('*.*','Please select an json file');%文件框，选择文件
if(fileName)
    fileName = strcat(pathName,fileName);
    fileName = lower(fileName);%一致的小写字母形式
else
    msgbox('Please select an json file');
    return; %退出程序
end
jsonData=loadjson(fileName);%jsonData是个struct结构


%读取MRI的json数据，显示3D图像
pirVal=jsonData.data';
x = jsonData.dimensions.x;
y = jsonData.dimensions.y;
z = jsonData.dimensions.z;
img = reshape(pirVal,[x y z]);
figure(1);
imshow3D(img);




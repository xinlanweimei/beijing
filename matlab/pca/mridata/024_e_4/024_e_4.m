%将CT数据填补到MRI中
clc;
clear all;
close all;


file_path3 = '.\3\';
img_path_list3 = dir(strcat(file_path3,'*.tif'));%获取该文件夹中所有tif格式的图像
img_num3 = length(img_path_list3);%获取图像总数量

file_path4 = '.\4\';
img_path_list4 = dir(strcat(file_path4,'*.tif'));%获取该文件夹中所有tif格式的图像
img_num4 = length(img_path_list4);%获取图像总数量
flag = 1;

for n = 1 : 41
    
    image_name3 = img_path_list3(n).name;
    img = imread(strcat(file_path3,image_name3));
    img1 = im2bw(img);
    img2 = imrotate(img,1,'bilinear');%对原始图像做旋转
    img3 = imrotate(img1,1,'bilinear');%对二值图像做旋转
    image_name4 = img_path_list4(n).name;
    img4 = imread(strcat(file_path4,image_name4));
    if flag == 0
        figure;
        imshow(img4);
    end
    if flag == 0
        for i = 1 : 320 %130 填补上颚
            for j = 1 : 320
                if img2(i , j) >= 1
                    img4(i + 120 , j + 40) = img2(i , j);
                end
            end
        end
    else
        flag1 = 0;
        for i = 1 : 135 %130 填补上颚
            for j = 1 : 165
                if img3(i , j) == 1
                    img4(i + 120 , j + 40) = 255;
                end
            end
        end
        img5 = imrotate(img,-3,'bilinear');%对原始图像旋转
        img6 = imrotate(img1,-3,'bilinear');%对二值图像旋转
        if flag1 == 1
            for i = 131 : 320 %130 填补下颚
                for j = 1 : 165
                    if img5(i , j) >= 1
                        img4(i + 155 , j + 31) = img5(i , j);%j控制左右移动
                    end
                end
            end
        else
            for i = 131 : 320 %130 填补下颚
                if i < 140
                    for j = 100 : 165
                        if img6(i , j) == 1
                            img4(i + 122 , j + 28) = 255;
                        end
                    end
                else
                    for j = 1 : 165
                        if img6(i , j) == 1
                            img4(i + 122 , j + 28) = 255;%j控制左右移动
                        end
                    end
                end
            end
        end
    end
    figure;
    imshow(img4);
    if flag == 1 && flag1 == 0
        imwrite(img4 , strcat('.\5\',image_name4));
    end
end
if flag == 1
    close all;
    clc;
end
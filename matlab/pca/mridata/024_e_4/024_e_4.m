%��CT�������MRI��
clc;
clear all;
close all;


file_path3 = '.\3\';
img_path_list3 = dir(strcat(file_path3,'*.tif'));%��ȡ���ļ���������tif��ʽ��ͼ��
img_num3 = length(img_path_list3);%��ȡͼ��������

file_path4 = '.\4\';
img_path_list4 = dir(strcat(file_path4,'*.tif'));%��ȡ���ļ���������tif��ʽ��ͼ��
img_num4 = length(img_path_list4);%��ȡͼ��������
flag = 1;

for n = 1 : 41
    
    image_name3 = img_path_list3(n).name;
    img = imread(strcat(file_path3,image_name3));
    img1 = im2bw(img);
    img2 = imrotate(img,1,'bilinear');%��ԭʼͼ������ת
    img3 = imrotate(img1,1,'bilinear');%�Զ�ֵͼ������ת
    image_name4 = img_path_list4(n).name;
    img4 = imread(strcat(file_path4,image_name4));
    if flag == 0
        figure;
        imshow(img4);
    end
    if flag == 0
        for i = 1 : 320 %130 ����
            for j = 1 : 320
                if img2(i , j) >= 1
                    img4(i + 120 , j + 40) = img2(i , j);
                end
            end
        end
    else
        flag1 = 0;
        for i = 1 : 135 %130 ����
            for j = 1 : 165
                if img3(i , j) == 1
                    img4(i + 120 , j + 40) = 255;
                end
            end
        end
        img5 = imrotate(img,-3,'bilinear');%��ԭʼͼ����ת
        img6 = imrotate(img1,-3,'bilinear');%�Զ�ֵͼ����ת
        if flag1 == 1
            for i = 131 : 320 %130 ����
                for j = 1 : 165
                    if img5(i , j) >= 1
                        img4(i + 155 , j + 31) = img5(i , j);%j���������ƶ�
                    end
                end
            end
        else
            for i = 131 : 320 %130 ����
                if i < 140
                    for j = 100 : 165
                        if img6(i , j) == 1
                            img4(i + 122 , j + 28) = 255;
                        end
                    end
                else
                    for j = 1 : 165
                        if img6(i , j) == 1
                            img4(i + 122 , j + 28) = 255;%j���������ƶ�
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
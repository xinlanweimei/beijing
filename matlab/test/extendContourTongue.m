global mask;
global Ori;
m = size(Ori,1);
n = size(Ori,2);
extractContour = bwperim(mask,8);
extractArea = uint8(extractContour).*Ori; %计算extractTongue轮廓的平均灰度
average = mean(extractArea(extractArea~=0));
temp  = Ori;

for i = 1:3
    mark(:,:,i) = Ori;
end
for i = 1:m
    for j = 1:n
        if mask(i,j) == 1
            mark(i,j,2) = 255;
            temp(i,j) = uint8(average);
        end
    end
end
figure(2);
imshow(mark);
pause(0.1);


I = im2double(temp);
flag = zeros(size(Ori)); % 主函数的返回值，记录区域生长所得到的区域
x = 70;
y = 70;   %初始种子位置
reg_mean = I(x,y);%表示分割好的区域内的平均值，初始化为种子点的灰度值
reg_size = 1;%分割的到的区域，初始化只有种子点一个
neg_free = 10000; %动态分配内存的时候每次申请的连续空间大小
neg_list = zeros(neg_free,3);
%定义邻域列表，并且预先分配用于储存待分析的像素点的坐标值和灰度值的空间，加速
%如果图像比较大，需要结合neg_free来实现matlab内存的动态分配
neg_pos = 0;%用于记录neg_list中的待分析的像素点的个数
pixdist = 0;
%记录最新像素点增加到分割区域后的距离测度
%下一次待分析的八个邻域像素点和当前种子点的距离
%如果当前坐标为（x,y）那么通过neigb我们可以得到其四个邻域像素的位置
neigb = [ -1 -1;
    -1  0;
    -1  1;
    0 -1;
    0  1
    1 -1;
    1  0;
    1  1];
%开始进行区域生长，当所有待分析的邻域像素点和已经分割好的区域像素点的灰度值距离
%大于reg_maxdis,区域生长结束

while (pixdist < 0.15 && reg_size < numel(I))
    %增加新的邻域像素到neg_list中
    for j=1:size(neigb,1)
        xn = x + neigb(j,1);
        yn = y + neigb(j,2);
        %检查邻域像素是否超过了图像的边界
        ins = (xn>=1)&&(yn>=1)&&(xn<=m)&&(yn<=n);
        %如果邻域像素在图像内部，并且尚未分割好；那么将它添加到邻域列表中
        if( ins && flag(xn,yn)==0)
            neg_pos = neg_pos+1;
            neg_list(neg_pos,:) =[ xn, yn, I(xn,yn)];%存储对应点的灰度值
            flag(xn,yn) = 1;%标注该邻域像素点已经被访问过 并不意味着，他在分割区域内
        end
    end
    %如果分配的内存空问不够，申请新的内存空间
    if (neg_pos+10>neg_free)
        neg_free = neg_free + 100000;
        neg_list((neg_pos +1):neg_free,:) = 0;
    end
    %从所有待分析的像素点中选择一个像素点，该点的灰度值和已经分割好区域灰度均值的
    %差的绝对值时所待分析像素中最小的
    dist = abs(neg_list(1:neg_pos,3)-reg_mean);
    [pixdist,index] = min(dist);
    %计算区域的新的均值
    reg_mean = (reg_mean * reg_size +neg_list(index,3))/(reg_size + 1);
    reg_size = reg_size + 1;
    %将旧的种子点标记为已经分割好的区域像素点
    flag(x,y)=2;%标志该像素点已经是分割好的像素点
    x = neg_list(index,1);
    y = neg_list(index,2);
    %将新的种子点从待分析的邻域像素列表中移除
    neg_list(index,:) = neg_list(neg_pos,:);
    neg_pos = neg_pos -1;
end
flag = (flag==2);%我们之前将分割好的像素点标记为2
figure(3);
hold on;
subplot(2,2,1),imshow(flag);
flag=imfill(flag,'holes');
subplot(2,2,2),imshow(flag);
pause(0.1);
flag=imfill(flag);
subplot(2,2,3),imshow(flag);
pause(0.1);
for i = 1:3
    mk(:,:,i) = Ori;
end
for i = 1:m
    for j = 1:n
        if flag(i,j) == 1
            mk(i,j,2) = 255;
        end
    end
end
subplot(2,2,4),imshow(mk);
hold off;

contour =bwperim(flag,8);
for i = 1:3
    im(:,:,i) = Ori;
end
for i = 1:m
    for j = 1:n
        if contour(i,j) == 1
            im(i,j,2) = 255;
        end
    end
end
figure(4);
imshow(im);

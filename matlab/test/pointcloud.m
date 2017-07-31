function [data]=pointcloud()
I = imread('test3.tif');
subplot(131);
imshow(I);
[mu,mask]=k_means(I,4);
[m,n] = size(I);
result(:,:,1) = I;
result(:,:,2) = I;
result(:,:,3) = I;
for i = 1:m
    for j = 1:n
        if mask(i,j) == 2
            result(i,j,1) = 0;
            result(i,j,2) = 255;
            result(i,j,3) = 0;
        end
    end
end
subplot(132);
imshow(result);
temp = zeros(size(I));
BM = I;
for i = 1:m
    for j = 1:n
        if mask(i,j) == 2
            I(i,j) = 1;
        else
            I(i,j) = 0;
        end
    end
end
for i = 1:m
    for j = 1:n
        if I(i,j) == 1
            if i == 1
                if j == 1
                    if I(i+1,j) == 0 || I(i,j+1)==0 || I(i+1,j+1)==0
                        temp(i,j) = 1;
                    end
                elseif j == n
                    if  I(i,j-1)==0 || I(i+1,j-1)==0 || I(i+1,j) == 0
                        temp(i,j) = 1;
                    end
                else
                    if I(i,j-1)==0 || I(i,j+1)==0 || I(i+1,j-1)==0  || I(i+1,j) == 0 || I(i+1,j+1) ==0
                        temp(i,j) = 1;
                    end
                end
            elseif i == m
                if j == 1
                    if I(i-1,j) == 0 || I(i-1,j+1)==0 || I(i,j+1)==0
                        temp(i,j) = 1;
                    end
                elseif j == n
                    if  I(i-1,j-1)==0 || I(i,j-1)==0 || I(i-1,j) == 0
                        temp(i,j) = 1;
                    end
                else
                    if I(i,j-1)==0 || I(i,j+1)==0 || I(i-1,j-1)==0  || I(i-1,j) == 0 || I(i-1,j+1) ==0
                        temp(i,j) = 1;
                    end
                end
            else
                if j==1
                    if I(i-1,j)==0 || I(i-1,j+1)==0 || I(i,j+1)==0 || I(i+1,j)==0 || I(i+1,j+1)==0
                        temp(i,j) = 1;
                    end
                elseif j == n
                     if I(i-1,j)==0 || I(i-1,j-1)==0 || I(i,j-1)==0 || I(i+1,j)==0 || I(i+1,j-1)==0
                        temp(i,j) = 1;
                     end
                else
                    if I(i-1,j)==0 || I(i-1,j-1)==0 || I(i-1,j+1)==0 || I(i,j-1)==0 || I(i,j+1)==0 || I(i+1,j-1)==0 || I(i+1,j)==0 || I(i+1,j+1)==0
                        temp(i,j) = 1;
                    end
                end
            end
        end
    end
end

for i = 1:m
    for j = 1:n
        if temp(i,j) == 1
            BM(i,j) = 255;
        else 
            BM(i,j) = 0;
        end
    end
end
subplot(133);
imshow(BM);
index = find(temp==1);
for i = 1:length(index)
    data(i,1) = mod(index(i),m);
    data(i,2) = (index(i)-data(i,1))/m;
    data(i,3) = 0;
    data(i+length(index),1) = data(i,1);
    data(i+length(index),2) = data(i,2);
    data(i+length(index),3) = 1;
end



                    
            


                
                
                
     
    

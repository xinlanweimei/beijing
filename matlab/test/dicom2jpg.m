folder = '../data/DATABASE_MRI_20150129_DICOM/FANGQIANG_YUANYIN/001_a_1/';
D = dir([folder '*.IMA']);

for i = 1:length(D)
    img = dicomread( [folder D(i).name] );
    
    img = im2double(img);
    u = max(max(img,[],1));
    l = min(min(img,[],1));

    img_t = img.*(2^8-1)/u;
    img_t = uint8(img_t);
    
    figure(i)
    subplot(1,2,1);
    imshow(img,[])
    
    xlabel('Original');
    subplot(1,2,2);
    imshow(img_t,[])
    xlabel('bmp');
    D(i).name(end-3:end) = [];
    fn = ['./TIFF_a_1/' strcat(D(i).name, '.tif')];
    imwrite(img_t,fn);
end
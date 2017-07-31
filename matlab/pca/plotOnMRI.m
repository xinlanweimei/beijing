[show_init_x,show_init_y,show_recon_x,show_recon_y] = pcaAnalysis();

plot(show_init_x(1, :),show_init_y(1, :), 'r');
hold on;
plot(show_recon_x(1, :), show_recon_y(1, :), 'k');
hold off;
 set(gca, 'ydir','reverse');
legend('init', 'PCA');
axis([60 260 200 380]);

I = imread('./data/001_a_1/001_a_1_26.tif');
% result(:,:,1) = I;
% result(:,:,2) = I;
% result(:,:,3) = I;
% for i = 1:size(show_init_x,2)
%      y = uint16(show_init_x(1,i));
%      x = uint16(show_init_y(1,i));
%      result(x,y,2) = 255;
% end
figure(2);
imshow(I);
axis on;
hold on;
plot(show_init_x(1, :), show_init_y(1, :), 'r');
plot(show_recon_x(1, :), show_recon_y(1, :), 'y');
hold off;
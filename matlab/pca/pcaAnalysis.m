% 载入矩阵，每个控制参数对中矢面轮廓的影响
function [show_init_x,show_init_y,show_recon_x,show_recon_y,score] = pcaAnalysis()
clear ; clc;

load re_tongue104;
% re_tongue
nComponent_tng = 4;


midSagittal = re_tongue(:, 1 : 90);
midSagittal = [midSagittal re_tongue(:, 840 : -1 : 811) re_tongue(:, 870 : -1 : 841) re_tongue(:, 900 : -1 : 871)];
midData = midSagittal;
%提取中矢面数据，第1片和第10片
mean_tng = mean(midData);


[coef, score, latent] = pca(midData);

% 载入矩阵，每个控制参数对中矢面轮廓的影响
loading_matrix_tng = coef(:, 1 : nComponent_tng)';
% size(loading_matrix_tng)    nComponent_tng * 180   nComponent_tng个控制参数对180个数据的影响
% 控制参数，控制中矢面轮廓
loading_tng        = score(:, 1 : nComponent_tng);
% size(loading_tng)     104 * nComponent_tng     104个发音每个发音的控制参数

% 重构中矢面结果
reConstruction_tng = repmat(mean_tng, size(re_tongue, 1), 1) + loading_tng * loading_matrix_tng;
% size:104*180

show_init_x = [midSagittal(:, 1 : 30) midSagittal(:, 91 : 120)];
show_init_y = [midSagittal(:, 31 : 60) midSagittal(:, 121 : 150)];
show_init_z = [midSagittal(:, 61 : 90) midSagittal(:, 151 : 180)];

show_recon_x = [reConstruction_tng(:, 1 : 30) reConstruction_tng(:, 91 : 120)];
show_recon_y = [reConstruction_tng(:, 31 : 60) reConstruction_tng(:, 121 : 150)];
show_recon_z = [reConstruction_tng(:, 61 : 90) reConstruction_tng(:, 151 : 180)];


% % 这里处理提取发音
% [num, txt, row] = xlsread('list');
% titles_cell = txt(:, 2:2);
% titles_cell = titles_cell(2: length(titles_cell));
% 
% titles = char(titles_cell);
% titles = titles(:, 5 : 8);
% %绘图
% for f = 1 : size(re_tongue, 1)
%     plot(show_init_x(f, :), show_init_y(f, :), 'r')
%     hold on
%     plot(show_recon_x(f, :), show_recon_y(f, :), 'k')
%     hold off
%     
%     title(['发音 ', titles(f, :)])
%     set(gca, 'ydir','reverse')
%     legend('init', 'PCA')
%     axis([60 260 200 380])
%     
%     h = gcf;
% %     [sprintf('./result/Volume %d ', f), titles(f, :), '.jpg']
%     saveas(h, [sprintf('./result/Volume %d ', f), titles(f, :), '.jpg']);
% end


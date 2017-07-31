 %example 2d,
    I = im2double(imread('test2.tif'));
    JS = CoherenceFilter(I,struct('T',15,'rho',10,'Scheme','S'));
    JN = CoherenceFilter(I,struct('T',15,'rho',10,'Scheme','N'));
    JR = CoherenceFilter(I,struct('T',15,'rho',10,'Scheme','R'));
    JI = CoherenceFilter(I,struct('T',15,'rho',10,'Scheme','I'));
    JO = CoherenceFilter(I,struct('T',15,'rho',10,'Scheme','O'));
    figure, 
    subplot(2,3,1), imshow(I), title('Before Filtering');
    subplot(2,3,2), imshow(JI), title('Standard Scheme');
    subplot(2,3,3), imshow(JN), title('Non Negative Scheme');
    subplot(2,3,4), imshow(JI), title('Implicit Scheme');
    subplot(2,3,5), imshow(JR), title('Rotation Invariant Scheme');
    subplot(2,3,6), imshow(JO), title('Optimized Scheme');
  
%  example 2d, color HDCS 2D not in literature
%     I = im2double(imread('images/lena.jpg'));
%     I = I+(rand(size(I))-0.5)*0.3;
%     JO =      CoherenceFilter(I,struct('T',1,'dt',0.1,'rho',4,'Scheme','O','eigenmode',0));
%     JO_EED =  CoherenceFilter(I,struct('T',1,'dt',0.1,'rho',4,'Scheme','O','eigenmode',2));
%     JO_HDCS = CoherenceFilter(I,struct('T',1,'dt',0.1,'rho',4,'Scheme','O','eigenmode',4));
%     JS_HDCS = CoherenceFilter(I,struct('T',1,'dt',0.1,'rho',4,'Scheme','S','eigenmode',4));
%     JR_HDCS = CoherenceFilter(I,struct('T',1,'dt',0.1,'rho',4,'Scheme','R','eigenmode',4));
%  
%     figure, 
%     subplot(2,3,1), imshow(I), title('Before Filtering');
%     subplot(2,3,2), imshow(JO), title('Optimized Scheme');
%     subplot(2,3,3), imshow(JO_EED), title('Edge Enhancing Optimized Scheme');
%     subplot(2,3,4), imshow(JO_HDCS), title('HDCS Optimized Scheme');
%     subplot(2,3,5), imshow(JS_HDCS), title('HDCS Standard Scheme');
%     subplot(2,3,6), imshow(JR_HDCS), title('Rotation invariant Scheme');
%  
% %  example 3d,
%  	% First compile the c-code by executing compile_c_files.m
%     load('images/sphere');
%     showcs3(V);
%     JR = CoherenceFilter(V,struct('T',10,'dt',3,'Scheme','R'));
%     showcs3(JR);
%  
%  % example 3d, Mendrik : Hybrid Diffusion October 2009
%     load('images/sphere');
%     showcs3(V);
%     JS = CoherenceFilter(V,struct('T',5,'dt',0.15,'Scheme','S','eigenmode',4));
%     JO = CoherenceFilter(V,struct('T',5,'dt',0.50,'Scheme','O','eigenmode',4));
%     showcs3(JS);
%     showcs3(JO);
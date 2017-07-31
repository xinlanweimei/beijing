%*******************计算f1和f2************************************%
function [f1,f2]=localbinaryfitting(Img,K,H,KI,KONE)
HI=Img.*H;
cov1=conv2(HI,K,'same');
cov2=conv2(H,K,'same');
f1=cov1./cov2;
f2=(KI-cov1)./(KONE-cov2);
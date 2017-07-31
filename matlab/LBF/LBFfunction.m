%****************计算LBF能量项，此处用到积分卷积相关知识**********%
%化简公式 inter（f1(x-tao)f2(tao)）=f1(x)*f2(x)
function f=LBFfunction(f1,f2,K,KONE,Img,lambda1,lambda2)
s1=lambda1*f1.*f1-lambda2*f2.*f2;
s2=lambda1*f1-lambda2*f2;
f=(lambda1-lambda2).*KONE.*Img.*Img+conv2(s1,K,'same')-2.*Img.*conv2(s2,K,'same');



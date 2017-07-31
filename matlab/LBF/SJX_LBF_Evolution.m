%下面为演化程序：
%********此函数为基于局部区域（LBF）的能量演化函数**************************%
function u=SJX_LBF_Evolution(u0,Img,K,KI,KONE, nu,timestep,mu,lambda1,lambda2,epsilon,Iter,DR)
LSF=u0;
for i=1:Iter
    LSF=nuamanboundary(LSF);
    C=cuvature(LSF);
   
    H= Heavisidefunction(epsilon, LSF);
    Draic=draicfunction(epsilon, LSF);
   
    [f1,f2]=localbinaryfitting(Img,K,H,KI,KONE);
    f=LBFfunction(f1,f2,K,KONE,Img,lambda1,lambda2);
   
%***************DistanceRegulariationterm的选取*************************%
    if strcmp(DR,'double_sigle')
        DistanceRegulariationterm=mu*(4*del2(LSF)-C);
    elseif strcmp(DR,'double_well')
        DistanceRegulariationterm=mu*DistanceRegulariation(LSF);
    else
        disp('错误的水平集演化，未正确选取距离规则函数');
    end
   
    LBFterm_enegry=-Draic.*f;
    Length_smooth=nu*Draic.*C;
   
    u=LSF+timestep*(LBFterm_enegry+ DistanceRegulariationterm+Length_smooth);
end
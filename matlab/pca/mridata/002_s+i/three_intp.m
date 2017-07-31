  function [connew ansres]= three_intp( con,intp )
%3D的曲线插值平分函数
con=con;intp=intp; ansres=[];connew=[];
if size(con,1)==2
    conn=con;con=[];con(1,:)=conn(1,:);con(3,:)=conn(2,:);
    for i=1:3
        con(2,i)=(con(1,i)+con(2,i))/2;
    end 
end
conlen=length(con);
for i2=1:conlen-1
    xx0=con(i2,1);yy0=con(i2,2);zz0=con(i2,3);
    xx1=con(i2+1,1);yy1=con(i2+1,2);zz1=con(i2+1,3);
    len=floor(sqrt((xx1-xx0)*(xx1-xx0)+(yy1-yy0)*(yy1-yy0)+(zz1-zz0)*(zz1-zz0)));
    ansres=[ansres;xx0,yy0,zz0];%插中间，不插头和尾
    for j=1:len-1
        ansresx=xx0+(xx1-xx0)*j/len;
        ansresy=yy0+(yy1-yy0)*j/len;
        ansresz=zz0+(zz1-zz0)*j/len;
        ansres=[ansres;ansresx,ansresy,ansresz];
    end
end
ansres=[ansres;con(end,1),con(end,2),con(end,3)];%每段的最后一个点放进来
%再平分
newlen=length(ansres);
for i=1:intp-1
    connew(i,1)=ansres(1+floor(newlen/(intp-1)*(i-1)),1);
    connew(i,2)=ansres(1+floor(newlen/(intp-1)*(i-1)),2);
    connew(i,3)=ansres(1+floor(newlen/(intp-1)*(i-1)),3);
end
connew(intp,1)=ansres(end,1);connew(intp,2)=ansres(end,2);connew(intp,3)=ansres(end,3);
end


%**********************双谷函数 距离调整项的实现**************%
function f=DistanceRegulariation(x)
[nx,ny]=gradient(x);
s=sqrt(nx.*nx+ny.*ny);
a=(s>=0)&(s<=1);
b=(s>1);
ps=a.*(sin(2*pi.*s)./(2*pi))+b.*(s-1);
dps=((ps~=0).*ps+(ps==0))./((s~=0).*s+(s==0));
x1=dps.*nx-nx;
x2=dps.*ny-ny;
[x1_xx,x1_xy]=gradient(x1);
[x2_yx,x2_yy]=gradient(x2);
f=x1_xx+x2_yy+4*del2(x);
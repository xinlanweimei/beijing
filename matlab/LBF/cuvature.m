%*****************曲率计算，采用中心差分******************************%
function  f=cuvature(x)
[nx,ny]=gradient(x); 
 magnitude=sqrt(nx.*nx+ny.*ny+1e-10);%+1e-10;+1e-10
 Nx=nx./(magnitude);
 Ny=ny./(magnitude);
[nxx,nxy]=gradient(Nx);
[nyx,nyy]=gradient(Ny);
f=nxx+nyy;
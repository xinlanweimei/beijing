function [xx,yy,zz]= plot_three( x ,ln ,col , f)
xx=[];yy=[];zz=[];ln=ln;col=col;
for i=1:col
    xx(:,i)=x(ln*3*(i-1)+1:ln*3*(i-1)+ln);
    yy(:,i)=x(ln*3*(i-1)+ln+1:ln*3*(i-1)+ln*2);
    zz(:,i)=x(ln*3*(i-1)+ln*2+1:ln*3*(i-1)+ln*3);
end
if f==1
    h = surf(xx,yy,zz , 'facecolor',[1 0.69 0.39]);
elseif f==2
    h = surf(xx,yy,zz , 'facecolor',[1 0 0]);
elseif f==3
    h = surf(xx,yy,zz , 'facecolor',[1 1 0]);
end
% set(h,'FaceLighting','phong','FaceColor','interp',...
%       'AmbientStrength',0.5)
% light('Style','local','Position',[100,450,-480]);
% grid on;
% shading interp;
% colormap(copper);
end


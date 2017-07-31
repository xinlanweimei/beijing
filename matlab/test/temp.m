%  load('object3d.mat');
data = pointcloud();
ptCloud = pointCloud(data);
normals = pcnormals(ptCloud);

figure
pcshow(ptCloud)
title('Estimated Normals of Point Cloud')
hold on

x = ptCloud.Location(1:10:end,1);
y = ptCloud.Location(1:10:end,2);
z = ptCloud.Location(1:10:end,3);
u = normals(1:10:end,1);
v = normals(1:10:end,2);
w = normals(1:10:end,3);


quiver3(x,y,z,u,v,w);

hold off
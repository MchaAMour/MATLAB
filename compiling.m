clc
clear all
tic
radius = 1400;
user_no_perbs = 10;

[bs] = cell_layout(radius);

[coord_x,coord_y] = get_coordinates(bs(1,1),bs(1,2),radius);

[user] = user_distribution(user_no_perbs,bs,radius);

plot(user(:,1),user(:,2),'g.');



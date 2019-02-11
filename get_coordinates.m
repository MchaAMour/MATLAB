function [coord_x,coord_y] = get_coordinates(bs_x,bs_y,radius)

m1 = tan(30*pi/180);
m2 = tan(150*pi/180);

outside = 2;
R=radius;

while outside
     x_temp = R - 2*rand*R;
     y_temp = R - 2*rand*R;
     if (x_temp < sqrt(3)/2*R & x_temp>-sqrt(3)/2*R) & (y_temp < m1*x_temp+R & y_temp <m2*x_temp+R & y_temp > m2*x_temp-R & y_temp>m1*x_temp-R )
         outside = 0;
     end

end
coord_x = y_temp + bs_x;
coord_y = x_temp + bs_y;



function [bs] = cell_layout(cell_radius)
%Input the cell-radius in meters
%Output: Plots the cell layout with cell-centres
%Output

radius = cell_radius;  %radius in meters.

t = linspace(0,2*pi,7);

%center cell
t = linspace(0,2*pi,7);

%center cell
x1 = 0 + radius*cos(t);
y1 = 0 + radius*sin(t);
c_x1 = 0; %BS Location Center Cell x-axis
c_y1 = 0; %BS Location Center Cell y-axis
plot(x1,y1);
hold on
%%

% Upper cell
x2=0+radius*cos(t);                        
y2 = ((sqrt(3)/2)*2*radius) + (radius*sin(t));
c_x2 = 0; %BS Location Upper cell Cell x-axis
c_y2 = ((sqrt(3)/2)*2*radius); %BS Location Upper cell y-axis
plot(x2,y2);

%%

% Lower cell
x3=0+radius*cos(t);                        
y3 = -((sqrt(3)/2)*2*radius) + (radius*sin(t));
c_x3 = 0; %BS Location Lower cell Cell x-axis
c_y3 = -((sqrt(3)/2)*2*radius); %BS Location Lower cell y-axis
plot(x3,y3)

%%

%Right Upper cell
x4= (radius+(radius/2)) + radius*cos(t);                        
y4 = ((sqrt(3)/2)*radius) + (radius*sin(t));
c_x4 = (radius+(radius/2)); %BS Location Right Upper cell x-axis
c_y4 = ((sqrt(3)/2)*radius); %BS Location Right Upper cell y-axis
plot(x4,y4);

%%

%Right Lower cell
x5= (radius+(radius/2)) + radius*cos(t);                        
y5 = -((sqrt(3)/2)*radius) + (radius*sin(t));
c_x5 = (radius+(radius/2)); %BS Location Right Lower cell x-axis
c_y5 = -((sqrt(3)/2)*radius); %BS Location Right Lower cell y-axis
plot(x5,y5);

%%

%Left Upper cell
x6= -(radius+(radius/2)) + radius*cos(t);                        
y6 = ((sqrt(3)/2)*radius) + (radius*sin(t));
c_x6 = -(radius+(radius/2)); %BS Location Right Lower cell x-axis
c_y6 = ((sqrt(3)/2)*radius); %BS Location Right Lower cell y-axis
plot(x6,y6);

%%

%Left Lower cell
x7= -(radius+(radius/2)) + radius*cos(t);                        
y7 = -((sqrt(3)/2)*radius) + (radius*sin(t));
c_x7 = -(radius+(radius/2)); %BS Location Left Lower cell x-axis
c_y7 = -((sqrt(3)/2)*radius); %BS Location Left Lower cell y-axis
plot(x7,y7);
BS_locations_x = [c_x1 c_x4 c_x2 c_x6 c_x7 c_x3 c_x5];
BS_locations_y = [c_y1 c_y4 c_y2 c_y6 c_y7 c_y3 c_y5];

cells_x = [x1; x4; x2; x6; x7; x3; x5];
cells_y = [y1; y4; y2; y6; y7; y3; y5];
%plot(cells_x(:),cells_y(:));  hold on
plot(BS_locations_x,BS_locations_y,'r+')

bs = [BS_locations_x' BS_locations_y' ];

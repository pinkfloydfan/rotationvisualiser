roll  = 0;
pitch = 270;
yaw   = 270;

tx = 0;
ty = 0;
tz = 1;

roll  = deg2rad(roll);
pitch = deg2rad(pitch);
yaw   = deg2rad(yaw);

x_axis = [1; 0; 0];
y_axis = [0; 1; 0];
z_axis = [0; 0; 1];

t = linspace(0, 1, 2);

x_ = x_axis*t;
y_ = y_axis*t;
z_ = z_axis*t;

R3 = [cos(yaw) -sin(yaw)  0;
      sin(yaw)  cos(yaw)  0;
      0          0        1];
  
R2 = [cos(roll)  0 sin(roll);
      0          1        0;
      -sin(roll) 0 cos(roll)];
  
R1 = [1          0        0;
      0 cos(pitch) -sin(pitch);
      0 sin(pitch)  cos(pitch)];

R = R3*R2*R1;

T = [R [tx ty tz]';
     0 0 0 1 ];

xr = R*x_axis;
yr = R*y_axis;
zr = R*z_axis;

or_ = T*[0; 0; 0; 1];


xr_ = T*[x_axis; 1];
yr_ = T*[y_axis; 1];
zr_ = T*[z_axis; 1];

figure;
plot3(x_(1,:), x_(2,:), x_(3,:), '-r', 'linewidth', 2);
hold on
plot3(y_(1,:), y_(2,:), y_(3,:), '-g', 'linewidth', 2);
plot3(z_(1,:), z_(2,:), z_(3,:), '-b', 'linewidth', 2);


%plot3(xr_(1,:), xr_(2,:), xr_(3,:), '-.ro');
%plot3(yr_(1,:), yr_(2,:), yr_(3,:), '-.go');
%plot3(zr_(1,:), zr_(2,:), zr_(3,:), '-.bo');


hold on 


grid on;
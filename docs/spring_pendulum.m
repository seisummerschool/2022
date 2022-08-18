N = 10;

w = 0.01;

initialState = zeros(1,4);

options = odeset('RelTol',1e-12,'AbsTol',1e-12);

for i=1:N

initialState(1) = 1.2 - w + 2*w*rand();
initialState(2) = 0.5 - w + 2*w*rand();

[t, states] = ode45(@(t, x) dynamics(t, x), [0 2], initialState, options);

%plot(states(:,2), states(:,1), 'color', 'b');
%hold on;

plot(states(:,4), states(:,3), 'color', 'b');
hold on;
end



function dxdt = dynamics(t, x)
    r = x(1);
    theta = x(2);
    dr = x(3);
    dtheta = x(4);


    dxdt(1,1) = dr;
    dxdt(2,1) = dtheta;
    dxdt(3,1) = r*dtheta^2 + 9.8*cos(theta) - 2*(r - 1);
    dxdt(4,1) = (-2*dr*dtheta - 9.8*sin(theta))/r;
end
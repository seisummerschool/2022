N = 50;
delta = 0.1;

initialState = zeros(1,12);

initialState(1) = -0.5;
initialState(2) = -0.5;
initialState(3) = -0.5;
initialState(4) = -0.5;
initialState(5) = -0.5;
initialState(6) = -0.5;

T = [];
states = [];

for i=1:N
    u(1) = 7.14285714285714*(initialState(3) - 1) - 2.14285714285714 * initialState(6);
    u(2) = -initialState(7) - initialState(10);
    u(3) = -initialState(8) - initialState(11);

    [local_t, local_states] = ode45(@(t, x) dynamics(t, x, u), [0, delta], initialState);

    T = [T; (i-1)*delta + local_t];
    states = [states; local_states];
    initialState = local_states(end,:);

end

plot(T,states(:,3), '-', 'color', 'b', 'LineWidth', 2);
hold on;





function dxdt = dynamics(t, x, u)
    x1 = x(1);
    x2= x(2);
    x3 = x(3);
    x4 = x(4);
    x5 = x(5);
    x6 = x(6);
    x7 = x(7);
    x8 = x(8);
    x9 = x(9);
    x10 = x(10);
    x11 = x(11);
    x12 = x(12);

    u1 = u(1);
    u2 = u(2);
    u3 = u(3);

    dxdt(1,1) = cos(x8)*cos(x9)*x4 + (sin(x7)*sin(x8)*cos(x9) - cos(x7)*sin(x9))*x5 + (cos(x7)*sin(x8)*cos(x9) + sin(x7)*sin(x9))*x6;
	dxdt(2,1) = cos(x8)*sin(x9)*x4 + (sin(x7)*sin(x8)*sin(x9) + cos(x7)*cos(x9))*x5 + (cos(x7)*sin(x8)*sin(x9) - sin(x7)*cos(x9))*x6;
	dxdt(3,1) = sin(x8)*x4 - sin(x7)*cos(x8)*x5 - cos(x7)*cos(x8)*x6;
	dxdt(4,1) = x12*x5 - x11*x6 - 9.81*sin(x8);
	dxdt(5,1) = x10*x6 - x12*x4 + 9.81*cos(x8)*sin(x7);
	dxdt(6,1) = x11*x4 - x10*x5 + 9.81*cos(x8)*cos(x7) - 9.81 + u1;
	dxdt(7,1) = x10 + (sin(x7)*(sin(x8)/cos(x8)))*x11 + (cos(x7)*(sin(x8)/cos(x8)))*x12;
	dxdt(8,1) = cos(x7)*x11 - sin(x7)*x12;
	dxdt(9,1) = (sin(x7)/cos(x8))*x11 + (cos(x7)/cos(x8))*x12;
	dxdt(10,1) = -0.92592592592593*x11*x12 + 18.51851851851852*u2;
	dxdt(11,1) = 0.92592592592593*x10*x12 + 18.51851851851852*u3;
	dxdt(12,1) = 0;

end
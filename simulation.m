% PRAKTIKUM TUM - MOTION PLANNING FOR AUTONOMOUS VEHICLES
% Maximilian Stefan Schreber - ge65boq@mytum.de
%--------------------------------------------------------------------------
% define nonlinear system
sys = nonlinearSys(@mpfavStateFunction,3,1,@mpfavOutputFunction,2);
% define parameters
% define set representation
c = [0.001;0.001;8.001];                      % recommended to be ±0;±0,±8
G = [8 2 2;0 3 -3;0 0 0];                 % my Generatormatrix for zonotope
R0 = zonotope(c,G);
params.tFinal = 0;
params.tFinal = 4; % recommended by S.Baldi
params.R0 = R0;

% define options
options.timeStep = 0.01;
options.taylorTerms = 4;
options.zonotopeOrder = 50;
options.intermediateOrder = 50;
options.errorOrder = 20;
options.alg = 'lin-adaptive';
options.tensorOrder = 3;

% do simulation------------------------------------------------------------
disp('performing simulations now:')
simOpt.points = 80;
simRes = simulateRandom(sys,params,simOpt);
disp('simulations done! trying to plot simulations:')




% perform reach()----------------------------------------------------------
tic
disp('reach() will be performed now:')
R = reach(sys,params,options);
tComp = toc; % stop computation tume
disp(['reachable set done!'])
disp(['computation time of reachable set: ',num2str(tComp)]);

plot(R);


% plot()-------------------------------------------------------------------
figure; hold on; box on;
useCORAcolors("CORA:contDynamics")
dimension = [1 2];
plot(simRes,dimension,'DisplayName','Simulation');
plot(R,dimension,'DisplayName','Reachable Set');
legend()

%--STATE FUNCTION----------------------------------------------------------
function f = mpfavStateFunction(x,u) % x state, y input
  
% x(1) = e_i
% x(2) = nu_i
% x(3) = v_{i-1}
% u = a_{i-1}

h = 0.6283;
alpha = 0.6;
beta = 0.9;
r = 10.5752;
vmax = 30;
hst = 5;
hgo = 35;

V = @(d) vmax/2*(1+tanh(10*(d-(hgo+hst)/2)/pi/(hgo-hst)));

%---DEFINITION OF SYSTEM --------------------------------------------------

% first line of dynamic system de_i
f(1,1) = x(2)-h*(alpha*(V(x(1)+h*(x(3)-x(2))+r)-x(3)+x(2)))+beta*x(2);
% second line dnu_i
f(2,1) = u - alpha*(V(x(1)+h*(x(3)-x(2))+r)-x(3)+x(2))- beta*x(2);
% third line v_i-1
f(3,1) = u;                                                            
end

%--OUTPUT FUNCTION---------------------------------------------------------

function g = mpfavOutputFunction(x,u) % x state, y input

% x(1) = e_i
% x(2) = nu_i
% x(3) = v_{i-1}
% u = a_{i-1}

h = 0.6283;
alpha = 0.6;
beta = 0.9;
r = 10.5752;
vmax = 30;
hst = 5;
hgo = 35;

V = @(d) vmax/2*(1+tanh(10*(d-(hgo+hst)/2)/pi/(hgo-hst)));
%---DEFINITION OF 2D OUTPUT -----------------------------------------------

% first row of output - e_i 
g(1,1) = x(1); % e_i -> Spacing error
% second row of output -> calculation of a_i
g(2,1) = alpha * (V(x(1)+h*(x(3)-x(2))+r)-x(3)+x(2)) + beta * x(2); 
end


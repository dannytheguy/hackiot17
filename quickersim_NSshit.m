clc;
clear;
 
 
% Import and display mesh
[p,e,t] = importMeshGmsh('simpleRib.msh');
displayMesh2D(p,t);
<img class="size-full wp-image-2396 aligncenter" src="http://quickersim.com/cfdtoolbox/wp-content/uploads/2017/07/QuickerSim-Heat-Transfer-Rib-mesh.png" alt="" width="560" height="420" />
 
 
% Define timestepping parameters
nstep = 120; % number of steps
dt = 240; % time step size
 
 
% Define material parameters
rho = 2000; % density
cp = 1200; % heat capacity
lambda1 = 50; % thermal conductivity of the surrounding material
lambda2 = 400; % thermal conductivity of the rib material
 
 
% Assign thermal conductivities to appropriate subdomains
nelements = size(t,2);
lambda = lambda2*ones(nelements,1);
lambda(t(end,:)==19) = lambda1;
 
 
% Init solution with constant value
[T,convergence] = initScalarSolution(p,293);
 
 
% Precompute mass matrix and diffusion matrix
M = assembleMassMatrix2D(p,t,rho*cp/dt);
D = assembleDiffusionMatrix2D(p,t,lambda);
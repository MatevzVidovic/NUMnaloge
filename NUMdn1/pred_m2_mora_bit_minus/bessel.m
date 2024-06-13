function y=bessel(y0,ya,a,m,n,tol,maxit,omega)

x=linspace(0,a,n);%tocke, kjer racunamo resitev / interval of points
h=x(2)-x(1);%dolzina intervala / length of subinterval


% x spremenimo na notranje tocke intervala
x = x(2:n-1);


pod= (x.^2 ./ h.^2) - (x ./ (2*h));
pod(1) = 0;

dia= x.^2 - (2* x.^2 ./ h.^2) + m.^2;

nad=(x.^2 ./ h.^2) + (x ./ (2*h));
nad(end) = 0;

M=[pod' dia' nad'];

c= zeros(n-2,1);
c(1) = c(1) - y0;
c(end) = c(end) - ya;


% sistem: M * v = c
% Gauss-Seidel predpis
% D*v(k.) = c − Z*v(k−1.) − S*v(k.)
% Torej v_i = (c_i - Z_i * v_(i-1) - S_i * v_i / D_i
% Mah ne, to je lunacy.
% Pomoje je treba samo premislit, kaj bi to zdaj sploh pomenilo.

% Torej:
% noviV_i = zeros(n, 1)
% noviV_1 = (c_1 - Z_1 * stariV_2 )/ D_1 % tu se ni tega clena s spodnjetrikotno, ker je se ni. Pac v 0 bi se zmnoszilo.
% noviV_i = (c_i - Z_i * stariV_(i+1) - S_i * noviV_(i-1) )/ D_i
% noviV_end = (c_end - S_end * noviV_(end-1) )/ D_end


% zac priblizek
v_star = ones(n-2,1);
v_nov = [v_star];

nap = 1; % le inicializiramo napako
nap= napaka(M, v_star, c);
k=0;%zacetna vrednost za stevec
while nap>tol && k<maxit
    v_nov = tridiagSORnaslednji(M, v_star, c, 0.8);
    
    nap=napaka(M, v_nov, c);
    
    v_star = v_nov;
    k=k+1;%premknemo stevec
end

y = v_nov;
y = [y0, y', ya]






% ekzaktna rešitev
y=tridiag(M,c);
y=[y0 y' ya];%dodamo vrednosti na robu / add the points on the boundary

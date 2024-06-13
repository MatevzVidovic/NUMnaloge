
% diagonalna dominantnost se izkaze, da je pod pogojem:
%    m^2 > x_i^2
% ampak naceloma se zdi, da tudi ce ni, se kar izide

% =bessel(y0,ya,a,m,n,tol,maxit,omega)

% unit test 1
bessel(0, 0, 3, 1, 4, 1e-10, 100, 0.5)

bessel(1, 1, 3, 3, 4, 1e-10, 100, 0.5)

% zgleda premajhen m naredi, da ni diagonalno dominantna, in potem ne
% konvergira

bessel(1, 1, 3, 3, 4, 1e-10, 10, 0.5)


bessel(1, 5, 3, 35, 20, 1e-10, 10, 0.5)


bessel(5, 8, 95, 5, 30, 1e-10, 100, 0.5)

bessel(5, 8, 95, 1, 30, 1e-10, 100, 0.5)

% Diagonalno dominantna mora bit, torej diagonalni clen mora biti vecji kot
% sestevek teh dveh zraven.
% Torej:      2 x_i^2 / h^2   < x_i^2 - 2 x_i^2 / h^2 + m^2
% Torej:    4 x_i^2 / h^2   <   x_i^2  + m^2
% Torej:     4 / h^2   <   1  + m^2/x_i^2
% Veljati mora tudi za najvecji x_i, torej lahko namesto njega vstavimo kar
% parameter a:
% 4 / h^2   <   1  + m^2/a^2
% Torej:    4 <  h^2  + (h^2 * m^2) /a^2
% Torej je zelo pomembno, kaksen je razmak med temi tockami. Ce bo
% premajhen, to ne bo konvergiralo.
% In zato mi ni nic delalo.

% =bessel(y0,ya,a,m,n,tol,maxit,omega)

% unit test 1
bessel(0, 0, 3, 0, 4, 1e-10, 10, 0.5)

% unit test neuporabljen, dobis nan, ker je na diagonali 0
% bessel(1, 1, 3, 1, 4, 1e-10, 10, 0.5)

% unit test 2
% wut, tle pa actually dela (Jacobi at leat), nice
bessel(1, 1, 3, 3, 4, 1e-10, 100, 0.5)

% zgleda premajhen m naredi, da ni diagonalno dominantna, in potem ne
% konvergira

bessel(1, 1, 3, 3, 4, 1e-10, 10, 0.5)


bessel(1, 5, 3, 35, 20, 1e-10, 10, 0.5)


bessel(5, 8, 95, 5, 30, 1e-10, 100, 0.5)

bessel(5, 8, 95, 1, 300, 1e-10, 100, 0.5)
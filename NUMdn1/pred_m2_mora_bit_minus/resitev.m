function [y,x]=resitev(f,a,b,ya,yb,n)
%y=resitev(f,a,b,ya,yb,n)
%computes the numerical approximation to the solution of the boundary
%value problem 
%y''(x)=f(x)
%y(a)=ya
%y(b)=yb
%n is the number of points on the interval [a,b] and 
%y is the vector of approximations to the solution at these points

%y=resitev(f,a,b,ya,yb,n)
%numericno resi robni problem
%y''(x)=f(x)
%y(a)=ya
%y(b)=yb
%n je stevilo tock na intervalu [a,b] in resitev y je 1xn vektor
%priblizkov resitve v tockah vektorja x

x=linspace(a,b,n);%tocke, kjer racunamo resitev / interval of points
h=x(2)-x(1);%dolzina intervala / length of subinterval
pod=[0;ones(n-3,1)];%elementi pod diagonalo / elements under the diagonal
dia=-2*ones(n-2,1);%elementi na diagonali/ elements on the diagonal
nad=[ones(n-3,1);0];%elementi nad diagonalo/ elements above the diagonal
M=[pod dia nad];%sestavimo matriko sistema v nx3 obliki za funkcijo tridiag / construct the matrix M used in tridiag.m
c=h^2*feval(f,x(2:n-1))';%desno stran sistema racunamo samo v notranjih tocka intervala / right-hand side of the system
c(1)=c(1)-ya;%uporabimo robna pogoja / boundary conditions
c(n-2)=c(n-2)-yb;
y=tridiag(M,c);%resimo sistem / solve the system
y=[ya y' yb];%dodamo vrednosti na robu / add the points on the boundary
function x=tridiag(M,b)
%x=tridiag(M,b)
%solves the three-diagonal system of equations
%Ax=b,
%where the three-diagonal matrix is represented by a nx3
%matrix M, with the elements under the diagonal of A
%are located in the first column, the diagonal is in 
%the second column and the elements above the diagonal are in
%the thrid column. The elements M(1,1)
%and M(n,3) are empty

%x=tridiag(M,b)
%resi tridiagonalni system
%Ax=b,
%kjer je tridiagonalna matrika A predstavljena z nx3
%matriko M, kjer so elementi pod diagonalo matrike A
%v prvem stolpcu, elementi na diagonali v drugem stolpcu
%elementi nad diagonalo pa v tretjem stolpcu. Elementa M(1,1)
%in M(n,3) sta prazna.

n=length(b);%stevilo neznank / number of variables

%Gaussova eliminacij a/ Gaussian elimination
for i=1:n-1
    k=M(i+1,1)/M(i,2);
    M(i+1,2)=M(i+1,2)-k*M(i,3);
    b(i+1)=b(i+1)-k*b(i);
end
x=zeros(n,1);%rezerviramo spomin za resitev / space for the solution

%obratno vstavljanje / backward substitution
x(n)=b(n)/M(n,2);
for i=n-1:-1:1
    x(i)=(b(i)-M(i,3)*x(i+1))/M(i,2);
end
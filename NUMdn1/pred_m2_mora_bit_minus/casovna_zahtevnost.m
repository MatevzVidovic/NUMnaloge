function casovna_zahtevnost(n1,n2,m)
%casovna_zahtevnost(n1,n2,m)
%draws a graph of time needed to solve a three diagonal system
%using tridiag.m compared to the built-in command \
%For dimensions of matrices from n1 to n2 with step m measures
%elapsed time and draws graoh

%casovna_zahtevnost(n1,n2,m)
%narise graf casovne zahtevnosti za resevanje tridiagonalnega
%sistema linearnih enacb s funkcijo tridiag in z vgrajeno metodo \
%Za dimenzije matrik od n1 do n2 s korakom po m izmeri
%cas resevanja in narise graf

dimenzije=n1:m:n2;%dimenzije matrik / matrix dimensions
meritve=zeros(1,length(dimenzije));%rezerviramo spomin za meritve / space for measurements

%najprej izmerimo potrebne case za funkcijo tridiag / measuring elapsed
%time for tridiag.m
for i=1:length(dimenzije)
    dim=dimenzije(i);%trenutna dimenzija sistema / current system size
    pod=[0;ones(dim-1,1)];%elementi pod diagonalo / under the diagonal
    dia=-2*ones(dim,1);%elementi na diagonali / on the diagonal
    nad=[ones(dim-1,1);0];%elementi nad diagonalo / above the diagonal
    M=[pod dia nad];%sestavimo matriko sistema v nx3 obliki za funkcijo tridiag / constructs matrix for tridiag.m
    b=ones(dim,1);%desna stran sistema / right-hand side of system
    tic;%pozenemo stoparico / start stopwatch
    tridiag(M,b);%resimo sistem / solve system
    meritve(i)=toc;%zapomnimo si potreben cas / save elapsed time
end
clf
plot(dimenzije,meritve,'b+');%narisemo graf / draw graph

%izmerimo potrebne case za vgrajeno metodo \ 
%/ measuring elapsed
%time for built-in function \
for i=1:length(dimenzije)
    dim=dimenzije(i);%trenutna dimenzija sistema/ current system size
    A=diag(ones(dim-1,1),-1)-2*diag(ones(dim,1))+diag(ones(dim-1,1),1);%matrika sistema / system matrix
    b=ones(dim,1);%desna stran sistema / right-hand side of system
    tic;%pozenemo stoparico / start stopwatch
    A\b;%resimo sistem / solve system
    meritve(i)=toc;%zapomnimo si potreben cas / save elapsed time
end
hold on
plot(dimenzije,meritve,'r*');%narisemo graf / draw graph
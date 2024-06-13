

% tolGradDesc = 1e-10
tol = 1e-14

a = [2 1 1]

t = 1:5

initialErr = 0.5;
x0 = a(1) + initialErr * randn();
c = a(2) + initialErr * randn();
r = a(3) + initialErr * randn();

x = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t))
%x = 2.^t

% x = 2 ./ (1 + (1)*2.^(-t))
% F = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t))
% x0 = 2, c = 1, pa 2^t bo samo





if true
    
    err = errorMSE(t,x,a)
    
    while err > tol
        a = GNnextA(t, x, a)
        err = errorMSE(t,x,a)
    end
    
end





if false
    lambda = 0.1;

    err = errorMSE(t,x,a);
    
    count = 0;
    while err > tol && count < 20
        a = gradDesc(t, x, a, lambda)
        err = errorMSE(t,x,a)

        count = count + 1;
    end
    
end






% new gradDesc doing it analitically
if false
    lambda = 0.01
    nextA = gradDesc(t, x, a, lambda)

    err = norm(nextA-a)
    
    while err > tolGradDesc
        a = nextA
        nextA = gradDesc(t, x, a, lambda)
        err = norm(nextA-a)
    end
    
    a = nextA

end






% old gradDesc that tried to approx it
if false
    nextA = gradDesc(t, x, a, 2, 0.05)

    err = norm(nextA-a)
    
    while err > tolGradDesc
        a = nextA
        nextA = gradDesc(t, x, a, 1e-1, 0.5)
        err = norm(nextA-a)
    end
    
    a = nextA

end





if false

    err = 1e10
    
    while err > tolGradDesc
        a = gradDesc(t, x, a, 1e-1, 0.5)
    
        x0 = a(1)
        c = a(2)
        r = a(3)
        
        % ne pozabi na drugi korak
        F = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t))
        F = x' - F'
        F = norm(F)
    
        err = F
    end

end









if false
 
    nextA = GNnextA(t, x, a)
    
    err = norm(nextA-a)
    
    while err > tol
        a = nextA
        nextA = GNnextA(t, x, a)
        err = norm(nextA-a)
    end
    
    a = nextA
end


clf
hold on
plot(t,x, 'rx')
axis equal;

x0 = a(1)
c = a(2)
r = a(3)



t=linspace(0,2*pi,100);
f = ((x0 * c) ./ (x0 + (c-x0)*exp(-r*t)));
plot(t, f);
axis equal;

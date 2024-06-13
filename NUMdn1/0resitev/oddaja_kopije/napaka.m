function nap = napaka(M, trenutni_v, c)
% Vrne vrednost ||M*trenutni_v - c|| za tridiagonalni sistem.
% trenutni_v in c naj bosta stolpična vektorja.
    n = length(c);
    zmnozek = zeros(n, 1);
    zmnozek(1) = M(1,2) * trenutni_v(1) + M(1,3) * trenutni_v(2);
    zmnozek(n) = M(n,1) * trenutni_v(n-1) + M(n,2) * trenutni_v(n);
    for i=2:(n-1)
        zmnozek(i) = M(i,1) * trenutni_v(i-1) + M(i,2) * trenutni_v(i) + M(i,3) * trenutni_v(i+1);
    end
    
    diff = zmnozek - c;
    nap = norm(diff);



function v_nov = tridiagJacobiNaslednji(M, v_star, c)
    % Torej:
    % noviV_i = zeros(n, 1)
    % noviV_1 = (c_1 - Z_1 * stariV_2 )/ D_1 % tu se ni tega clena s spodnjetrikotno, ker je se ni. Pac v 0 bi se zmnoszilo.
    % noviV_i = (c_i - Z_i * stariV_(i+1) - S_i * stariV_(i-1) )/ D_i
    % noviV_end = (c_end - S_end * noviV_(end-1) )/ D_end

    % Torej:
    n = length(v_star);
    v_nov = zeros(n, 1);

    v_nov(1) = (c(1) - M(1,3) * v_star(2) )/ M(1,2);
    
    for i=2:n-1
        v_nov(i) = (c(i) - M(i,3) * v_star(i+1) - M(i,1) * v_star(i-1))/ M(i,2);
    end
    % noviV_i = (c_i - Z_i * stariV_(i+1) - S_i * noviV_(i-1) )/ D_i
    
    % noviV_end = (c_end - S_end * noviV_(end-1) )/ D_end
    v_nov(end) = (c(end) - M(end,1) * v_star(n-1))/ M(end,2);
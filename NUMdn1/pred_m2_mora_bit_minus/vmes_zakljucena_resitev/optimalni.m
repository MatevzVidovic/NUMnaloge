function omega=optimalni(n,tol,maxit)
    omega_1 = 1;
    st_iter_1 = bessel_za_optimalni(5, 8, 95, 5, n, tol, maxit, omega_1);

    omega_2 = 2;
    st_iter_2 = bessel_za_optimalni(5, 8, 95, 5, n, tol, maxit, omega_2);

    omega_sred = (omega_2 - omega_1) / 2 + omega_1;
    st_iter_sred = bessel_za_optimalni(5, 8, 95, 5, n, tol, maxit, omega_sred);

    while (omega_2 - omega_1) > 0.01
        if st_iter_sred <= st_iter_2
            omega_2 = omega_sred;
            st_iter_2 = st_iter_sred;
        else
            omega_1 = omega_sred;
            st_iter_1 = st_iter_sred;
        end
        
        omega_sred = (omega_2 - omega_1) / 2 + omega_1;
        st_iter_sred = bessel_za_optimalni(5, 8, 95, 5, n, tol, maxit, omega_sred);
        
        omega = omega_sred;
    end

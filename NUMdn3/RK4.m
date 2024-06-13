function nextXsandVs = RK4(x1, x2, v1, v2, m1, m2, dt)
    
    % Oba objekta premaknemo za polovico eulerja -> za dt/2.
    % Tam za oba dobimo nov a in nov v.
    
    nextXsandVs = zeros(2,4);

    

    r = norm(x2 - x1);

    e1_1 = (x2 - x1) / norm(x2 - x1);
    a1_1 = m2 / r^2 * e1_1;
    x1_1 = x1 + dt/2 * v1;
    v1_1 = v1 + dt/2 * a1_1;
    
    e2_1 = (x1 - x2) / norm(x1 - x2);
    a2_1 = m1 / r^2 * e2_1;
    x2_1 = x2 + dt/2 * v2;
    v2_1 = v2 + dt/2 * a2_1;



    r = norm(x2_1 - x1_1);

    e1_2 = (x2_1 - x1_1) / norm(x2_1 - x1_1);
    a1_2 = m2 / r^2 * e1_2;
    x1_2 = x1_1 + dt/2 * v1_1;
    v1_2 = v1_1 + dt/2 * a1_2;
    
    e2_2 = (x1_1 - x2_1) / norm(x1_1 - x2_1);
    a2_2 = m1 / r^2 * e2_2;
    x2_2 = x2_1 + dt/2 * v2_1;
    v2_2 = v2_1 + dt/2 * a2_2;




    r = norm(x2_2 - x1_2);

    e1_3 = (x2_2 - x1_2) / norm(x2_2 - x1_2);
    a1_3 = m2 / r^2 * e1_3;
    x1_3 = x1_2 + dt/2 * v1_2;
    v1_3 = v1_2 + dt/2 * a1_3;
    
    e2_3 = (x1_2 - x2_2) / norm(x1_2 - x2_2);
    a2_3 = m1 / r^2 * e2_3;
    x2_3 = x2_2 + dt * v2_2;
    v2_3 = v2_2 + dt * a2_3;


    
    
    r = norm(x2_3 - x1_3);
    e1_4 = (x2_3 - x1_3) / norm(x2_3 - x1_3);
    a1_4 = m2 / r^2 * e1_4;
    %x1_4 = x1_3 + dt * v1_3;
    %v1_4 = v1_3 + dt * a1_4;
    
    e2_4 = (x1_3 - x2_3) / norm(x1_3 - x2_3);
    a2_4 = m1 / r^2 * e2_4;
    %x2_4 = x2_3 + dt * v2_3;
    %v2_4 = v2_3 + dt * a2_4;


    x1Next = x1 + dt * (1/6 * v1 + 1/3 * v1_1 + 1/3 * v1_2 + 1/6 * v1_3);
    v1Next = v1 + dt * (1/6 * a1_1 + 1/3 * a1_2 + 1/3 * a1_3 + 1/6 * a1_4);

    x2Next = x2 + dt * (1/6 * v2 + 1/3 * v2_1 + 1/3 * v2_2 + 1/6 * v2_3);
    v2Next = v2 + dt * (1/6 * a2_1 + 1/3 * a2_2 + 1/3 * a2_3 + 1/6 * a2_4);

    
    nextXsandVs(:,1) = x1Next;
    nextXsandVs(:,2) = x2Next;

    nextXsandVs(:,3) = v1Next;
    nextXsandVs(:,4) = v2Next;
    


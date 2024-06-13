
if false
    x1 = [-1; -1];
    x2 = [1; 1];
    m1 = 1;
    m2 = 1;
    r = norm(x2);
    v1 = [1; -1];
    v1 = v1 * (1/norm(v1)) * (1/(2*sqrt(r)));
    v2 = [-1; 1];
    v2 = v2 * (1/norm(v2)) * (1/(2*sqrt(r)));
    gravitacija(m1, m2, x1, x2, v1, v2, 20, 0.0001, "euler")
end



if false
    x1 = [0; 0];
    x2 = [1; 1];
    m1 = 100;
    m2 = 1;
    r = norm(x2);
    v1 = [0; 0];
    %v1 = v1 * (1/norm(v1)) * (1/(2*sqrt(r)));
    v2 = [-1; 1];
    v2 = v2 * (1/norm(v2)) * (sqrt(m1/r));
    gravitacija(m1, m2, x1, x2, v1, v2, 10, 0.0001, "euler")
end









if false
    x1 = [-1; -1];
    x2 = [1; 1];
    m1 = 1;
    m2 = 1;
    r = norm(x2);
    v1 = [1; -1];
    v1 = v1 * (1/norm(v1)) * (1/(2*sqrt(r)));
    v2 = [-1; 1];
    v2 = v2 * (1/norm(v2)) * (1/(2*sqrt(r)));
    gravitacija(m1, m2, x1, x2, v1, v2, 20, 0.0001, "RK4")
end



if true
    x1 = [0; 0];
    x2 = [1; 1];
    m1 = 100;
    m2 = 1;
    r = norm(x2);
    v1 = [0; 0];
    %v1 = v1 * (1/norm(v1)) * (1/(2*sqrt(r)));
    v2 = [-1; 1];
    v2 = v2 * (1/norm(v2)) * (sqrt(m1/r));
    gravitacija(m1, m2, x1, x2, v1, v2, 10, 0.0001, "RK4")
end

function nextXandV = euler(m2, x1, x2, v1, dt)
    % Parameter namin is for first object.
    % Make it vice versa for the second object of course.

    nextXandV = zeros(2,2);

    r = norm(x2 - x1);

    e = (x2 - x1) / norm(x2 - x1);
    a = m2 / r^2 * e;
    x = x1 + dt * v1;
    v = v1 + dt * a;
    
    nextXandV(:,1) = x;
    nextXandV(:,2) = v;

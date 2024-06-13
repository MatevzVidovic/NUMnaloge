function nextA = TryGradDesc(t, x, a, aproxDist, lambda)
    
    x0 = a(1)
    c = a(2)
    r = a(3)

      
    
    % ne pozabi na drugi korak
    F = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t))
    F = x' - F'
    F = norm(F)

    % we will aproximate derivatives as the average of adding or
    % subtracting the aproxDist
    gradF = zeros(1, length(a))
    for i = 1:length(a)
        i
        b = a;
        b(i) = b(i) + aproxDist

        x0 = b(1);
        c = b(2);
        r = b(3);

        % ne pozabi na drugi korak
        F1 = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t));
        F1 = x' - F1'
        F1 = norm(F1)

        b = a;
        b(i) = b(i) - aproxDist

        x0 = b(1);
        c = b(2);
        r = b(3);

        % ne pozabi na drugi korak
        F2 = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t));
        F2 = x' - F2'
        F2 = norm(F2)
        
        F1diff = F1 - F
        F2diff = F - F2
        differential = (F1diff + F2diff) / 2
        gradF(i) = differential / aproxDist
    

    end

    
    % the magic of the gradient. The - is necessary so that we are going
    % down
    nextA = a - lambda * gradF
    


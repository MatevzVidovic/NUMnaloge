
function nextA = GNnextA(t, x, a)
    
    x0 = a(1);
    c = a(2);
    r = a(3);
    
    
    % ne pozabi na drugi korak
    F = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t));
    F = x' - F';

    % d/dx ((x * c) / (x + (c-x)*exp(-r*t)))

    % J1 = - ( (c * (x0 + (c-x0)*(exp(-r*t))) ) - (x0*c*(1-exp(-r*t)))    ) ./ (   (x0 + (c-x0)*exp(-r*t) ) .^2 )
    % J2 = - ( (x0 * (x0 + (c-x0)*(exp(-r*t))) ) - (x0*c*(exp(-r*t)))    ) ./ (   (x0 + (c-x0)*exp(-r*t) ) .^2 )
    % J3 = - ( - (x0*c*(c-x0)*(-t)*(exp(-r*t)))    )  ./ (   (x0 + (c-x0)*exp(-r*t) ) .^2 )

    Jx =   - (c*c*(exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    Jc =   - (x0*x0*(1-exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    Jr =   - (c*x0*(c-x0)*(t.*exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    
    J = [Jx' Jc' Jr'];

    diff = J\F;
    diff = diff'

    nextA = a - diff;
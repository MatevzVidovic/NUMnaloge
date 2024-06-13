function nextA = gradDesc(t, x, a, lambda)
% Ustvarimo novo funkcijo, ki je sestevek kvadratov komponentnih funkcij.
% To odvajamo, da dobimo gradient.
% Torej sestevek oblike: (x1 - f(t1,a))^2 + (x2 - f(t1,a))^2 + ...
% Odvod po c je npr samo seštevek od: 2 * funkc * Jc    (j1 kot smo ga
% izracunali v GNnextA)
% S tem da funkc je ta (0 - f(t,a)) Torej ta minus je baked v funkcijo, kot
% smo napisali tudi v GNnextA
    
    x0 = a(1);
    c = a(2);
    r = a(3);

    % ne pozabi na drugi korak
    F = (x0 * c) ./ (x0 + (c-x0)*exp(-r*t));
    F = x' - F';

    % d/dx ((x * c) / (x + (c-x)*exp(-r*t)))

    Jx =   - (c*c*(exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    Jc =   - (x0*x0*(1-exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    Jr =   - (c*x0*(c-x0)*(t.*exp(-r*t)))   ./ ( (x0 + (c-x0)*exp(-r*t) ) .^2 );
    
    %J = [Jx' Jc' Jr'];
    
    derX = 2 * F .* Jx;
    derC = 2 * F .* Jc;
    derR = 2 * F .* Jr;

    gradG = [sum(derX, "all") sum(derC, "all") sum(derR, "all")];

    
    nextA = a - lambda * gradG;







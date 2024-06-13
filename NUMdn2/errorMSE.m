function err = errorMSE(t, x, a)
    x0 = a(1);
    c = a(2);
    r = a(3);

    f = ((x0 * c) ./ (x0 + (c-x0)*exp(-r*t)));

    err = sum(((f - x).^2)/length(t), "all");
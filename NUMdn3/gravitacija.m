function gravitacija(m1, m2, x1, x2, v1, v2, maxT, dt, method)
    % x in v sta 2D stolpčna vektorja. To je 2D simulacija.
    % G bo kar 1

    % Potek: - izracun a1 
    % - izracun v1next iz a1 
    % - izracun x1next iz v1 
    % - isto za drugo telo
    % - izracun tezisca (naredi svojo funkcijo)
    % - vektorji pozicij na grafu glede na tezisce. Shrani v neko matriko 
    % - na koncu samo plot te matrike
    
    numOfSteps = floor(maxT / dt);
    X = zeros(4, numOfSteps);
    
    for i = 1:numOfSteps
        
        tez = (m1 * x1 + m2 * x2) / (m1 + m2);
        poz1 = x1 - tez;
        poz2 = x2 - tez;
        X(1:2, i) = poz1;
        X(3:4, i) = poz2;

        
        if method == "euler"
            firstObjNextXandV = euler(m2, x1, x2, v1, dt);
            secondObjNextXandV = euler(m1, x2, x1, v2, dt);

            x1 = firstObjNextXandV(:,1);
            v1 = firstObjNextXandV(:,2);

            x2 = secondObjNextXandV(:,1);
            v2 = secondObjNextXandV(:,2);
        end

        if method == "RK4"
            nextXsandVs = RK4(x1,x2,v1,v2,m1,m2,dt);

            x1 = nextXsandVs(:,1);
            v1 = nextXsandVs(:,3);

            x2 = nextXsandVs(:,2);
            v2 = nextXsandVs(:,4);
        end

    end

    plot(X(1,:), X(2,:), Color="b")
    hold on;
    plot(X(3,:), X(4,:), Color="r")
    axis equal;

    














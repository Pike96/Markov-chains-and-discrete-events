clear;

Tt = 0;
Ts = 0;
i = 0;
lambda = 20;
t = 0;
s = 0;

while Ts <= 100
    t = s;
    while 1
        t = t - log(rand)/lambda;
        if mod(t,10) < 5
            lambda_t = mod(t,10)*3 + 4;
        else
            lambda_t = mod(t,10)*(-3) + 34;
        end
        if rand <= lambda_t/lambda
            Ts = t;
            s = Ts;
            break;
        end
    end
    i = i+1;
    Tt(i) = Ts;
end

t = 0;      % current time
tA = Tt(1);
tD = inf;
tb = 0;     % one break
tbtotal = 0;    % total break time
n = 0;      % numbers in queue
i = 0;

while tA<100
    if tA <= tD
        t = tA;
        i = i+1;
        tA = Tt(i);
        n = n+1;
        if n == 1
            tD = t+exprnd(1/25);
        end
    else
        t = tD;
        n = n-1;
        if n == 0
            tbc = 0;    % accumulated continuous break time
            while t + tbc < tA
                tb = 0.3*rand;
                tbtotal = tbtotal + tb;
                tbc = tbc + tb;
            end
            tD = inf;
        else
            tD = t+exprnd(1/25);
        end
    end
end

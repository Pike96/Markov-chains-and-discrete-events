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

ta = inf;
td = inf;


clear;

Tt = 0;     % arrival time sequence
Ts = 0;     % time of 1st arrival after s
i = 0;
lambda = 20;    % customized lambda constant
s = 0;      % time past

% Generate arrival time sequence
while Ts <= 100
    t = s;
    while 1
        t = t - log(rand)/lambda;
        % Generate lambda_t using modulo
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
            tD = t+exprnd(1/25);    % Exp distri. with rate 25
        end
    else    % tA > tD
        t = tD;
        n = n-1;
        if n == 0
            % Break time
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

disp(['The expected total break time in 100 hrs is: ',num2str(tbtotal)]);

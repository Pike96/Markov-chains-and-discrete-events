function [m1,m2,mp,elow,ehigh]= Q2b_func(p,k)
% m1: mean buffer packets at input 1
% m2: mean buffer packets at input 2
% mp: mean packets processed per time slot
% elow: lower bound of efficiency confidence interval
% ehigh: higher bound of efficiency confidence interval

% p: probability that packets arrives in a time slot
% k: number of time slots

n1=0;   % number of packets in buffer of input 1 per time slot
n2=0;   % number of packets in buffer of input 2 per time slot

for i=1:k;
    processed = 0;
    if rand<p   % p1
        n1 = n1+1;
    end
    if rand<p   % p2
        n2 = n2+1;
    end
    if rand<0.75     % x1
        if rand<0.75     % 11
            if rand<0.5     % select either input
                if n1>0
                    n1 = n1-1;
                    processed = processed+1;
                end
            else
                if n2>0
                    n2 = n2-1;
                    processed = processed+1;
                end
            end
        else                % 21
            if n1>0 && n2>0
                n1 = n1-1;
                n2 = n2-1;
                processed = processed+2;
            end
        end
    else                % x2
        if rand<0.25     % 22
            if rand<0.5     % select either input
                if n1>0
                    n1 = n1-1;
                    processed = processed+1;
                end
            else
                if n2>0
                    n2 = n2-1;
                    processed = processed+1;
                end
            end
        else                % 12
            if n1>0 && n2>0
                n1 = n1-1;
                n2 = n2-1;
                processed = processed+2;
            end
        end
    end
    buffer1(i) = n1;    % buffer sequence at input 1 of all time slots
    buffer2(i) = n2;    % buffer sequence at input 2 of all time slots
    pr(i) = processed;  % processed packets sequence of all time slots
    eff(i) = pr(i)/2;   % efficiency of all time slots
end

m1=mean(buffer1);
m2=mean(buffer2);
mp=sum(pr)/k;

% Calculated 95% efficiency confidence interval [elow ehighs]
SEM = std(eff)/sqrt(length(eff));
ts = tinv([0.025  0.975],length(eff)-1);
CI = mean(eff) + ts*SEM;
elow = CI(1);
ehigh = CI(2);

function [m1,m2,mp,elow,ehigh]= Q2b_func(p,k)

n1=0;
n2=0;

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
            if rand<0.5     % select 1 input
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
            if rand<0.5     % select 1 input
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
    buffer1(i) = n1;
    buffer2(i) = n2;
    pr(i) = processed;
    eff(i) = pr(i)/2; 
end

m1=mean(buffer1);
m2=mean(buffer2);
mp=sum(pr)/k;

SEM = std(eff)/sqrt(length(eff));
ts = tinv([0.025  0.975],length(eff)-1);
CI = mean(eff) + ts*SEM;
elow = CI(1);
ehigh = CI(2);
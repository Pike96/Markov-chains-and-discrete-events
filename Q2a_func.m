function [m1,m2,mp]= Q2a_func(p,k)

n1=0;
n2=0;
processed = 0;

for i=1:k;
    if rand<p   % p1
        n1 = n1+1;
    end
    if rand<p   % p2
        n2 = n2+1;
    end
    if rand<0.5     % if different
        if n1>0 && n2>0
            n1 = n1-1;
            n2 = n2-1;
            processed = processed+2;
        end
    else                % if same
        if rand<0.5
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
    end
    buffer1(i) = n1;
    buffer2(i) = n2;
end

m1=mean(buffer1);
m2=mean(buffer2);
mp=processed/(2*k);
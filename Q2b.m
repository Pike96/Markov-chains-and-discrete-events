clear;

k=2e4;  % number of time slots
i=0;

for p=0:0.01:1
    i = i+1;
    [m1(i), m2(i), mp(i),elow(i),ehigh(i)] = Q2b_func(p,k);
end

figure(1)
plot(0:0.01:1,m1)
hold on
plot(0:0.01:1,m2)
legend('Input 1','Input 2','Location','northwest');
xlabel('p')
ylabel('Mean buffer packets')
title(['Mean buffer packets at input 1 & 2 with ',...
    num2str(k),' time slots']);

figure(2)
plot(0:0.01:1,mp)
xlabel('p')
ylabel('Mean packets processed per time slot')
title(['Mean packets processed per time slot with ',...
    num2str(k),' time slots']);

figure(3)
plot(0:0.01:1,elow)
hold on
plot(0:0.01:1,ehigh)
legend('Lower bound','Higher bound','Location','northwest');
xlabel('p')
ylabel('Efficiency confidence interval')
title(['Efficiency confidence interval with ',...
    num2str(k),' time slots']);

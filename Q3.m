% Program to simulate a Markov chain
% The program assumes that the states are labeled 1, 2, ...

 clear all; close all; clc;
 
 N = 100;          % number of individuals
 k = 200;           % xk(t)=1, other are zeros
 input=[zeros(1,k) 1 zeros(1,2*N-k)];	% initial distribution, kth is 1
 
% transition matrix
 P=zeros(2*N+1,2*N+1); 
 for i = 1:2*N+1
     for j = 1:2*N+1
         P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
     end
     
 end
n=100;           % number of time steps to take
output=zeros(n+1,2*N+1); % clear out any old values
t=0:n;          % time indices

output(1,:)=input; % generate first output value 

i = 0;
for i=1:n,
  output(i+1,:) = output(i,:)*P;
end

scatter(1:2*N+1,output(n+1,:),'filled')
set(gca,'XLim',[1 2*N+1])
title(['State after n times with k=',num2str(k)])
ylabel('Probability')
xlabel('number of copies of A1 plus 1')

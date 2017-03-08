% Program to simulate a Markov chain
% The program assumes that the states are labeled 1, 2, ...

% Below is a sample, which you can change them according to the project
 clear all; close all; clc; 
 input=[0 0 0 1 0 0 0];     % initial distribution
 N = 3;          % number of individuals
 
% transition matrix
 P=zeros(2*N+1,2*N+1); 
 for i = 1:2*N+1
     for j = 1:2*N+1
         P(i,j) = nchoosek(2*N,j-1)*((i-1)/(2*N))^(j-1)*(1-(i-1)/(2*N))^(2*N-j+1);
     end
     
 end
n=200;           % number of time steps to take
output=zeros(n+1,2*N+1); % clear out any old values
t=0:n;          % time indices

output(1,:)=input; % generate first output value 

i = 0;
for i=1:n,
  output(i+1,:) = output(i,:)*P;
  %a tolerance check to  automatically stop the simulation when the density is close to its steady-state
  LIT = ismembertol(output(i+1,:),output(i,:));
  if all(LIT == 1)     
      break;
  end
end
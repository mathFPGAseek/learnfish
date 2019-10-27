%% ------------------------------------------------------------------------
% filename: monteCarloPrediction.m
% rbd 10/14/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
% Description: Following the Pseudo code from 
% Suttons book: Reinforcement Learning 2nd Edition, page 92
% So, this file will for N policies:
% 1. Build tables 
% 2. Genrate an episode
% 3. Calculate Value
%% ------------------------------------------------------------------------

%------------------------------------------------------------------------
%% Polciies
% Policy A1:
% Adjust weight for all sensors and all classes independently only on
% average, with a nominal value.
% Policy A2:
% Adjust weight for all sensors and all classes independently only on
% average agressively.
% Policy B1:
% Adjust weight for all sensors and all classes independently on average 
% and on variance.
% Policy B2:
% Adjust weight for all sensors and all classes independently on average 
% and on variance agressively.
% Policy C1:
% Adjust weight for sensor that has the best average
% Policy C2:
% Adjust weight for sensor that has the best average agressively.
% Policy D1:
% Adjust weight for sensor that has the best average and variance
% Policy D2:
% Adjust weight for sensor that has the best average and variance aggresively
%------------------------------------------------------------------------

%------------------------------------------------------------------------
% Initialize V(s) element of R for all s element of S.
% Returns(s) <- an empty list
% Loop forever( for each episode)
%   Generate an episode following a policy above:
%   S0( experiment), A0( based on policy), R1, ...ST-1(terminal experiment),
%   AT-1(based on policy), RT
%   G <- 0
%   Loop for each step of episode, t = T-1,T-2, ... 0
%      G <-- gamma*G + Rt+1
%      Unless St appears in S0,S1, ...,St-1
%         Append G to Return(St)
%         V(St) <- average(Returns(St))
%
%------------------------------------------------------------------------
% parameters: 
Policies = 8;
classes  = 6;
% load data
load('USDA_Data_Redsnapper.mat')

debug = 0;
% Build tables
tic
build_tables;
toc

% Generate data to see an example of time
tic 
generate_monte_carlo_samples;
toc

debug = 0;
% Run an experiment as an example of time
tic
runExperiments;
toc

debug = 0;

% Init for all policies
% An (8- Policies) x (6-classes) matrix
V = zeros(Policies,classes); % Value to be used with calculation
Vtot = zeros(Policies,classes); % Total value for state
R = zeros(Policies,classes); % Return

% Later!!! We will make multiple episodes

%------------------------
% Run Policy A
%------------------------
% Input Policy A
% Policy A is just final avgs for each sensor/classifier 
% Make this possibly a function later
tic 
buildAllDecisionAppliedPolicyMatrix;
toc

tic
calculateRewards
toc

% Update Vtot
debug = 0;
% generate new episode up to N episodes!











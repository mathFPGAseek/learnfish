%% ------------------------------------------------------------------------
% filename: monteCarloPredictionB1.m
% rbd 11/2/19
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
% No Adjustment weight for all sensors and all classes independently only
% use average, with a nominal value.
% Policy B1:
% Adjust weight for sensor that has the best average
% Policy B2:
% Adjust weight for sensor that has the best average agressively.
% Policy C1:
% Adjust weight for sensor that has the best average and variance
% Policy C2:
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
%      Append G to Return(St)
%      V(St) <- average(Returns(St))
%------------------------------------------------------------------------

Policy = 2;

%% Init for all policies
% An (8- Policies) x (6-classes) matrix
V  = zeros(Policies,classes); % Value to be used with calculation
R  = zeros(Policies,classes); % Return

%% Loop for N episodes
for Loop = 1 : episodes
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

    %------------------------
    % Run Policy A1
    %------------------------
    policyA = [ 1 1 1 1 1 1]; % Policy A not realted to classifier A!
    AvgOnlyFlag = 1;

    tic 
    buildAllDecisionAppliedPolicyMatrix;
    toc

    tic
    calculateRewards
    toc
    
    debug = 0;
    
    % Update Value for Episode
    VT(:,:,Loop) = V;
    
    debug = 0;

end
debug = 0;












%%---------------------------------------------------------
% Readme.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
% Decription: Overview of Matlab project
%%---------------------------------------------------------
disp('Readme First')

% Evaluate one Policy with atleast 10 episodes for Value
% See Sutton "REinforcement Learning: An Introduction",2nd Edition
% page 92, chapter 5; every visit MC prediction(Policy evaluation)
% Init()--> R(Policy,State), V(policy,State)
% ---N episodes
%       genMC().....101 sec
%       runExp()....1 sec
%       Set: Input: Policy[Fixed], AvgFlag= Fixed
%       AppliedPolicy()---> AppliedPolicyMatrix.......23 sec
%       Set: Input: PolicyX
%       calcResults()-->V(Policy,fishState), R(Policy,State)...1.5 sec      
%       Update one episode -->V(Episode,FixedPolicy,fishState)
%  Evaluate each sensor with atleast 10 episodes for sensitivity
%  Evaluate one Policy with atleast 10 episodes for sensitivity
%
% Instructions to run learnfish
% 1. Run initSystem
% 2. Run monteCarloPredictionpolicyA1
% 3. Run updateValuePolicyA
% 4. Run monteCarloPredictionpolicyB1
% 5. Run updateValuePolicyB
% 6. Run learnFishSolo
% 6. Run plotResults( solo sensors)
% 7. Run learnFishFusion



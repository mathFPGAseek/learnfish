%%---------------------------------------------------------
% Readme.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
% Decription: Overview of Matlab project
%%---------------------------------------------------------
disp('Readme First')

%--1. Evaluate one Policy with atleast 10 episodes for Value
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

%--2. Evaluate each sensor with atleast 10 episodes for sensitivity

%--3. Evaluate one Policy with atleast 10 episodes for sensitivity



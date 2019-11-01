%% ------------------------------------------------------------------------
% filename: initSystem.m
% rbd 11/11/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%
%% ------------------------------------------------------------------------

% parameters:
episodes = 10;
Policies = 5;
classes  = 6;

% For calc rewards
TotalSamplesLearnFish = 1500; % Parametrize or make part of a funciton later!
%TotalNumClasses = 6;
gamma = .9; % discount rate

% load data
load('USDA_Data_Redsnapper.mat')

%% Init for all policies
% An (8- Policies) x (6-classes) matrix
VT = zeros(Policies,classes,episodes);
V  = zeros(Policies,classes); % Value to be used with calculation
R  = zeros(Policies,classes); % Return

% Build tables
tic
build_tables;
toc
%% ------------------------------------------------------------------------
% filename: initSystem.m
% rbd 11/11/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%
%% ------------------------------------------------------------------------

% parameters:
episodes = 10;
Policies = 5; % { A1-nominal, B1-Best Avg, C1-Best Avg(Aggresive),
              %   D1-Best Variance , E1- Best Variance(Aggresive)}
classes  = 6; % {Blue Tilapia,Malabar Snapper,Red Snapper,...
              % Summer Flounder, Vermillion Snapper,White Bass}
sensors  = 4; % {Fluor,Raman, SWIR, Vis}

% For calc rewards
TotalSamplesLearnFish = 0; % Parametrize or make part of a funciton later!
TrainSize = 50;
%TotalNumClasses = 6;
gamma = .9; % discount rate

% load data
load('USDA_Data_Redsnapper.mat')

%% Init for all policies
% An (8- Policies) x (6-classes) matrix
VF = zeros(Policies,classes,episodes);
VT = zeros(Policies,classes,episodes);
V  = zeros(Policies,classes); % Value to be used with calculation
R  = zeros(Policies,classes); % Return

% Build tables
tic
build_tables;
toc
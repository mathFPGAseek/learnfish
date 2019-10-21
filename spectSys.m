%%---------------------------------------------------------
% filename:SpectSys.m
% rbd 10/20/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------
% Load data
load('USDA_Data_Redsnapper.mat')

%Build decision tables
decision_fluor_fusion;
decision_raman_fusion;
decision_swir_fusion;
decision_vis_fusion;

% Generate Monte Carlo Samples
fishParser;
BuildSamplesForMC;
debug = 0;

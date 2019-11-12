%% ------------------------------------------------------------------------
% filename: notes.m
% rbd 11/12/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
% Description: Determine specificity with best Policy
%% ------------------------------------------------------------------------
% When TrainSize = 50; We get very poor results in all fish except
% redsnapper( 90% average) and malabar snapper(70% average)
% Our total misses are for Trainsize* episodes ( 50*10) = 500
% we get : [ 500,1,0,500,500,500]
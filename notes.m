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
% When TrainSize = 150;BT 70%; SF 80%; VS %80; WB 50%
% redsnapper( 90% average) and malabar snapper(90% average)
% Our total misses are for Trainsize* episodes ( 50*10) = 500
% we get : [ 0,0,0,1500,0,0]
%  When TrainSize = 200; 
% 60,90,90,90,60,60%
%  we get : [ 0,0,0,0,0,0]
%  When TrainSize = 175; 
% 60,90,90,80,30,50%
%  we get : [ 0,0,0,0,0,0]
function[AppliedPolicyMatrix] = buildDecisionAppliedPolicyMatrix(ExpData,...
                                ClassifierFinalAAvg,ClassifierFinalAVar,Policy,...
                                AvgOnlyFlag)
                                 
%% ------------------------------------------------------------------------
% filename: buildDecisionAppliedPolicyMatrix.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
debug = 0;

[decisionMatrix] = buildDecisionMatrix(ExpData); % Type simple Class

sampleCount = size(ExpData);
sampleCount = sampleCount(1);

debug = 0;

% Apply Policy A 
% Pass -thru ; No adjustment
if AvgOnlyFlag == 1
  SpectClassifierFinalAAvgResults = ClassifierFinalAAvg .* Policy;
else
  SpectClassifierFinalAAvgResultsTemp =  ClassifierFinalAAvg .* Policy;
  SpectClassifierFinalAAvgResults     =  SpectClassifierFinalAAvgResultsTemp - ...
                                         ClassifierFinalAVar; 
end

% Construct w/ Policy Applied
concatAppliedPolicyArray  = SimpleValue.empty(1,0); % Type simple Class
for i = 1 : sampleCount
    fishVectorIndex = decisionMatrix(i);
    fishVectorValue = fishVectorIndex.Value;
    fishCompensate  = fishVectorValue.*SpectClassifierFinalAAvgResults;
    debug = 0;
    
    debug = 0;
    concatAppliedPolicyArray = [concatAppliedPolicyArray,fishCompensate];
    debug = 0;
end

AppliedPolicyMatrix = concatAppliedPolicyArray;
debug = 0;

    
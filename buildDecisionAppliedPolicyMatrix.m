function[AppliedPolicyMatrix] = buildDecisionAppliedPolicyMatrix(ExpData,...
                                ClassifierFinalAAvg,ClassifierFinalAVar,Policy)
                                 
%% ------------------------------------------------------------------------
% filename: buildDecisionAppliedPolicyMatrix.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
debug = 0;

[decisionMatrix] = buildDecisionMatrix(ExpData); % Type simple Class

debug = 0;

% Apply Policy A 
% Pass -thru ; No adjustment
SpectClassifierFinalAAvgResults = ClassifierFinalAAvg .* Policy;

% Construct w/ Policy Applied
concatAppliedPolicyArray  = SimpleValue.empty(1,0); % Type simple Class
for i = 1 : 1500
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

    
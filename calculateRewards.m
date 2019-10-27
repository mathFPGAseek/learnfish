%% ------------------------------------------------------------------------
% filename: calculateRewards.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
TotalSamplesLearnFish = 1500; % Parametrize or make part of a funciton later!
%TotalNumClasses = 6;
gamma = .9; % discount rate
Policy = 1;

AccumLearnArray = SimpleValue.empty(1,0);

% Construct Row Summation from all sensors/classifiers
for i = 1: TotalSamplesLearnFish
    
    rowLearnFluorA = AppliedPolicyMatrixFluorA(i); 
    rowLearnFluorAvalue = rowLearnFluorA.Value;
    
    rowLearnFluorB = AppliedPolicyMatrixFluorB(i); 
    rowLearnFluorBvalue = rowLearnFluorB.Value;
    
    rowLearnRamanA = AppliedPolicyMatrixRamanA(i); 
    rowLearnRamanAvalue = rowLearnRamanA.Value;
    
    rowLearnRamanB = AppliedPolicyMatrixRamanB(i); 
    rowLearnRamanBvalue = rowLearnRamanB.Value;
    
    rowLearnSWIRA = AppliedPolicyMatrixSWIRA(i); 
    rowLearnSWIRAvalue = rowLearnSWIRA.Value;

    rowLearnSWIRB = AppliedPolicyMatrixSWIRB(i); 
    rowLearnSWIRBvalue = rowLearnSWIRB.Value;
    
    rowLearnVisA = AppliedPolicyMatrixVisA(i); 
    rowLearnVisAvalue = rowLearnVisA.Value;
    
    rowLearnVisB = AppliedPolicyMatrixVisB(i); 
    rowLearnVisBvalue = rowLearnVisB.Value;
    
    AccumLearnrow = rowLearnFluorAvalue + rowLearnFluorBvalue + ...
                      rowLearnRamanAvalue + rowLearnRamanBvalue + ...
                      rowLearnSWIRAvalue + rowLearnSWIRBvalue + ...
                      rowLearnVisAvalue + rowLearnVisBvalue;
                  
    AccumLearnArray = [ AccumLearnArray,AccumLearnrow];
    
    debug = 0;
    
end

debug = 0;
% Hand out rewards to all rows that chose correctly. knowing the structure
% of our array.
stateSteps = TotalSamplesLearnFish/classes;
lowerIndex = 1;
upperIndex = min; % This we get from how much data we have of each fish
fishState = 0;
gain = 0;
count = 0;
misses = zeros(1,classes);
for fishState = 1 : classes 
    for j = lowerIndex : upperIndex
        count = count + 1; % Use to average values for state
        rowValue = AccumLearnArray(j);
        accumValue = rowValue.Value; % Simple Value class
        [M I] = max(accumValue);
        if ( I ~= fishState)
            reward = -1;
            misses(fishState) = misses(fishState) + 1;
        else
            reward = 1;
        end 
        gain = gamma*gain + reward;
        R(Policy,fishState) = R(Policy,fishState) + gain;
        V(Policy,fishState) = R(Policy,fishState)/(count);
    end
    lowerIndex = upperIndex + 1;
    upperIndex = min*(fishState+1);
    count = 0;
    gain = 0;
end

debug = 0;






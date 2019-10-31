%% ------------------------------------------------------------------------
% filename: calculateRewards.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
%TotalSamplesLearnFish = 1500; % Parametrize or make part of a funciton later!
%TotalNumClasses = 6;
%gamma = .9; % discount rate
%Policy = 1;

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
upperIndex = minSampleMeas; % This we get from how much data we have of each fish
fishState = 0;
gain = 0;
count = 0;
extraReward  = 0;
nonZeroElement = 0;
totalReward = 0;
misses = zeros(1,classes);
V  = zeros(Policies,classes); % Value to be used with calculation
R  = zeros(Policies,classes); % Return
for fishState = 1 : classes 
    for j = lowerIndex : upperIndex
        count = count + 1; % Use to average values for state
        rowValue = AccumLearnArray(j);
        accumValue = rowValue.Value; % Simple Value class
        [M I] = max(accumValue);
        if ( I ~= fishState)
            reward = -1; % penalty for mismatch
            misses(fishState) = misses(fishState) + 1;
        else
            reward = 1; % reward for match
            anyNonZero = all(accumValue,1);
            for k = 1 : classes
                if ( anyNonZero(k)== true)
                    if k == I
                        doNothing = 0;
                    else
                        nonZeroElement  = nonZeroElement +1;
                    end
                end
            end
            if nonZeroElement >= 1
                extraReward = 0;
            else
                extraReward = 1;
            end
              
        end 
        
        totalReward = reward + extraReward;
        extraReward = 0;
        nonZeroElement = 0;
        gain = gamma*gain + totalReward;
        R(Policy,fishState) = R(Policy,fishState) + gain;
        V(Policy,fishState) = R(Policy,fishState)/(count);
    end
    lowerIndex = upperIndex + 1;
    upperIndex = minSampleMeas*(fishState+1);
    count = 0;
    gain = 0;
    debug = 0;
end

debug = 0;






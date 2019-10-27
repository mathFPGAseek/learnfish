%% ------------------------------------------------------------------------
% filename: calculateRewards.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
TotalSamplesLearnFish = 1500; % Parametrize or make part of a funciton later!
%TotalNumClasses = 6;

AccumLearnArray = SimpleValue.empty(1,0);

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
%% ------------------------------------------------------------------------
% filename: adjustPolicy.m
% rbd 11/5/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
% Description: Adjust Policy per fish for best determined value

%% ------------------------------------------------------------------------
% Average Policy values
adjPolicy = zeros(Policies,classes);
accumTemp = 0;
accum = 0;
for i = 1 : Policies
    for j = 1 : classes
        for k = 1 : episodes
             accumTemp =   VF(i,j,k);
             accum = accum + accumTemp;
        end
        debug = 0;
        adjPolicy(i,j) = accum/episodes;
        accumTemp = 0;
        accum = 0;
    end
end
debug = 0;
% Pick the highest average value per fish
[maxValue,index] = max(adjPolicy);

% Note: We have only two Policies at the moment, so this will have to be
% re-written to accomadate more Polciies
for i = 1 : classes
    if index(i) == 2
        fluorPolicyA(1,i)  = fluorClassAPolicyB1(1,i);
        fluorPolicyB(1,i)  = fluorClassBPolicyB1(1,i);
        ramanPolicyA(1,i)  = ramanClassAPolicyB1(1,i);
        ramanPolicyB(1,i)  = ramanClassBPolicyB1(1,i);
        SWIRPolicyA(1,i)   = SWIRClassAPolicyB1(1,i);
        SWIRPolicyB(1,i)   = SWIRClassBPolicyB1(1,i);
        VisPolicyA(1,i)    = VisClassAPolicyB1(1,i);
        VisPolicyB(1,i)    = VisClassBPolicyB1(1,i); 
    else
        fluorPolicyA(1,i) = 1;
        fluorPolicyB(1,i)  = 1;
        ramanPolicyA(1,i)  = 1;
        ramanPolicyB(1,i)  = 1;
        SWIRPolicyA(1,i)   = 1;
        SWIRPolicyB(1,i)   = 1;
        VisPolicyA(1,i)    = 1;
        VisPolicyB(1,i)    = 1; 
    end
end

debug = 0;



             
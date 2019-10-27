%% ------------------------------------------------------------------------
% filename: buildDecisionMatrix.m
% rbd 10/26/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------
function [decisionMatrix] = buildDecisionMatrix(Samples)

sampleCount = size(Samples);
sampleCount = sampleCount(1);

concatArray  = SimpleValue.empty(1,0);

for i = 1 : sampleCount
    
    charDNA = char(Samples(i));
% use case statement
        switch charDNA
            case 'Blue_Tilapia'
                j = 1;
                profileVector = [ 1 0 0 0 0 0];
            case 'Malabar_Snapper'
                j = 2;
                profileVector = [ 0 1 0 0 0 0];
            case 'Red_Snapper'
                j = 3;
                profileVector = [ 0 0 1 0 0 0];
            case 'Summer_flounder'
                j = 4;
                profileVector = [ 0 0 0 1 0 0];
            case 'Summer_Flounder'
                j = 4;
                profileVector = [ 0 0 0 1 0 0];
            case 'Vermilion_snapper'
                j = 5;
                profileVector = [ 0 0 0 0 1 0];
            case 'Vermilion_Snapper' % Capatialized
                j = 5;
                profileVector = [ 0 0 0 0 1 0];
            case 'White_Bass'
                j = 6;
                profileVector = [ 0 0 0 0 0 1];
            otherwise
                warning('Unexpected Fish Type');
        end
        debug = 0;
        concatArray = [concatArray,profileVector];
        debug = 0;
        
end

debug = 0;
decisionMatrix = concatArray;
debug = 0;
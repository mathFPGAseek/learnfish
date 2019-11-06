%% ------------------------------------------------------------------------
% filename: predictSpectFluorClassifierA.m
% rbd 9/29/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian                      
%% ----------------------------
function [avgSensorAccuracy,...
          varSensorAccuracy,...
          sensorAccuracy] = predictSpectFluorClassifierA(tbl_Fluorescence,...
                                          randomRuns,...
                                          M,N,num_meas_fluorescence,...
                                          dim_fluorescence,...
                                          trainedSpectFluorClassifierA)
%% ----------------------------
% Repeat Step #3: Avg Results
%% ----------------------------
%fluorescence_samples = num2cell(zeros(1,dim_fluorescence));
fluorescence_array   = table2cell(tbl_Fluorescence);
sensorAccuracy       = zeros(randomRuns,M);

for k = 1 : randomRuns 
    correctScore    = zeros(1,M);
    incorrectScore  = zeros(1,M);

    %% ----------------------------
    % Step 3: Fit a batch of random
    % data and compute probabilities
    % for each class
    %% ----------------------------
        rand_index = randi(num_meas_fluorescence,N,1);
        rand_index = rand_index';
    % Dev/debug steps
    % Take random indices and concantenate vectors until you build up a matrix
    fluorescence_samples = num2cell(zeros(1,dim_fluorescence));
    for i = 1 : N
        vec_index = rand_index(i);
        new_random_sample = fluorescence_array(vec_index,:);
        fluorescence_samples = vertcat(fluorescence_samples,new_random_sample);
    end
    fluorescence_samples(1,:) = [];

    debug = 0;
    tbl_fluorescence_decision_training_data = cell2table(fluorescence_samples);
    tbl_fluorescence_decision_training_data.Properties.VariableNames = {'label', 'imagingmode', 'DNA', 'Orderedas', 'Var1', 'Var2', 'Var3', 'Var4', 'Var5', 'Var6', 'Var7', 'Var8', 'Var9', 'Var10', 'Var11', 'Var12', 'Var13', 'Var14', 'Var15', 'Var16', 'Var17', 'Var18', 'Var19', 'Var20', 'Var21', 'Var22', 'Var23', 'Var24', 'Var25', 'Var26', 'Var27', 'Var28', 'Var29', 'Var30', 'Var31', 'Var32', 'Var33', 'Var34', 'Var35', 'Var36', 'Var37', 'Var38', 'Var39', 'Var40', 'Var41', 'Var42', 'Var43', 'Var44', 'Var45', 'Var46', 'Var47', 'Var48', 'Var49', 'Var50', 'Var51', 'Var52', 'Var53', 'Var54', 'Var55', 'Var56', 'Var57', 'Var58', 'Var59', 'Var60'};
    debug = 0;

    % Predictions
    DecisionFittingData = tbl_fluorescence_decision_training_data;


    debug = 0;
    yfit = trainedSpectFluorClassifierA.predictFcn(DecisionFittingData);
    debug = 0;

    % Score Randomized runs
    for i = 1 : N
        realDNA = fluorescence_array(rand_index(i),3);
        predictedDNA     = yfit(i);
        charPredictedDNA = char(predictedDNA);
        charRealDNA      = char(realDNA);
        % use case statement
        switch charRealDNA
            case 'Blue_Tilapia'
                j = 1;
            case 'Malabar_Snapper'
                j = 2;
            case 'Red_Snapper'
                j = 3;
            case 'Summer_flounder'
                j = 4;
            case 'Vermilion_snapper'
                j = 5;
            case 'White_Bass'
                j = 6;
            otherwise
                warning('Unexpected Fish Type');
        end
    
        match = strcmp(charRealDNA,charPredictedDNA);
    
        if match == 1
            correctScore(j)   = correctScore(j) + 1;
        else
            incorrectScore(j) = incorrectScore(j) + 1;
        end
    end % Score Randomized runs

    debug = 0;
    % store accuracy in matrix
    classScores = 0;
    for j = 1: M
        classScores  = correctScore(j) + incorrectScore(j);
        sensorAccuracy(k,j) = correctScore(j)/classScores;
    end
    debug = 0;
end % randomRuns
avgSensorAccuracy = zeros(1,M);
% Calculate average of runs..
for p = 1 : M
    sumCol = sum(sensorAccuracy(:,p));
    avgSensorAccuracy(p) = sumCol/randomRuns;

end
debug = 0; 
varSensorAccuracy = zeros(1,M);
% Calculate average of runs..
for p = 1 : M
    varSensorAccuracy(p) = var(sensorAccuracy(:,p));

end
debug = 0;
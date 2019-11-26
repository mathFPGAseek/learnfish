%% ------------------------------------------------------------------------
% filename: decision_fluor_fusion.m
% rbd 9/29/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
% 
% Description: We are taking data provided by SafetySpect and trying to
% fuse different spectroscopy sensors to improve the classification 
%
% Steps :
% 1. Take a small random set of measurements( Classifier training data)
% 2. Run Trainclassifier from this subset and
% get Training and validation using k-folding
% 3. Run "randomRuns" times batch of data and fit and 
% acquire average and variance for each class
% 4. Repeat Steps 1-3 with different PCA and SVM hyperparameters
% 5. Assign a weight to variance and average for each class and classifier
% 6. Repeat for all sensors.
% 9. Run Test data through all classifiers for all sensors.
% 10. Weight Results
% 11. Compare to various standalone results
%% ------------------------------------------------------------------------
L = 2;   % Number of Classifiers
randomRuns = 10;   % Number of random runs for a train
M = 6;   % Types of Fish to classify
N = TrainSize; % sample random size
P = 4;   % Number of Trains
samples_fluorescence = size(tbl_Fluorescence);
num_meas_fluorescence = samples_fluorescence(1);
dim_fluorescence = samples_fluorescence(2);
%% ----------------------------
% Classifier A
% 10 Principal Components PCA
% Quad SVM
%% ----------------------------
%tic
SpectFluorClassifierAAvgResults        = zeros(P,M);
SpectFluorClassifierAVarResults        = zeros(P,M);
SpectFluorClassifierFinalAAvgResults   = zeros(1,M); 
SpectFluorClassifierFinalAVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataFluor(num_meas_fluorescence,N,dim_fluorescence, ...
                          tbl_Fluorescence);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectFluorClassifierA, validationAccuracy] = trainSpectFluorClassifierA(trainingData,KFolds);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy,sensorAccuracy] = predictSpectFluorClassifierA(tbl_Fluorescence,...
                                          randomRuns,...
                                          M,N,num_meas_fluorescence,...
                                          dim_fluorescence,...
                                          trainedSpectFluorClassifierA);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectFluorClassifierAAvgResults(i,:) = avgSensorAccuracy;
    SpectFluorClassifierAVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier A
    %% ----------------------------
    for j = 1 : M
        SpectFluorClassifierFinalAAvgResults(j) = mean(SpectFluorClassifierAAvgResults(:,j));
        SpectFluorClassifierFinalAVarResults(j) = mean(SpectFluorClassifierAVarResults(:,j));
    end
%toc
debug = 0;

%% ----------------------------
% Classifier B
% Explained variance 95%
% Cubic SVM
%% ----------------------------
%tic
SpectFluorClassifierBAvgResults        = zeros(P,M);
SpectFluorClassifierBVarResults        = zeros(P,M);
SpectFluorClassifierFinalBAvgResults   = zeros(1,M); 
SpectFluorClassifierFinalBVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataFluor(num_meas_fluorescence,N,dim_fluorescence, ...
                          tbl_Fluorescence);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectFluorClassifierB, validationAccuracy] = trainSpectFluorClassifierB(trainingData,KFolds);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy,sensorAccuracy] = predictSpectFluorClassifierB(tbl_Fluorescence,...
                                          randomRuns,...
                                          M,N,num_meas_fluorescence,...
                                          dim_fluorescence,...
                                          trainedSpectFluorClassifierB);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectFluorClassifierBAvgResults(i,:) = avgSensorAccuracy;
    SpectFluorClassifierBVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier B
    %% ----------------------------
    for j = 1 : M
        SpectFluorClassifierFinalBAvgResults(j) = mean(SpectFluorClassifierBAvgResults(:,j));
        SpectFluorClassifierFinalBVarResults(j) = mean(SpectFluorClassifierBVarResults(:,j));
    end
%toc    
    debug = 0;





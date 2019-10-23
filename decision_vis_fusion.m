%% ------------------------------------------------------------------------
% filename: decision_vis_fusion.m
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
N = 200; % sample random size
P = 4;   % Number of Trains
samples_vis = size(tbl_vis);
num_meas_vis = samples_vis(1);
dim_vis = samples_vis(2);
%% ----------------------------
% Classifier A
% 10 Principal Components PCA
% Quad SVM
%% ----------------------------
%tic
SpectVisClassifierAAvgResults        = zeros(P,M);
SpectVisClassifierAVarResults        = zeros(P,M);
SpectVisClassifierFinalAAvgResults   = zeros(1,M); 
SpectVisClassifierFinalAVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataVis(num_meas_vis,N,dim_vis, ...
                          tbl_vis);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectVisClassifierA, validationAccuracy] = trainSpectVisClassifierA(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy] = predictSpectVisClassifierA(tbl_vis,...
                                          randomRuns,...
                                          M,N,num_meas_vis,...
                                          dim_vis,...
                                          trainedSpectVisClassifierA);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectVisClassifierAAvgResults(i,:) = avgSensorAccuracy;
    SpectVisClassifierAVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier A
    %% ----------------------------
    for j = 1 : M
        SpectVisClassifierFinalAAvgResults(j) = mean(SpectVisClassifierAAvgResults(:,j));
        SpectVisClassifierFinalAVarResults(j) = mean(SpectVisClassifierAVarResults(:,j));
    end
%toc
debug = 0;

%% ----------------------------
% Classifier B
% Explained variance 95%
% Cubic SVM
%% ----------------------------
%tic
SpectVisClassifierBAvgResults        = zeros(P,M);
SpectVisClassifierBVarResults        = zeros(P,M);
SpectVisClassifierFinalBAvgResults   = zeros(1,M); 
SpectVisClassifierFinalBVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataVis(num_meas_vis,N,dim_vis, ...
                          tbl_vis);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectVisClassifierB, validationAccuracy] = trainSpectVisClassifierB(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy] = predictSpectVisClassifierB(tbl_vis,...
                                          randomRuns,...
                                          M,N,num_meas_vis,...
                                          dim_vis,...
                                          trainedSpectVisClassifierB);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectVisClassifierBAvgResults(i,:) = avgSensorAccuracy;
    SpectVisClassifierBVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier B
    %% ----------------------------
    for j = 1 : M
        SpectVisClassifierFinalBAvgResults(j) = mean(SpectVisClassifierBAvgResults(:,j));
        SpectVisClassifierFinalBVarResults(j) = mean(SpectVisClassifierBVarResults(:,j));
    end
%toc    
    debug = 0;





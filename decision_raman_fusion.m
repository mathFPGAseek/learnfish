%% ------------------------------------------------------------------------
% filename: decision_raman_fusion.m
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
samples_raman = size(tbl_raman);
num_meas_raman = samples_raman(1);
dim_raman = samples_raman(2);
%% ----------------------------
% Classifier A
% 10 Principal Components PCA
% Quad SVM
%% ----------------------------
%tic
SpectRamanClassifierAAvgResults        = zeros(P,M);
SpectRamanClassifierAVarResults        = zeros(P,M);
SpectRamanClassifierFinalAAvgResults   = zeros(1,M); 
SpectRamanClassifierFinalAVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataRaman(num_meas_raman,N,dim_raman, ...
                          tbl_raman);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectRamanClassifierA, validationAccuracy] = trainSpectRamanClassifierA(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy,sensorAccuracy] = predictSpectRamanClassifierA(tbl_raman,...
                                          randomRuns,...
                                          M,N,num_meas_raman,...
                                          dim_raman,...
                                          trainedSpectRamanClassifierA);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectRamanClassifierAAvgResults(i,:) = avgSensorAccuracy;
    SpectRamanClassifierAVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier A
    %% ----------------------------
    for j = 1 : M
        SpectRamanClassifierFinalAAvgResults(j) = mean(SpectRamanClassifierAAvgResults(:,j));
        SpectRamanClassifierFinalAVarResults(j) = mean(SpectRamanClassifierAVarResults(:,j));
    end
%toc
debug = 0;

%% ----------------------------
% Classifier B
% Explained variance 95%
% Cubic SVM
%% ----------------------------
%tic
SpectRamanClassifierBAvgResults        = zeros(P,M);
SpectRamanClassifierBVarResults        = zeros(P,M);
SpectRamanClassifierFinalBAvgResults   = zeros(1,M); 
SpectRamanClassifierFinalBVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataRaman(num_meas_raman,N,dim_raman, ...
                          tbl_raman);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectRamanClassifierB, validationAccuracy] = trainSpectRamanClassifierB(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy,sensorAccuracy] = predictSpectRamanClassifierB(tbl_raman,...
                                          randomRuns,...
                                          M,N,num_meas_raman,...
                                          dim_raman,...
                                          trainedSpectRamanClassifierB);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectRamanClassifierBAvgResults(i,:) = avgSensorAccuracy;
    SpectRamanClassifierBVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier B
    %% ----------------------------
    for j = 1 : M
        SpectRamanClassifierFinalBAvgResults(j) = mean(SpectRamanClassifierBAvgResults(:,j));
        SpectRamanClassifierFinalBVarResults(j) = mean(SpectRamanClassifierBVarResults(:,j));
    end
%toc    
    debug = 0;





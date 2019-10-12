%% ------------------------------------------------------------------------
% filename: decision_swir_fusion.m
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
samples_swir = size(tbl_SWIR);
num_meas_swir = samples_swir(1);
dim_swir = samples_swir(2);
%% ----------------------------
% Classifier A
% 10 Principal Components PCA
% Quad SVM
%% ----------------------------
tic
SpectSwirClassifierAAvgResults        = zeros(P,M);
SpectSwirClassifierAVarResults        = zeros(P,M);
SpectSwirClassifierFinalAAvgResults   = zeros(1,M); 
SpectSwirClassifierFinalAVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataSwir(num_meas_swir,N,dim_swir, ...
                          tbl_SWIR);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectSwirClassifierA, validationAccuracy] = trainSpectSwirClassifierA(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy] = predictSpectSwirClassifierA(tbl_SWIR,...
                                          randomRuns,...
                                          M,N,num_meas_swir,...
                                          dim_swir,...
                                          trainedSpectSwirClassifierA);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectSwirClassifierAAvgResults(i,:) = avgSensorAccuracy;
    SpectSwirClassifierAVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier A
    %% ----------------------------
    for j = 1 : M
        SpectSwirClassifierFinalAAvgResults(j) = mean(SpectSwirClassifierAAvgResults(:,j));
        SpectSwirClassifierFinalAVarResults(j) = mean(SpectSwirClassifierAVarResults(:,j));
    end
toc
debug = 0;

%% ----------------------------
% Classifier B
% Explained variance 95%
% Cubic SVM
%% ----------------------------
tic
SpectSwirClassifierBAvgResults        = zeros(P,M);
SpectSwirClassifierBVarResults        = zeros(P,M);
SpectSwirClassifierFinalBAvgResults   = zeros(1,M); 
SpectSwirClassifierFinalBVarResults   = zeros(1,M);
for i = 1 : P

    %% ----------------------------
    % Step 1: Build a table randomly
    %% ----------------------------
    [trainingData] = generateTrainingDataSwir(num_meas_swir,N,dim_swir, ...
                          tbl_SWIR);

    %% ----------------------------
    % Step 2: Train Classifier 
    %% ----------------------------
    %[trainedClassifier, validationAccuracy] = trainSpectFluorClassifierA(trainingData);
    [trainedSpectSwirClassifierB, validationAccuracy] = trainSpectSwirClassifierB(trainingData);
    debug = 0;

    %% ----------------------------
    % Step #3: Avg & Var Results
    %% ----------------------------
    [avgSensorAccuracy,varSensorAccuracy] = predictSpectSwirClassifierB(tbl_SWIR,...
                                          randomRuns,...
                                          M,N,num_meas_swir,...
                                          dim_swir,...
                                          trainedSpectSwirClassifierB);

    %% ----------------------------
    % Update Avg & Var Tables
    %% ----------------------------
    SpectSwirClassifierBAvgResults(i,:) = avgSensorAccuracy;
    SpectSwirClassifierBVarResults(i,:) = varSensorAccuracy;
 
    
debug = 0;
end

    %% ----------------------------
    % Final Avg and Variance Classifier B
    %% ----------------------------
    for j = 1 : M
        SpectSwirClassifierFinalBAvgResults(j) = mean(SpectSwirClassifierBAvgResults(:,j));
        SpectSwirClassifierFinalBVarResults(j) = mean(SpectSwirClassifierBVarResults(:,j));
    end
toc    
    debug = 0;





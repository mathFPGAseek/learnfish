%% ------------------------------------------------------------------------
% filename: runFluorExperiment.m
% rbd 10/14/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
% Decription: This script will run the experiment for all four sensors
% with both classifiers, and then with the Policy 
%% ------------------------------------------------------------------------

%  
debug = 0;
tbl_fluorescence_experiment_data = cell2table(assembledFluorArrayForMC);
tbl_fluorescence_experiment_data.Properties.VariableNames = {'label', 'imagingmode', 'DNA', 'Orderedas', 'Var1', 'Var2', 'Var3', 'Var4', 'Var5', 'Var6', 'Var7', 'Var8', 'Var9', 'Var10', 'Var11', 'Var12', 'Var13', 'Var14', 'Var15', 'Var16', 'Var17', 'Var18', 'Var19', 'Var20', 'Var21', 'Var22', 'Var23', 'Var24', 'Var25', 'Var26', 'Var27', 'Var28', 'Var29', 'Var30', 'Var31', 'Var32', 'Var33', 'Var34', 'Var35', 'Var36', 'Var37', 'Var38', 'Var39', 'Var40', 'Var41', 'Var42', 'Var43', 'Var44', 'Var45', 'Var46', 'Var47', 'Var48', 'Var49', 'Var50', 'Var51', 'Var52', 'Var53', 'Var54', 'Var55', 'Var56', 'Var57', 'Var58', 'Var59', 'Var60'};
debug = 0;

% Predictions
fluorescence_experiment_data = tbl_fluorescence_experiment_data;
debug = 0;
yFluorExpA = trainedSpectFluorClassifierA.predictFcn(fluorescence_experiment_data);
yFluorExpB = trainedSpectFluorClassifierB.predictFcn(fluorescence_experiment_data);
debug = 0;



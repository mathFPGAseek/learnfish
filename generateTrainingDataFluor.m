%% ------------------------------------------------------------------------
% filename: generateTrainingDataFluor.m
% rbd 9/29/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian                      
%% ----------------------------
function [trainingData] = generateTrainingDataFluor(num_meas_fluorescence,N,dim_fluorescence, ...
                          tbl_Fluorescence)
                     
%% ----------------------------
% Step 1: Build a table randomly
%% ----------------------------
rand_index = randi(num_meas_fluorescence,N,1);
rand_index = rand_index';
% Dev/debug steps
% Take random indices and concantenate vectors until you build up a matrix
fluorescence_samples = num2cell(zeros(1,dim_fluorescence));
fluorescence_array = table2cell(tbl_Fluorescence);
for i = 1 : N
  vec_index = rand_index(i);
  new_random_sample = fluorescence_array(vec_index,:);
  fluorescence_samples = vertcat(fluorescence_samples,new_random_sample);
end
fluorescence_samples(1,:) = [];

debug = 0;
tbl_fluorescence_classifier_training_data = cell2table(fluorescence_samples);
tbl_fluorescence_classifier_training_data.Properties.VariableNames = {'label', 'imagingmode', 'DNA', 'Orderedas', 'Var1', 'Var2', 'Var3', 'Var4', 'Var5', 'Var6', 'Var7', 'Var8', 'Var9', 'Var10', 'Var11', 'Var12', 'Var13', 'Var14', 'Var15', 'Var16', 'Var17', 'Var18', 'Var19', 'Var20', 'Var21', 'Var22', 'Var23', 'Var24', 'Var25', 'Var26', 'Var27', 'Var28', 'Var29', 'Var30', 'Var31', 'Var32', 'Var33', 'Var34', 'Var35', 'Var36', 'Var37', 'Var38', 'Var39', 'Var40', 'Var41', 'Var42', 'Var43', 'Var44', 'Var45', 'Var46', 'Var47', 'Var48', 'Var49', 'Var50', 'Var51', 'Var52', 'Var53', 'Var54', 'Var55', 'Var56', 'Var57', 'Var58', 'Var59', 'Var60'};
debug = 0;
trainingData = tbl_fluorescence_classifier_training_data;
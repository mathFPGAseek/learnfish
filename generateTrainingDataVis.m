%% ------------------------------------------------------------------------
% filename: generateTrainingDataVis.m
% rbd 9/29/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian                      
%% ----------------------------
function [trainingData] = generateTrainingDataVis(num_meas_vis,N,dim_vis, ...
                          tbl_vis)
                     
%% ----------------------------
% Step 1: Build a table randomly
%% ----------------------------
rand_index = randi(num_meas_vis,N,1);
rand_index = rand_index';
% Dev/debug steps
% Take random indices and concantenate vectors until you build up a matrix
vis_samples = num2cell(zeros(1,dim_vis));
vis_array = table2cell(tbl_vis);
for i = 1 : N
  vec_index = rand_index(i);
  new_random_sample = vis_array(vec_index,:);
  vis_samples = vertcat(vis_samples,new_random_sample);
end
vis_samples(1,:) = [];

debug = 0;
tbl_vis_classifier_training_data = cell2table(vis_samples);
tbl_vis_classifier_training_data.Properties.VariableNames ={'label', 'imagingmode','DNA', 'Orderedas', 'Var1', 'Var2', 'Var3', 'Var4', 'Var5', 'Var6', 'Var7', 'Var8', 'Var9', 'Var10', 'Var11', 'Var12', 'Var13', 'Var14', 'Var15', 'Var16', 'Var17', 'Var18', 'Var19', 'Var20', 'Var21', 'Var22', 'Var23', 'Var24', 'Var25', 'Var26', 'Var27', 'Var28', 'Var29', 'Var30', 'Var31', 'Var32', 'Var33', 'Var34', 'Var35', 'Var36', 'Var37', 'Var38', 'Var39', 'Var40', 'Var41', 'Var42', 'Var43', 'Var44', 'Var45', 'Var46', 'Var47', 'Var48', 'Var49', 'Var50', 'Var51', 'Var52', 'Var53', 'Var54', 'Var55', 'Var56', 'Var57', 'Var58', 'Var59', 'Var60', 'Var61', 'Var62', 'Var63', 'Var64', 'Var65', 'Var66', 'Var67', 'Var68', 'Var69', 'Var70', 'Var71', 'Var72', 'Var73', 'Var74', 'Var75', 'Var76', 'Var77', 'Var78', 'Var79', 'Var80', 'Var81', 'Var82', 'Var83', 'Var84', 'Var85', 'Var86', 'Var87', 'Var88', 'Var89', 'Var90', 'Var91', 'Var92', 'Var93', 'Var94', 'Var95', 'Var96', 'Var97', 'Var98', 'Var99', 'Var100', 'Var101', 'Var102', 'Var103', 'Var104', 'Var105', 'Var106', 'Var107', 'Var108', 'Var109', 'Var110', 'Var111', 'Var112', 'Var113', 'Var114', 'Var115', 'Var116', 'Var117', 'Var118', 'Var119', 'Var120', 'Var121', 'Var122', 'Var123', 'Var124', 'Var125'};
debug = 0;
trainingData = tbl_vis_classifier_training_data;
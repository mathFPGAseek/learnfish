%% ------------------------------------------------------------------------
% filename: predictSpectRamanClassifierB.m
% rbd 9/29/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian                      
%% ----------------------------
function [avgSensorAccuracy,...
          varSensorAccuracy,...
          sensorAccuracy] = predictSpectRamanClassifierB(tbl_raman,...
                                          randomRuns,...
                                          M,N,num_meas_raman,...
                                          dim_raman,...
                                          trainedSpectRamanClassifierB)
%% ----------------------------
% Repeat Step #3: Avg Results
%% ----------------------------
%fluorescence_samples = num2cell(zeros(1,dim_fluorescence));
raman_array   = table2cell(tbl_raman);
sensorAccuracy       = zeros(randomRuns,M);

for k = 1 : randomRuns 
    correctScore    = zeros(1,M);
    incorrectScore  = zeros(1,M);

    %% ----------------------------
    % Step 3: Fit a batch of random
    % data and compute probabilities
    % for each class
    %% ----------------------------
        rand_index = randi(num_meas_raman,N,1);
        rand_index = rand_index';
    % Dev/debug steps
    % Take random indices and concantenate vectors until you build up a matrix
    raman_samples = num2cell(zeros(1,dim_raman));
    for i = 1 : N
        vec_index = rand_index(i);
        new_random_sample = raman_array(vec_index,:);
        raman_samples = vertcat(raman_samples,new_random_sample);
    end
    raman_samples(1,:) = [];

    debug = 0; 
    tbl_raman_decision_training_data = cell2table(raman_samples);
    tbl_raman_decision_training_data.Properties.VariableNames = {'label', 'imagingmode', 'DNA', 'Orderedas', 'Var1', 'Var2', 'Var3', 'Var4', 'Var5', 'Var6', 'Var7', 'Var8', 'Var9', 'Var10', 'Var11', 'Var12', 'Var13', 'Var14', 'Var15', 'Var16', 'Var17', 'Var18', 'Var19', 'Var20', 'Var21', 'Var22', 'Var23', 'Var24', 'Var25', 'Var26', 'Var27', 'Var28', 'Var29', 'Var30', 'Var31', 'Var32', 'Var33', 'Var34', 'Var35', 'Var36', 'Var37', 'Var38', 'Var39', 'Var40', 'Var41', 'Var42', 'Var43', 'Var44', 'Var45', 'Var46', 'Var47', 'Var48', 'Var49', 'Var50', 'Var51', 'Var52', 'Var53', 'Var54', 'Var55', 'Var56', 'Var57', 'Var58', 'Var59', 'Var60', 'Var61', 'Var62', 'Var63', 'Var64', 'Var65', 'Var66', 'Var67', 'Var68', 'Var69', 'Var70', 'Var71', 'Var72', 'Var73', 'Var74', 'Var75', 'Var76', 'Var77', 'Var78', 'Var79', 'Var80', 'Var81', 'Var82', 'Var83', 'Var84', 'Var85', 'Var86', 'Var87', 'Var88', 'Var89', 'Var90', 'Var91', 'Var92', 'Var93', 'Var94', 'Var95', 'Var96', 'Var97', 'Var98', 'Var99', 'Var100', 'Var101', 'Var102', 'Var103', 'Var104', 'Var105', 'Var106', 'Var107', 'Var108', 'Var109', 'Var110', 'Var111', 'Var112', 'Var113', 'Var114', 'Var115', 'Var116', 'Var117', 'Var118', 'Var119', 'Var120', 'Var121', 'Var122', 'Var123', 'Var124', 'Var125', 'Var126', 'Var127', 'Var128', 'Var129', 'Var130', 'Var131', 'Var132', 'Var133', 'Var134', 'Var135', 'Var136', 'Var137', 'Var138', 'Var139', 'Var140', 'Var141', 'Var142', 'Var143', 'Var144', 'Var145', 'Var146', 'Var147', 'Var148', 'Var149', 'Var150', 'Var151', 'Var152', 'Var153', 'Var154', 'Var155', 'Var156', 'Var157', 'Var158', 'Var159', 'Var160', 'Var161', 'Var162', 'Var163', 'Var164', 'Var165', 'Var166', 'Var167', 'Var168', 'Var169', 'Var170', 'Var171', 'Var172', 'Var173', 'Var174', 'Var175', 'Var176', 'Var177', 'Var178', 'Var179', 'Var180', 'Var181', 'Var182', 'Var183', 'Var184', 'Var185', 'Var186', 'Var187', 'Var188', 'Var189', 'Var190', 'Var191', 'Var192', 'Var193', 'Var194', 'Var195', 'Var196', 'Var197', 'Var198', 'Var199', 'Var200', 'Var201', 'Var202', 'Var203', 'Var204', 'Var205', 'Var206', 'Var207', 'Var208', 'Var209', 'Var210', 'Var211', 'Var212', 'Var213', 'Var214', 'Var215', 'Var216', 'Var217', 'Var218', 'Var219', 'Var220', 'Var221', 'Var222', 'Var223', 'Var224', 'Var225', 'Var226', 'Var227', 'Var228', 'Var229', 'Var230', 'Var231', 'Var232', 'Var233', 'Var234', 'Var235', 'Var236', 'Var237', 'Var238', 'Var239', 'Var240', 'Var241', 'Var242', 'Var243', 'Var244', 'Var245', 'Var246', 'Var247', 'Var248', 'Var249', 'Var250', 'Var251', 'Var252', 'Var253', 'Var254', 'Var255', 'Var256', 'Var257', 'Var258', 'Var259', 'Var260', 'Var261', 'Var262', 'Var263', 'Var264', 'Var265', 'Var266', 'Var267', 'Var268', 'Var269', 'Var270', 'Var271', 'Var272', 'Var273', 'Var274', 'Var275', 'Var276', 'Var277', 'Var278', 'Var279', 'Var280', 'Var281', 'Var282', 'Var283', 'Var284', 'Var285', 'Var286', 'Var287', 'Var288', 'Var289', 'Var290', 'Var291', 'Var292', 'Var293', 'Var294', 'Var295', 'Var296', 'Var297', 'Var298', 'Var299', 'Var300', 'Var301', 'Var302', 'Var303', 'Var304', 'Var305', 'Var306', 'Var307', 'Var308', 'Var309', 'Var310', 'Var311', 'Var312', 'Var313', 'Var314', 'Var315', 'Var316', 'Var317', 'Var318', 'Var319', 'Var320', 'Var321', 'Var322', 'Var323', 'Var324', 'Var325', 'Var326', 'Var327', 'Var328', 'Var329', 'Var330', 'Var331', 'Var332', 'Var333', 'Var334', 'Var335', 'Var336', 'Var337', 'Var338', 'Var339', 'Var340', 'Var341', 'Var342', 'Var343', 'Var344', 'Var345', 'Var346', 'Var347', 'Var348', 'Var349', 'Var350', 'Var351', 'Var352', 'Var353', 'Var354', 'Var355', 'Var356', 'Var357', 'Var358', 'Var359', 'Var360', 'Var361', 'Var362', 'Var363', 'Var364', 'Var365', 'Var366', 'Var367', 'Var368', 'Var369', 'Var370', 'Var371', 'Var372', 'Var373', 'Var374', 'Var375', 'Var376', 'Var377', 'Var378', 'Var379', 'Var380', 'Var381', 'Var382', 'Var383', 'Var384', 'Var385', 'Var386', 'Var387', 'Var388', 'Var389', 'Var390', 'Var391', 'Var392', 'Var393', 'Var394', 'Var395', 'Var396', 'Var397', 'Var398', 'Var399', 'Var400', 'Var401', 'Var402', 'Var403', 'Var404', 'Var405', 'Var406', 'Var407', 'Var408', 'Var409', 'Var410', 'Var411', 'Var412', 'Var413', 'Var414', 'Var415', 'Var416', 'Var417', 'Var418', 'Var419', 'Var420', 'Var421', 'Var422', 'Var423', 'Var424', 'Var425', 'Var426', 'Var427', 'Var428', 'Var429', 'Var430', 'Var431', 'Var432', 'Var433', 'Var434', 'Var435', 'Var436', 'Var437', 'Var438', 'Var439', 'Var440', 'Var441', 'Var442', 'Var443', 'Var444', 'Var445', 'Var446', 'Var447', 'Var448', 'Var449', 'Var450', 'Var451', 'Var452', 'Var453', 'Var454', 'Var455', 'Var456', 'Var457', 'Var458', 'Var459', 'Var460', 'Var461', 'Var462', 'Var463', 'Var464', 'Var465', 'Var466', 'Var467', 'Var468', 'Var469', 'Var470', 'Var471', 'Var472', 'Var473', 'Var474', 'Var475', 'Var476', 'Var477', 'Var478', 'Var479', 'Var480', 'Var481', 'Var482', 'Var483', 'Var484', 'Var485', 'Var486', 'Var487', 'Var488', 'Var489', 'Var490', 'Var491', 'Var492', 'Var493', 'Var494', 'Var495', 'Var496', 'Var497', 'Var498', 'Var499', 'Var500', 'Var501', 'Var502', 'Var503', 'Var504', 'Var505', 'Var506', 'Var507', 'Var508', 'Var509', 'Var510', 'Var511', 'Var512', 'Var513', 'Var514', 'Var515', 'Var516', 'Var517', 'Var518', 'Var519', 'Var520', 'Var521', 'Var522', 'Var523', 'Var524', 'Var525', 'Var526', 'Var527', 'Var528', 'Var529', 'Var530', 'Var531', 'Var532', 'Var533', 'Var534', 'Var535', 'Var536', 'Var537', 'Var538', 'Var539', 'Var540', 'Var541', 'Var542', 'Var543', 'Var544', 'Var545', 'Var546', 'Var547', 'Var548', 'Var549', 'Var550', 'Var551', 'Var552', 'Var553', 'Var554', 'Var555', 'Var556', 'Var557', 'Var558', 'Var559', 'Var560', 'Var561', 'Var562', 'Var563', 'Var564', 'Var565', 'Var566', 'Var567', 'Var568', 'Var569', 'Var570', 'Var571', 'Var572', 'Var573', 'Var574', 'Var575', 'Var576', 'Var577', 'Var578', 'Var579', 'Var580', 'Var581', 'Var582', 'Var583', 'Var584', 'Var585', 'Var586', 'Var587', 'Var588', 'Var589', 'Var590', 'Var591', 'Var592', 'Var593', 'Var594', 'Var595', 'Var596', 'Var597', 'Var598', 'Var599', 'Var600', 'Var601', 'Var602', 'Var603', 'Var604', 'Var605', 'Var606', 'Var607', 'Var608', 'Var609', 'Var610', 'Var611', 'Var612', 'Var613', 'Var614', 'Var615', 'Var616', 'Var617', 'Var618', 'Var619', 'Var620', 'Var621', 'Var622', 'Var623', 'Var624', 'Var625', 'Var626', 'Var627', 'Var628', 'Var629', 'Var630', 'Var631', 'Var632', 'Var633', 'Var634', 'Var635', 'Var636', 'Var637', 'Var638', 'Var639', 'Var640', 'Var641', 'Var642', 'Var643', 'Var644', 'Var645', 'Var646', 'Var647', 'Var648', 'Var649', 'Var650', 'Var651', 'Var652', 'Var653', 'Var654', 'Var655', 'Var656', 'Var657', 'Var658', 'Var659', 'Var660', 'Var661', 'Var662', 'Var663', 'Var664', 'Var665', 'Var666', 'Var667', 'Var668', 'Var669', 'Var670', 'Var671', 'Var672', 'Var673', 'Var674', 'Var675', 'Var676', 'Var677', 'Var678', 'Var679', 'Var680', 'Var681', 'Var682', 'Var683', 'Var684', 'Var685', 'Var686', 'Var687', 'Var688', 'Var689', 'Var690', 'Var691', 'Var692', 'Var693', 'Var694', 'Var695', 'Var696', 'Var697', 'Var698', 'Var699', 'Var700', 'Var701', 'Var702', 'Var703', 'Var704', 'Var705', 'Var706', 'Var707', 'Var708', 'Var709', 'Var710', 'Var711', 'Var712', 'Var713', 'Var714', 'Var715', 'Var716', 'Var717', 'Var718', 'Var719', 'Var720', 'Var721', 'Var722', 'Var723', 'Var724', 'Var725', 'Var726', 'Var727', 'Var728', 'Var729', 'Var730', 'Var731', 'Var732', 'Var733', 'Var734', 'Var735', 'Var736', 'Var737', 'Var738', 'Var739', 'Var740', 'Var741', 'Var742', 'Var743', 'Var744', 'Var745', 'Var746', 'Var747', 'Var748', 'Var749', 'Var750', 'Var751', 'Var752', 'Var753', 'Var754', 'Var755', 'Var756', 'Var757', 'Var758', 'Var759', 'Var760', 'Var761', 'Var762', 'Var763', 'Var764', 'Var765', 'Var766', 'Var767', 'Var768', 'Var769', 'Var770', 'Var771', 'Var772', 'Var773', 'Var774', 'Var775', 'Var776', 'Var777', 'Var778', 'Var779', 'Var780', 'Var781', 'Var782', 'Var783', 'Var784', 'Var785', 'Var786', 'Var787', 'Var788', 'Var789', 'Var790', 'Var791', 'Var792', 'Var793', 'Var794', 'Var795', 'Var796', 'Var797', 'Var798', 'Var799', 'Var800', 'Var801', 'Var802', 'Var803', 'Var804', 'Var805', 'Var806', 'Var807', 'Var808', 'Var809', 'Var810', 'Var811', 'Var812', 'Var813', 'Var814', 'Var815', 'Var816', 'Var817', 'Var818', 'Var819', 'Var820', 'Var821', 'Var822', 'Var823', 'Var824', 'Var825', 'Var826', 'Var827', 'Var828', 'Var829', 'Var830', 'Var831', 'Var832', 'Var833', 'Var834', 'Var835', 'Var836', 'Var837', 'Var838', 'Var839', 'Var840', 'Var841', 'Var842', 'Var843', 'Var844', 'Var845', 'Var846', 'Var847', 'Var848', 'Var849', 'Var850', 'Var851', 'Var852', 'Var853', 'Var854', 'Var855', 'Var856', 'Var857', 'Var858', 'Var859', 'Var860', 'Var861', 'Var862', 'Var863', 'Var864', 'Var865', 'Var866', 'Var867', 'Var868', 'Var869', 'Var870', 'Var871', 'Var872', 'Var873', 'Var874', 'Var875', 'Var876', 'Var877', 'Var878', 'Var879', 'Var880', 'Var881', 'Var882', 'Var883', 'Var884', 'Var885', 'Var886', 'Var887', 'Var888', 'Var889', 'Var890', 'Var891', 'Var892', 'Var893', 'Var894', 'Var895', 'Var896', 'Var897', 'Var898', 'Var899', 'Var900', 'Var901', 'Var902', 'Var903', 'Var904', 'Var905', 'Var906', 'Var907', 'Var908', 'Var909', 'Var910', 'Var911', 'Var912', 'Var913', 'Var914', 'Var915', 'Var916', 'Var917', 'Var918', 'Var919', 'Var920', 'Var921', 'Var922', 'Var923', 'Var924', 'Var925', 'Var926', 'Var927', 'Var928', 'Var929', 'Var930', 'Var931', 'Var932', 'Var933', 'Var934', 'Var935', 'Var936', 'Var937', 'Var938', 'Var939', 'Var940', 'Var941', 'Var942', 'Var943', 'Var944', 'Var945', 'Var946', 'Var947', 'Var948', 'Var949', 'Var950', 'Var951', 'Var952', 'Var953', 'Var954', 'Var955', 'Var956', 'Var957', 'Var958', 'Var959', 'Var960', 'Var961', 'Var962', 'Var963', 'Var964', 'Var965', 'Var966', 'Var967', 'Var968', 'Var969', 'Var970', 'Var971', 'Var972', 'Var973', 'Var974', 'Var975', 'Var976', 'Var977', 'Var978', 'Var979', 'Var980', 'Var981', 'Var982', 'Var983', 'Var984', 'Var985', 'Var986', 'Var987', 'Var988', 'Var989', 'Var990', 'Var991', 'Var992', 'Var993', 'Var994', 'Var995', 'Var996', 'Var997', 'Var998', 'Var999', 'Var1000', 'Var1001', 'Var1002', 'Var1003', 'Var1004', 'Var1005', 'Var1006', 'Var1007', 'Var1008', 'Var1009', 'Var1010', 'Var1011', 'Var1012', 'Var1013', 'Var1014', 'Var1015', 'Var1016', 'Var1017', 'Var1018', 'Var1019', 'Var1020', 'Var1021', 'Var1022', 'Var1023', 'Var1024'};

    debug = 0;

    % Predictions
    DecisionFittingData = tbl_raman_decision_training_data;


    debug = 0;
    yfit = trainedSpectRamanClassifierB.predictFcn(DecisionFittingData);
    debug = 0;

    % Score Randomized runs
    for i = 1 : N
        realDNA = raman_array(rand_index(i),3);
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
            case 'Summer_Flounder'
                j = 4;
            case 'Vermilion_snapper'
                j = 5;
            case 'Vermilion_Snapper' % Capatialized
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
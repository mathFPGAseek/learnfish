%% ------------------------------------------------------------------------
% filename: plotResults.m
% rbd 11/8/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
% Description: Determine specificity with best Policy
%% ------------------------------------------------------------------------

% Plot Blue Tilapi
index = 0:1:randomRuns-1;
fluorABlueTilapia = sensorAccuracyFA(:,1); % green
fluorBBlueTilapia = sensorAccuracyFB(:,1); % red
ramanABlueTilapia = sensorAccuracyRA(:,1); % blue
ramanBBlueTilapia = sensorAccuracyRB(:,1); % cyan
SWIRABlueTilapia  = sensorAccuracySA(:,1); % magenta
SWIRBBlueTilapia  = sensorAccuracySB(:,1); % yellow
visABlueTilapia   = sensorAccuracyVA(:,1); % black
visBBlueTilapia   = sensorAccuracyVB(:,1); % white
figure(1);
h1 = plot(index,fluorABlueTilapia,'g'); 
title('Blue Tilapia Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBBlueTilapia,'r');
h3 = plot(index,ramanABlueTilapia,'b');
h4 = plot(index,ramanBBlueTilapia,'c');
h5 = plot(index,SWIRABlueTilapia,'m');
h6 = plot(index,SWIRBBlueTilapia,'y');
h7 = plot(index,visABlueTilapia,'k');
h8 = plot(index,visBBlueTilapia,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

% Plot Malabar Snapper
index = 0:1:randomRuns-1;
fluorAMalabarSnapper = sensorAccuracyFA(:,2); % green
fluorBMalabarSnapper = sensorAccuracyFB(:,2); % red
ramanAMalabarSnapper = sensorAccuracyRA(:,2); % blue
ramanBMalabarSnapper = sensorAccuracyRB(:,2); % cyan
SWIRAMalabarSnapper  = sensorAccuracySA(:,2); % magenta
SWIRBMalabarSnapper  = sensorAccuracySB(:,2); % yellow
visAMalabarSnapper   = sensorAccuracyVA(:,2); % black
visBMalabarSnapper   = sensorAccuracyVB(:,2); % white
figure(2);
h1 = plot(index,fluorAMalabarSnapper,'g'); 
title('Malabar Snapper Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBMalabarSnapper,'r');
h3 = plot(index,ramanAMalabarSnapper,'b');
h4 = plot(index,ramanBMalabarSnapper,'c');
h5 = plot(index,SWIRAMalabarSnapper,'m');
h6 = plot(index,SWIRBMalabarSnapper,'y');
h7 = plot(index,visAMalabarSnapper,'k');
h8 = plot(index,visBMalabarSnapper,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

% Plot Red Snapper
index = 0:1:randomRuns-1;
fluorARedSnapper = sensorAccuracyFA(:,3); % green
fluorBRedSnapper = sensorAccuracyFB(:,3); % red
ramanARedSnapper = sensorAccuracyRA(:,3); % blue
ramanBRedSnapper = sensorAccuracyRB(:,3); % cyan
SWIRARedSnapper  = sensorAccuracySA(:,3); % magenta
SWIRBRedSnapper  = sensorAccuracySB(:,3); % yellow
visARedSnapper   = sensorAccuracyVA(:,3); % black
visBRedSnapper   = sensorAccuracyVB(:,3); % white
figure(3);
h1 = plot(index,fluorARedSnapper,'g'); 
title('Red Snapper Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBRedSnapper,'r');
h3 = plot(index,ramanARedSnapper,'b');
h4 = plot(index,ramanBRedSnapper,'c');
h5 = plot(index,SWIRARedSnapper,'m');
h6 = plot(index,SWIRBRedSnapper,'y');
h7 = plot(index,visARedSnapper,'k');
h8 = plot(index,visBRedSnapper,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

% Plot Summer Flounder
index = 0:1:randomRuns-1;
fluorASummerFlounder = sensorAccuracyFA(:,4); % green
fluorBSummerFlounder = sensorAccuracyFB(:,4); % red
ramanASummerFlounder = sensorAccuracyRA(:,4); % blue
ramanBSummerFlounder = sensorAccuracyRB(:,4); % cyan
SWIRASummerFlounder  = sensorAccuracySA(:,4); % magenta
SWIRBSummerFlounder  = sensorAccuracySB(:,4); % yellow
visASummerFlounder   = sensorAccuracyVA(:,4); % black
visBSummerFlounder   = sensorAccuracyVB(:,4); % white
figure(4);
h1 = plot(index,fluorASummerFlounder,'g'); 
title('Summer Flounder Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBSummerFlounder,'r');
h3 = plot(index,ramanASummerFlounder,'b');
h4 = plot(index,ramanBSummerFlounder,'c');
h5 = plot(index,SWIRASummerFlounder,'m');
h6 = plot(index,SWIRBSummerFlounder,'y');
h7 = plot(index,visASummerFlounder,'k');
h8 = plot(index,visBSummerFlounder,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

% Plot Vermillion Snapper
index = 0:1:randomRuns-1;
fluorAVermillionSnapper = sensorAccuracyFA(:,5); % green
fluorBVermillionSnapper = sensorAccuracyFB(:,5); % red
ramanAVermillionSnapper = sensorAccuracyRA(:,5); % blue
ramanBVermillionSnapper = sensorAccuracyRB(:,5); % cyan
SWIRAVermillionSnapper  = sensorAccuracySA(:,5); % magenta
SWIRBVermillionSnapper  = sensorAccuracySB(:,5); % yellow
visAVermillionSnapper   = sensorAccuracyVA(:,5); % black
visBVermillionSnapper   = sensorAccuracyVB(:,5); % white
figure(5);
h1 = plot(index,fluorAVermillionSnapper,'g'); 
title('Vermillion Snapper Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBVermillionSnapper,'r');
h3 = plot(index,ramanAVermillionSnapper,'b');
h4 = plot(index,ramanBVermillionSnapper,'c');
h5 = plot(index,SWIRAVermillionSnapper,'m');
h6 = plot(index,SWIRBVermillionSnapper,'y');
h7 = plot(index,visAVermillionSnapper,'k');
h8 = plot(index,visBVermillionSnapper,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

% Plot White Bass
index = 0:1:randomRuns-1;
fluorAWhiteBass = sensorAccuracyFA(:,6); % green
fluorBWhiteBass = sensorAccuracyFB(:,6); % red
ramanAWhiteBass = sensorAccuracyRA(:,6); % blue
ramanBWhiteBass = sensorAccuracyRB(:,6); % cyan
SWIRAWhiteBass  = sensorAccuracySA(:,6); % magenta
SWIRBWhiteBass  = sensorAccuracySB(:,6); % yellow
visAWhiteBass   = sensorAccuracyVA(:,6); % black
visBWhiteBass   = sensorAccuracyVB(:,6); % white
figure(6);
h1 = plot(index,fluorAWhiteBass,'g'); 
title('White Bass Sensitivity');
ylabel('Accuracy');
xlabel(['Samples per index :' num2str(TrainSize)]);
ylim([-0.1 1.1]);
hold on;
h2 = plot(index,fluorBWhiteBass,'r');
h3 = plot(index,ramanAWhiteBass,'b');
h4 = plot(index,ramanBWhiteBass,'c');
h5 = plot(index,SWIRAWhiteBass,'m');
h6 = plot(index,SWIRBWhiteBass,'y');
h7 = plot(index,visAWhiteBass,'k');
h8 = plot(index,visBWhiteBass,'.');
legend([h1,h2,h3,h4,h5,h6,h7,h8],'fluorA','fluorB','ramanA','ramanB',...
       'SWIRA','SWIRB','visA','visB');
       
debug = 0;
hold off;

debug = 0;
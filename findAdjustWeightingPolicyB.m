%% ------------------------------------------------------------------------
% filename: findAdjustWeightingPolicyB.m
% rbd 11/2/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian 
%% ------------------------------------------------------------------------

%------------------------------------------------------------------------
%% Polciies
% Policy A1:
% No Adjustment weight for all sensors and all classes independently only
% use average, with a nominal value.
% Policy B1:
% Adjust weight for sensor that has the best average
% Policy B2:
% Adjust weight for sensor that has the best average agressively.
% Policy C1:
% Adjust weight for sensor that has the best average and variance
% Policy C2:
% Adjust weight for sensor that has the best average and variance aggresively
%------------------------------------------------------------------------
debug = 0;
fusionPolicyB1WeightingClassifierA = ones(sensors,classes);
fusionPolicyB1WeightingClassifierB = ones(sensors,classes);
fusionPolicyB2WeightingClassifierA = ones(sensors,classes);
fusionPolicyB2WeightingClassifierB = ones(sensors,classes);

%--------------------------------
% Adjust Policy Weighting for B1
%--------------------------------

%---------
% Build Policy for Classifier A
%---------

%Blue Tilapia
blueTilapiaFluorClassA = SpectFluorClassifierAAvgResults(1);
blueTilapiaRamanClassA = SpectRamanClassifierAAvgResults(1);
blueTilapiaSwirClassA  = SpectSwirClassifierAAvgResults(1);
blueTilapiaVisClassA   = SpectVisClassifierAAvgResults(1);

blueTilapiaArrayClassA = [blueTilapiaFluorClassA blueTilapiaRamanClassA,...
                          blueTilapiaSwirClassA blueTilapiaVisClassA];

[ Y blueTilapiaArrayClassIndexA]  = max(blueTilapiaArrayClassA);

%Malabar Snapper
malabarSnapperFluorClassA = SpectFluorClassifierAAvgResults(2);
malabarSnapperRamanClassA = SpectRamanClassifierAAvgResults(2);
malabarSnapperSwirClassA  = SpectSwirClassifierAAvgResults(2);
malabarSnapperVisClassA   = SpectVisClassifierAAvgResults(2);

malabarSnapperArrayClassA = [malabarSnapperFluorClassA malabarSnapperRamanClassA,...
                             malabarSnapperSwirClassA malabarSnapperVisClassA];

[ Y malabarSnapperArrayClassIndexA]  = max(malabarSnapperArrayClassA);

%Red Snapper
redSnapperFluorClassA = SpectFluorClassifierAAvgResults(3);
redSnapperRamanClassA = SpectRamanClassifierAAvgResults(3);
redSnapperSwirClassA  = SpectSwirClassifierAAvgResults(3);
redSnapperVisClassA   = SpectVisClassifierAAvgResults(3);

redSnapperArrayClassA = [redSnapperFluorClassA redSnapperRamanClassA,...
                             redSnapperSwirClassA redSnapperVisClassA];

[ Y redSnapperArrayClassIndexA]  = max(redSnapperArrayClassA);

%Summer Flounder
summerFlounderFluorClassA = SpectFluorClassifierAAvgResults(4);
summerFlounderRamanClassA = SpectRamanClassifierAAvgResults(4);
summerFlounderSwirClassA  = SpectSwirClassifierAAvgResults(4);
summerFlounderVisClassA   = SpectVisClassifierAAvgResults(4);

summerFlounderArrayClassA = [summerFlounderFluorClassA summerFlounderRamanClassA,...
                             summerFlounderSwirClassA summerFlounderVisClassA];

[ Y summerFlounderArrayClassIndexA]  = max(summerFlounderArrayClassA);

%Vermillion Snapper
vermillionSnapperFluorClassA  = SpectFluorClassifierAAvgResults(5);
vermillionSnapperRamanClassA  = SpectRamanClassifierAAvgResults(5);
vermillionSnapperSwirClassA   = SpectSwirClassifierAAvgResults(5);
vermillionSnapperVisClassA    = SpectVisClassifierAAvgResults(5);

vermillionSnapperArrayClassA = [vermillionSnapperFluorClassA vermillionSnapperRamanClassA,...
                                vermillionSnapperSwirClassA vermillionSnapperVisClassA];

[ Y vermillionSnapperArrayClassIndexA]  = max(vermillionSnapperArrayClassA);

%White Bass
whiteBassFluorClassA  = SpectFluorClassifierAAvgResults(6);
whiteBassRamanClassA  = SpectRamanClassifierAAvgResults(6);
whiteBassSwirClassA   = SpectSwirClassifierAAvgResults(6);
whiteBassVisClassA    = SpectVisClassifierAAvgResults(6);

whiteBassArrayClassA = [whiteBassFluorClassA whiteBassRamanClassA,...
                                whiteBassSwirClassA whiteBassVisClassA];

[ Y whiteBassArrayClassIndexA]  = max(whiteBassArrayClassA);

% Now adjust weights B1
fusionPolicyB1WeightingClassifierA(blueTilapiaArrayClassIndexA,1)       = 1.5;
fusionPolicyB1WeightingClassifierA(malabarSnapperArrayClassIndexA,2)    = 1.5;
fusionPolicyB1WeightingClassifierA(redSnapperArrayClassIndexA,3)        = 1.5;
fusionPolicyB1WeightingClassifierA(summerFlounderArrayClassIndexA,4)    = 1.5;
fusionPolicyB1WeightingClassifierA(vermillionSnapperArrayClassIndexA,5) = 1.5;
fusionPolicyB1WeightingClassifierA(whiteBassArrayClassIndexA,6)         = 1.5;

% Now adjust weights B2
fusionPolicyB2WeightingClassifierA(blueTilapiaArrayClassIndexA,1)       = 2.0;
fusionPolicyB2WeightingClassifierA(malabarSnapperArrayClassIndexA,2)    = 2.0;
fusionPolicyB2WeightingClassifierA(redSnapperArrayClassIndexA,3)        = 2.0;
fusionPolicyB2WeightingClassifierA(summerFlounderArrayClassIndexA,4)    = 2.0;
fusionPolicyB2WeightingClassifierA(vermillionSnapperArrayClassIndexA,5) = 2.0;
fusionPolicyB2WeightingClassifierA(whiteBassArrayClassIndexA,6)         = 2.0;
        
                               
debug = 0;


%%%%
%---------
% Build Policy for Classifier B
%---------

%Blue Tilapia
blueTilapiaFluorClassB = SpectFluorClassifierBAvgResults(1);
blueTilapiaRamanClassB = SpectRamanClassifierBAvgResults(1);
blueTilapiaSwirClassB  = SpectSwirClassifierBAvgResults(1);
blueTilapiaVisClassB   = SpectVisClassifierBAvgResults(1);

blueTilapiaArrayClassB = [blueTilapiaFluorClassB blueTilapiaRamanClassB,...
                          blueTilapiaSwirClassB blueTilapiaVisClassB];

[ Y blueTilapiaArrayClassIndexB]  = max(blueTilapiaArrayClassB);

%Malabar Snapper
malabarSnapperFluorClassB = SpectFluorClassifierBAvgResults(2);
malabarSnapperRamanClassB = SpectRamanClassifierBAvgResults(2);
malabarSnapperSwirClassB  = SpectSwirClassifierBAvgResults(2);
malabarSnapperVisClassB   = SpectVisClassifierBAvgResults(2);

malabarSnapperArrayClassB = [malabarSnapperFluorClassB malabarSnapperRamanClassB,...
                             malabarSnapperSwirClassB malabarSnapperVisClassB];

[ Y malabarSnapperArrayClassIndexB]  = max(malabarSnapperArrayClassB);

%Red Snapper
redSnapperFluorClassB = SpectFluorClassifierBAvgResults(3);
redSnapperRamanClassB = SpectRamanClassifierBAvgResults(3);
redSnapperSwirClassB  = SpectSwirClassifierBAvgResults(3);
redSnapperVisClassB   = SpectVisClassifierBAvgResults(3);

redSnapperArrayClassB = [redSnapperFluorClassB redSnapperRamanClassB,...
                             redSnapperSwirClassB redSnapperVisClassB];

[ Y redSnapperArrayClassIndexB]  = max(redSnapperArrayClassB);

%Summer Flounder
summerFlounderFluorClassB = SpectFluorClassifierBAvgResults(4);
summerFlounderRamanClassB = SpectRamanClassifierBAvgResults(4);
summerFlounderSwirClassB  = SpectSwirClassifierBAvgResults(4);
summerFlounderVisClassB   = SpectVisClassifierBAvgResults(4);

summerFlounderArrayClassB = [summerFlounderFluorClassB summerFlounderRamanClassB,...
                             summerFlounderSwirClassB summerFlounderVisClassB];

[ Y summerFlounderArrayClassIndexB]  = max(summerFlounderArrayClassB);

%Vermillion Snapper
vermillionSnapperFluorClassB  = SpectFluorClassifierBAvgResults(5);
vermillionSnapperRamanClassB  = SpectRamanClassifierBAvgResults(5);
vermillionSnapperSwirClassB   = SpectSwirClassifierBAvgResults(5);
vermillionSnapperVisClassB    = SpectVisClassifierBAvgResults(5);

vermillionSnapperArrayClassB = [vermillionSnapperFluorClassB vermillionSnapperRamanClassB,...
                                vermillionSnapperSwirClassB vermillionSnapperVisClassB];

[ Y vermillionSnapperArrayClassIndexB]  = max(vermillionSnapperArrayClassB);

%White Bass
whiteBassFluorClassB  = SpectFluorClassifierBAvgResults(6);
whiteBassRamanClassB  = SpectRamanClassifierBAvgResults(6);
whiteBassSwirClassB   = SpectSwirClassifierBAvgResults(6);
whiteBassVisClassB    = SpectVisClassifierBAvgResults(6);

whiteBassArrayClassB = [whiteBassFluorClassB whiteBassRamanClassB,...
                                whiteBassSwirClassB whiteBassVisClassB];

[ Y whiteBassArrayClassIndexB]  = max(whiteBassArrayClassB);

% Now adjust weights B1
fusionPolicyB1WeightingClassifierB(blueTilapiaArrayClassIndexB,1)       = 1.5;
fusionPolicyB1WeightingClassifierB(malabarSnapperArrayClassIndexB,2)    = 1.5;
fusionPolicyB1WeightingClassifierB(redSnapperArrayClassIndexB,3)        = 1.5;
fusionPolicyB1WeightingClassifierB(summerFlounderArrayClassIndexB,4)    = 1.5;
fusionPolicyB1WeightingClassifierB(vermillionSnapperArrayClassIndexB,5) = 1.5;
fusionPolicyB1WeightingClassifierB(whiteBassArrayClassIndexB,6)         = 1.5;

% Now adjust weights B2
fusionPolicyB2WeightingClassifierB(blueTilapiaArrayClassIndexB,1)       = 2.0;
fusionPolicyB2WeightingClassifierB(malabarSnapperArrayClassIndexB,2)    = 2.0;
fusionPolicyB2WeightingClassifierB(redSnapperArrayClassIndexB,3)        = 2.0;
fusionPolicyB2WeightingClassifierB(summerFlounderArrayClassIndexB,4)    = 2.0;
fusionPolicyB2WeightingClassifierB(vermillionSnapperArrayClassIndexB,5) = 2.0;
fusionPolicyB2WeightingClassifierB(whiteBassArrayClassIndexB,6)         = 2.0;

%
fluorClassAPolicyB1 = fusionPolicyB1WeightingClassifierA(1,:);
ramanClassAPolicyB1 = fusionPolicyB1WeightingClassifierA(2,:);
SWIRClassAPolicyB1  = fusionPolicyB1WeightingClassifierA(3,:);
VisClassAPolicyB1   = fusionPolicyB1WeightingClassifierA(4,:);

fluorClassBPolicyB1 = fusionPolicyB1WeightingClassifierB(1,:);
ramanClassBPolicyB1 = fusionPolicyB1WeightingClassifierB(2,:);
SWIRClassBPolicyB1  = fusionPolicyB1WeightingClassifierB(3,:);
VisClassBPolicyB1   = fusionPolicyB1WeightingClassifierB(4,:);

%
fluorClassAPolicyB2 = fusionPolicyB2WeightingClassifierA(1,:);
ramanClassAPolicyB2 = fusionPolicyB2WeightingClassifierA(2,:);
SWIRClassAPolicyB2  = fusionPolicyB2WeightingClassifierA(3,:);
VisClassAPolicyB2   = fusionPolicyB2WeightingClassifierA(4,:);

fluorClassBPolicyB2 = fusionPolicyB2WeightingClassifierB(1,:);
ramanClassBPolicyB2 = fusionPolicyB2WeightingClassifierB(2,:);
SWIRClassBPolicyB2  = fusionPolicyB2WeightingClassifierB(3,:);
VisClassBPolicyB2   = fusionPolicyB2WeightingClassifierB(4,:);

% 
fluorPolicyA = fluorClassAPolicyB1;
fluorPolicyB = fluorClassBPolicyB1;
ramanPolicyA = ramanClassAPolicyB1;
ramanPolicyB = ramanClassBPolicyB1;
SWIRPolicyA  = SWIRClassAPolicyB1;
SWIRPolicyB  = SWIRClassBPolicyB1;
VisPolicyA   = VisClassAPolicyB1;
VisPolicyB   = VisClassBPolicyB1;
        
                               
debug = 0;



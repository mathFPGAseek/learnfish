%%---------------------------------------------------------
% filename:BuildSamplesForMC.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------
<<<<<<< HEAD

min      = 250;
modeArray     = table2cell(tbl_raman);

ArrayForMC = {};
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            blueTilapiaArray,blueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            malabarSnapperArray,malabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            redSnapperArray,redSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            summerFlounderArray,summerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            vermillionSnapperArray,vermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            whiteBassArray,whiteBassCount);

%% ??? FInish this function

function [assembledArrayForMC] = BuildSamplesForMC(tbl_data,ArrayForMC,min,...
                                  fishTypeArray,fishTypeCount)


Test     = table2cell(tbl_data);


tic
% Build MC data for blue Tilapia
blueTilapiaRandomIndex = randsample(fishTypeCount,min);
=======
%{
function [assembledArrayForMC] = BuildSamplesForMC(tbl_data,min,...
                                  blueTilapiaArray,blueTilapiaCount,...
                                  malabarSnapperArray,malabarSnapperCount,...
                                  redSnapperArray,redSnapperCount,...
                                  summerFlounderArray,summerFlounderCount,...
                                  vermillionSnapperArray,vermillionSnapperCount,...
                                  whiteBassArray,whiteBassCount)

%} 
min = 250;
Test     = table2cell(tbl_raman);
ArrayForMC = {};

tic
% Build MC data for blue Tilapia
blueTilapiaRandomIndex = randsample(blueTilapiaCount,min);
>>>>>>> 5731b35796920791182586afbdbf850083ed5ea5
blueTilapiaRandomIndex = blueTilapiaRandomIndex';

for i = 1: min
    index = blueTilapiaRandomIndex(i);
    blueTilapiaTrueIndex = blueTilapiaArray(index); % Simple Value class
    blueTilapiaTrueNumIndex = blueTilapiaTrueIndex.Value;
    cellrow       = Test(blueTilapiaTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end

debug = 0;

% Build MC data for Malabar Snapper
malabarSnapperRandomIndex = randsample(malabarSnapperCount,min);
malabarSnapperRandomIndex = malabarSnapperRandomIndex';

for i = 1: min
    index = malabarSnapperRandomIndex(i);
    malabarSnapperTrueIndex = malabarSnapperArray(index); % Simple Value class
    malabarSnapperTrueNumIndex = malabarSnapperTrueIndex.Value;
    cellrow       = Test(malabarSnapperTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end

debug = 0;

% Build MC data for Red Snapper
redSnapperRandomIndex = randsample(redSnapperCount,min);
redSnapperRandomIndex = redSnapperRandomIndex';

for i = 1: min
    index = redSnapperRandomIndex(i);
    redSnapperTrueIndex = redSnapperArray(index); % Simple Value class
    redSnapperTrueNumIndex = redSnapperTrueIndex.Value;
    cellrow       = Test(redSnapperTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end

debug = 0;

% Build MC data for Summer Flounder
summerFlounderRandomIndex = randsample(summerFlounderCount,min);
summerFlounderRandomIndex = summerFlounderRandomIndex';

for i = 1: min
    index = summerFlounderRandomIndex(i);
    summerFlounderTrueIndex = summerFlounderArray(index); % Simple Value class
    summerFlounderTrueNumIndex = summerFlounderTrueIndex.Value;
    cellrow       = Test(summerFlounderTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end
%toc
debug = 0;

% Build MC data for Vermillion Snapper
vermillionSnapperRandomIndex = randsample(vermillionSnapperCount,min);
vermillionSnapperRandomIndex = vermillionSnapperRandomIndex';

for i = 1: min
    index = vermillionSnapperRandomIndex(i);
    vermillionSnapperTrueIndex = vermillionSnapperArray(index); % Simple Value class
    vermillionSnapperTrueNumIndex = vermillionSnapperTrueIndex.Value;
    cellrow       = Test(vermillionSnapperTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end
%toc
debug = 0;

% Build MC data for White Bass
whiteBassRandomIndex = randsample(whiteBassCount,min);
whiteBassRandomIndex = whiteBassRandomIndex';

for i = 1: min
    index = whiteBassRandomIndex(i);
    whiteBassTrueIndex = whiteBassArray(index); % Simple Value class
    whiteBassTrueNumIndex = whiteBassTrueIndex.Value;
    cellrow       = Test(whiteBassTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end
toc
debug = 0;



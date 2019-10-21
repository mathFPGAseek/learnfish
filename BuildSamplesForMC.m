%%---------------------------------------------------------
% filename:BuildSamplesForMC.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------


min           = 250;
modeArray     = table2cell(tbl_raman);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            blueTilapiaArray,blueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            malabarSnapperArray,malabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
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


function [assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                  fishTypeArray,fishTypeCount)

Test     = modeArray;
RandomIndex = randsample(fishTypeCount,min);
RandomIndex = RandomIndex';


for i = 1: min
    index = RandomIndex(i);
    fishTrueIndex = fishTypeArray(index); % Simple Value class
    fishTrueNumIndex = fishTrueIndex.Value;
    cellrow       = Test(fishTrueNumIndex,:);
    ArrayForMC    = [ ArrayForMC; cellrow];
    debug = 0;
end

debug = 0;
assembledArrayForMC = ArrayForMC;
end




%}

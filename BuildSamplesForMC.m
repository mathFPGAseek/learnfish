%%---------------------------------------------------------
% filename:BuildSamplesForMC.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------
%min           = 250;
%tic
%%----------------------------------------
% Build Monte Carlo Simulation Raman Data
%%----------------------------------------
modeArray     = table2cell(tbl_raman);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramanblueTilapiaArray,ramanblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramanmalabarSnapperArray,ramanmalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramanredSnapperArray,ramanredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramansummerFlounderArray,ramansummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramanvermillionSnapperArray,ramanvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            ramanwhiteBassArray,ramanwhiteBassCount);

assembledRamanArrayForMC = assembledArrayForMC;
debug = 0;

%%----------------------------------------
% Build Monte Carlo Simulation Fluor Data
%%----------------------------------------

modeArray     = table2cell(tbl_Fluorescence);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluorblueTilapiaArray,fluorblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluormalabarSnapperArray,fluormalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluorredSnapperArray,fluorredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluorsummerFlounderArray,fluorsummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluorvermillionSnapperArray,fluorvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            fluorwhiteBassArray,fluorwhiteBassCount);
                                        
assembledFluorArrayForMC = assembledArrayForMC;

%%----------------------------------------
% Build Monte Carlo Simulation SWIR Data
%%----------------------------------------

modeArray     = table2cell(tbl_SWIR);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirblueTilapiaArray,swirblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirmalabarSnapperArray,swirmalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirredSnapperArray,swirredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirsummerFlounderArray,swirsummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirvermillionSnapperArray,swirvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            swirwhiteBassArray,swirwhiteBassCount);
                                        
assembledSWIRArrayForMC = assembledArrayForMC;

%%----------------------------------------
% Build Monte Carlo Simulation Vis Data
%%----------------------------------------

modeArray     = table2cell(tbl_vis);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            visblueTilapiaArray,visblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            vismalabarSnapperArray,vismalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            visredSnapperArray,visredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            vissummerFlounderArray,vissummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            visvermillionSnapperArray,visvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                            viswhiteBassArray,viswhiteBassCount);
                                        
assembledVisArrayForMC = assembledArrayForMC;

%toc

debug = 0;

function [assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,minSampleMeas,...
                                  fishTypeArray,fishTypeCount)

Test     = modeArray;
RandomIndex = randsample(fishTypeCount,minSampleMeas);
RandomIndex = RandomIndex';


for i = 1: minSampleMeas
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

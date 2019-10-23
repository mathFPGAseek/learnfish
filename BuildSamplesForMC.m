%%---------------------------------------------------------
% filename:BuildSamplesForMC.m
% rbd 10/15/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------
min           = 250;
%tic
%%----------------------------------------
% Build Monte Carlo Simulation Raman Data
%%----------------------------------------
modeArray     = table2cell(tbl_raman);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramanblueTilapiaArray,ramanblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramanmalabarSnapperArray,ramanmalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramanredSnapperArray,ramanredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramansummerFlounderArray,ramansummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramanvermillionSnapperArray,ramanvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            ramanwhiteBassArray,ramanwhiteBassCount);

assembledRamanArrayForMC = assembledArrayForMC;
debug = 0;

%%----------------------------------------
% Build Monte Carlo Simulation Fluor Data
%%----------------------------------------

modeArray     = table2cell(tbl_Fluorescence);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluorblueTilapiaArray,fluorblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluormalabarSnapperArray,fluormalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluorredSnapperArray,fluorredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluorsummerFlounderArray,fluorsummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluorvermillionSnapperArray,fluorvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            fluorwhiteBassArray,fluorwhiteBassCount);
                                        
assembledFluorArrayForMC = assembledArrayForMC;

%%----------------------------------------
% Build Monte Carlo Simulation SWIR Data
%%----------------------------------------

modeArray     = table2cell(tbl_SWIR);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirblueTilapiaArray,swirblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirmalabarSnapperArray,swirmalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirredSnapperArray,swirredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirsummerFlounderArray,swirsummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirvermillionSnapperArray,swirvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            swirwhiteBassArray,swirwhiteBassCount);
                                        
assembledSWIRArrayForMC = assembledArrayForMC;

%%----------------------------------------
% Build Monte Carlo Simulation Vis Data
%%----------------------------------------

modeArray     = table2cell(tbl_vis);
ArrayForMC   = {};

[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            visblueTilapiaArray,visblueTilapiaCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            vismalabarSnapperArray,vismalabarSnapperCount);
                                        
ArrayForMC = assembledArrayForMC;

debug = 0;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            visredSnapperArray,visredSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            vissummerFlounderArray,vissummerFlounderCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            visvermillionSnapperArray,visvermillionSnapperCount);

ArrayForMC = assembledArrayForMC;
 
[assembledArrayForMC] = ConstructArrayForMC(modeArray,ArrayForMC,min,...
                                            viswhiteBassArray,viswhiteBassCount);
                                        
assembledVisArrayForMC = assembledArrayForMC;

%toc

debug = 0;

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

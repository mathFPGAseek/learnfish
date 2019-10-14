%%---------------------------------------------------------
% filename:fishClassParser.m
% rbd 10/13/19
% University of North Dakota 
% EE 999 ; Professor Tavakolian
%%---------------------------------------------------------
function [ blueTilapiaCount, ...
           blueTilapiaArray,...
           malabarSnapperCount,...
           malabarSnapperArray,...
           redSnapperCount,...
           redSnapperArray,...
           summerFlounderCount,...
           summerFlounderArray,...
           vermillionSnapperCount,...
           vermillionSnapperArray,...
           whiteBassCount,...
           whiteBassArray] = fishClassParser(tbl_data)
           
TrainMCsamples_array     = table2cell(tbl_data);
NumTrainMCSamples        = size(tbl_data);
NumTrainMCMeas           = NumTrainMCSamples(1);
NumTrainMCDim            = NumTrainMCSamples(2);

blueTilapiaCount       = 0;
malabarSnapperCount    = 0;
redSnapperCount        = 0;
summerFlounderCount    = 0;
vermillionSnapperCount = 0;
whiteBassCount         = 0;
blueTilapiaArray       = SimpleValue.empty(1,0);
malabarSnapperArray    = SimpleValue.empty(1,0);
redSnapperArray        = SimpleValue.empty(1,0);
summerFlounderArray    = SimpleValue.empty(1,0);
vermillionSnapperArray = SimpleValue.empty(1,0);
whiteBassArray         = SimpleValue.empty(1,0);

for i = 1 : NumTrainMCMeas
    
    realDNA = char(TrainMCsamples_array(i,3));
    
    switch  realDNA
        
            case 'Blue_Tilapia'
                blueTilapiaCount = blueTilapiaCount + 1;
                blueTilapiaArray = [blueTilapiaArray, i];
            case 'Malabar_Snapper'
                malabarSnapperCount = malabarSnapperCount + 1;
                malabarSnapperArray = [malabarSnapperArray, i];
            case 'Red_Snapper'
                redSnapperCount = redSnapperCount + 1;
                redSnapperArray = [redSnapperArray, i];
            case 'Summer_flounder'
                summerFlounderCount = summerFlounderCount + 1;
                summerFlounderArray = [summerFlounderArray, i]; 
            case 'Summer_Flounder'
                summerFlounderCount = summerFlounderCount + 1;
                summerFlounderArray = [summerFlounderArray, i];
            case 'Vermilion_snapper'
                vermillionSnapperCount = vermillionSnapperCount + 1;
                vermillionSnapperArray = [vermillionSnapperArray, i];
            case 'Vermilion_Snapper' % Capatialized
                vermillionSnapperCount = vermillionSnapperCount + 1;
                vermillionSnapperArray = [vermillionSnapperArray, i];
            case 'White_Bass'
                whiteBassCount = whiteBassCount + 1;
                whiteBassArray = [whiteBassArray, i];
            otherwise
                warning('Unexpected Fish Type');
    end
end
debug = 0;


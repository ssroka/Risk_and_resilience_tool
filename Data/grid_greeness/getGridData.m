function [nerc_GT] = getGridData()
% note that the row ids for g are currently hardcoded rather than keyword
% searched
% g 
% col1 = grid, col2 = quantity, col3:col32 = year from 2021 to 2050
g_initUnits = readtable('ISO_Summary_all_Grids.xlsx','Sheet','Data');
% the units of CO2 are million short tons = 2000 lbs, 
% and of energy are billion kWh
% so to convert to lbs/MWh we multiply the fraction by
unit_convert = 1e6*2000/(1e9 * 1e-3); % multiply to go to lbs/MWh
g = g_initUnits.Variables*unit_convert;

% get NERC regions

nerc = shaperead("NercRegions_201907.shp");
crs_info = shapeinfo("NercRegions_201907.shp");
nerc_GT = struct2geotable(nerc,'geographic',["Y" "X"],'CoordinateReferenceSystem',crs_info.CoordinateReferenceSystem);

n = size(nerc_GT,1);

nerc_GT.CI_2021 = zeros(n,1);
nerc_GT.CI_2050 = zeros(n,1);

%% TRE
% NERC row 6
% g rows 1 and 2

nerc_GT.CI_2021(6) = g{2,3}/g{1,3};
nerc_GT.CI_2050(6) = g{2,32}/g{1,32};

%% SPP
% NERC row 5
% g rows 33:38

nerc_GT.CI_2021(5) = (g{34,3}/g{33,3}+g{36,3}/g{35,3}+g{38,3}/g{37,3});
nerc_GT.CI_2050(5) = (g{34,32}/g{33,32}+g{36,32}/g{35,32}+g{38,32}/g{37,32});

%% WECC
% NERC row 7
% g rows 39:50
i = 39;
while i<50
    nerc_GT.CI_2021(7) = nerc_GT.CI_2021(7)+ (g{i+1,3}/g{i,3});
    nerc_GT.CI_2050(7) = nerc_GT.CI_2021(7)+  (g{i+1,32}/g{i,32});
    i = i + 2;
end

%% NPCC
% NERC row 2
% g rows 13:18
i = 13;
while i<18
    nerc_GT.CI_2021(2) = nerc_GT.CI_2021(2)+ (g{i+1,3}/g{i,3});
    nerc_GT.CI_2050(2) = nerc_GT.CI_2021(2)+  (g{i+1,32}/g{i,32});
    i = i + 2;
end

%% MISW - MidCon West - MRO
% NERC row 1
% g rows 5 and 6

nerc_GT.CI_2021(6) = g{6,3}/g{5,3};
nerc_GT.CI_2050(6) = g{6,32}/g{5,32};

%% RFC - PJM
% NERC row 3
% g rows 9,10, 19:26

nerc_GT.CI_2021(3) = g{6,3}/g{5,3};
nerc_GT.CI_2050(3) = g{6,32}/g{5,32};

i = 19;
while i<18
    nerc_GT.CI_2021(3) = nerc_GT.CI_2021(3)+ (g{i+1,3}/g{i,3});
    nerc_GT.CI_2050(3) = nerc_GT.CI_2021(3)+  (g{i+1,32}/g{i,32});
    i = i + 2;
end

%% SERC 
% NERC row 4
% g rows 3,4,7,8,11,12, 27:32

nerc_GT.CI_2021(4) = g{4,3}/g{3,3} + g{8,3}/g{7,3} + g{12,3}/g{11,3};
nerc_GT.CI_2050(4) = g{4,32}/g{3,32} + g{8,32}/g{7,32}+ g{12,32}/g{11,32};

i = 19;
while i<18
    nerc_GT.CI_2021(4) = nerc_GT.CI_2021(4)+ (g{i+1,3}/g{i,3});
    nerc_GT.CI_2050(4) = nerc_GT.CI_2021(4)+  (g{i+1,32}/g{i,32});
    i = i + 2;
end


end

















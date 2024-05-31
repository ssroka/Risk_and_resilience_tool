%{
%%%%%%%%%%%%
%
% Copyright (c) 2023 Sydney Sroka, Abigail Idiculla, and the MIT Climate and Sustainability Consortium
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
% IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Created 2022-2023 for the MIT Climate and Sustainability Consortium
% Resilience Pathway 

%%%%%%%%%%%%

CARBON Tool

This is an auxiliary file to get carbon intensity of the grid

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------



function [nerc_GT] = getGridData()
% output is lbs CO2/MWh for each NERC
%
% note that the row ids for g are currently hardcoded rather than keyword
% searched
% g
% col1 = grid, col2 = quantity, col3:col32 = year from 2021 to 2050
g_initUnits = readtable('ISO_Summary_all_Grids.xlsx','Sheet','Data');
% the units of CO2 are million short tons = 2000 lbs,
mil_st2lbs = 1e6*2000; % to convert to lbs
bkwh2mwh=(1e9 * 1e-3); % billion kWh to MWh
g = g_initUnits(:,3:end).Variables;
g(1:2:49,:) = g(1:2:49,:)*bkwh2mwh;
g(2:2:50,:) = g(2:2:50,:)*mil_st2lbs;

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

nerc_GT.CI_2021(6) = g(2,1)/g(1,1);
nerc_GT.CI_2050(6) = g(2,30)/g(1,30);

%% SPP
% NERC row 5
% g rows 33:38
n21 = sum(g([34:2:38],1));
d21 = sum(g([33:2:37],1));
n50 = sum(g([34:2:38],30));
d50 = sum(g([33:2:37],30));

nerc_GT.CI_2021(5) = n21/d21;
nerc_GT.CI_2050(5) = n50/d50;

%% WECC
% NERC row 7
% g rows 39:50
n21 = sum(g([40:2:50],1));
d21 = sum(g([39:2:49],1));
n50 = sum(g([40:2:50],30));
d50 = sum(g([39:2:49],30));

nerc_GT.CI_2021(7) = n21/d21;
nerc_GT.CI_2050(7) = n50/d50;
%% NPCC
% NERC row 2
% g rows 13:18
n21 = sum(g([14:2:18],1));
d21 = sum(g([13:2:17],1));
n50 = sum(g([14:2:18],30));
d50 = sum(g([13:2:17],30));

nerc_GT.CI_2021(2) = n21/d21;
nerc_GT.CI_2050(2) = n50/d50;
%% MISW - MidCon West - MRO
% NERC row 1
% g rows 5 and 6

nerc_GT.CI_2021(1) = g(6,1)/g(5,1);
nerc_GT.CI_2050(1) = g(6,30)/g(5,30);

%% RFC - PJM
% NERC row 3
% g rows 9,10, 19:26
n21 = sum(g([10,20:2:26],1));
d21 = sum(g([9,19:2:25],1));
n50 = sum(g([10,20:2:26],30));
d50 = sum(g([9,19:2:25],30));

nerc_GT.CI_2021(3) = n21/d21;
nerc_GT.CI_2050(3) = n50/d50;
%% SERC
% NERC row 4
% g rows 3,4,7,8,11,12,27:32
n21 = sum(g([4,8,12,28:2:32],1));
d21 = sum(g([3,7,11,27:2:31],1));
n50 = sum(g([4,8,12,28:2:32],30));
d50 = sum(g([3,7,11,27:2:31],30));

nerc_GT.CI_2021(4) = n21/d21;
nerc_GT.CI_2050(4) = n50/d50;


end

















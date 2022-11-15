
clear;close all;clc

cd('..')
add_rm_custom_paths('add');
cd('MATLAB_code')
% County Level Risk Data 
nri_county_struct = shaperead("NRI_Shapefile_Counties.shp",...
    'Attributes', {'AREA','POPULATION', 'STATE',...
    'STATEABBRV', 'COUNTYFIPS',...
    });

crs_info3 = shapeinfo("NRI_Shapefile_Counties.shp");
crs3 = crs_info3.CoordinateReferenceSystem;
nri_county_GT = struct2geotable(nri_county_struct, CoordinateReferenceSystem = crs3);

nri_county_risk = readtable('NRI_COUNTY_A_WEIGHTED.csv','Delimiter', ',');
nri_county_GT = [nri_county_GT nri_county_risk];


% ------------- New county shapefiles -------------
% replace county shapes with more compact shape files from the census
county_struct = shaperead('cb_2021_us_county_20m.shp','Attributes',{'AREA', 'STATE', 'STUSPS', 'COUNTYFP'});
crs_info4 = shapeinfo("cb_2021_us_county_20m.shp");
crs4 = crs_info4.CoordinateReferenceSystem;
county_GT = struct2geotable(county_struct, CoordinateReferenceSystem = crs3); 
C = cell(size(unique(nri_county_GT.STATEABBRV), 1), 2);
state_list = unique(nri_county_GT.STATEABBRV);

    % county_fp = sort(county_GT.COUNTYFP);
    for ii_state = 1:51
        positions = find(strcmp(string(county_GT.STUSPS), string(state_list{ii_state, 1})));
        state_and_counties = county_GT(positions, :);
        counties_in_state = sortrows(state_and_counties.COUNTYFP);
        C{ii_state, 1} = state_and_counties.STUSPS{1,1};
        C{ii_state, 2} = counties_in_state;
        % cell array of state and counties in the state in numerical order
    end
%         
%         for jj = 1:size(nri_county_GT, 1)
%             if isequal(county_GT.STUSPS(ii, 1), nri_county_GT.STATEABBRV(jj, 1)) && isequal(county_GT.COUNTYFP(ii, 1), nri_county_GT.COUNTYFIPS(jj, 1))
%                 nri_county_GT(jj, "Shape") = county_GT(ii, "Shape");
%                 break
%             end
%             
%         end
%   
% 
% writetable(nri_county_GT,'../Data/environmental_social_risks/NEW_NRI_COUNTY_GT.shp')

% cd('..')
% add_rm_custom_paths('remove');
% cd('MATLAB_code')

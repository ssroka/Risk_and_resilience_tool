
% clear;close all;clc
% cd('..')
% addpath(['.' filesep 'MATLAB_code' filesep])
% add_rm_custom_paths('add');
% cd('MATLAB_code')
function [nri_small_county_GT] = get_NRI_thin_counties()


% County Level Risk Data
nri_county_struct = shaperead("NRI_Shapefile_Counties.shp",...
    'Attributes', {'AREA','POPULATION', 'STATE',...
    'STATEABBRV', 'COUNTYFIPS',...
    });

crs_info_nri = shapeinfo("NRI_Shapefile_Counties.shp");
crs_nri = crs_info_nri.CoordinateReferenceSystem;
nri_county_GT = struct2geotable(nri_county_struct, CoordinateReferenceSystem = crs_nri);

N_NRI = size(nri_county_GT,1);

%%  New county shapefiles
% replace county shapes with more compact shape files from the census
small_county_struct = shaperead('cb_2021_us_county_20m.shp','Attributes',{'STATE_NAME','STUSPS', 'COUNTYFP'});
crs_info_sml_cnty = shapeinfo("cb_2021_us_county_20m.shp");
crs_sml_cnty = crs_info_sml_cnty.CoordinateReferenceSystem;
small_county_GT = struct2geotable(small_county_struct,'geographic',["Y","X"], CoordinateReferenceSystem = crs_sml_cnty);

%% convert all of the mappolyshapes to geopolyshapes

newShape_cell_array = cell(N_NRI,1);

for i = 1:N_NRI
    [lat,lon] = projinv(crs_nri,[nri_county_GT.X{1}],[nri_county_GT.Y{1}]);
    newShape = geopolyshape(lat,lon);
    newShape.GeographicCRS = crs_sml_cnty;
    newShape_cell_array{i} = newShape;
end


% The default CRS for the NRI is planar (WGS 84)
% The default CRS for the small county shapes is a geographic (NAD83)
% They need to be the same to swap out the shape in the same geotable so
% we're going to switch
N_small = size(small_county_GT,1);

% dummy_column = repmat(small_county_GT(1,["Shape","Geometry","BoundingBox","X","Y"]),N_NRI,1); % initialize
% dummy_column.Properties.VariableNames = "NewShape";
% % initialize the table with the NRI table
% nri_small_county_GT = [nri_county_GT(:,["Shape","STATEABBRV"]) dummy_column];

nri_small_county_GT = [cell2table(newShape_cell_array) nri_county_GT(:,["STATEABBRV","COUNTYFIPS"])];
nri_small_county_GT.Properties.VariableNames{1} = 'Shape';
% replace the NRI shape files wherever possible with the smaller shape files
for i = 1:N_small
    % find all the places in the small counties table with the state of the ith entry of the  NRI table
    state = strcmp(nri_county_GT.STATEABBRV,small_county_GT.STUSPS{i});
    % find all the places in the small county table with the county number of the ith entry of the  NRI table
    county_number = strcmp(nri_county_GT.COUNTYFIPS,small_county_GT.COUNTYFP{i});
    % find the index of the NRI table that matches the ith index of the small
    % county table
    indx_nri = find(state&county_number);
    if ~isempty(indx_nri)
        nri_small_county_GT(indx_nri,1) = small_county_GT(i,["Shape"]);
    end
end

end

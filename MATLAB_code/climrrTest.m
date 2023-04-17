            % This is just to call this function once to create the ClimRR data,
            % eventually the geotable should just be its own file in the Data folder
            %             get_ClimRR_thin_counties()

             clear;close all;clc
            cd('..')
            addpath(['.' filesep 'MATLAB_code' filesep])
            add_rm_custom_paths('add')
            cd('MATLAB_code')

climrr_county_struct = shaperead("GridCells.shp",...
    'Attributes', {'Crossmodel'});

crs_info_climrr = shapeinfo("GridCells.shp");
crs_climrr = crs_info_climrr.CoordinateReferenceSystem;
climrr_county_GT = struct2geotable(climrr_county_struct, CoordinateReferenceSystem = crs_climrr);

N_climrr = size(climrr_county_GT,1);

%%  New county shapefiles
% replace county shapes with more compact shape files from the census
small_county_struct = shaperead('cb_2021_us_county_20m.shp','Attributes',{'STATE_NAME','STUSPS', 'COUNTYFP'});
crs_info_sml_cnty = shapeinfo("cb_2021_us_county_20m.shp");
crs_sml_cnty = crs_info_sml_cnty.CoordinateReferenceSystem;
small_county_GT = struct2geotable(small_county_struct,'geographic',["Y","X"], CoordinateReferenceSystem = crs_sml_cnty);
N_small = size(small_county_GT,1);

%% convert all of the mappolyshapes to geopolyshapes

newShape_cell_array = cell(N_climrr,3);

ID = readtable('ID.csv');
ID_c = table2cell(ID);

for ii = 1:N_climrr
    for jj = 1:N_small
            if ID_c{ii}==jj
                newShape_cell_array{ii ,1} = small_county_GT{jj, 1}; 
            end
    end
end

disp('end')

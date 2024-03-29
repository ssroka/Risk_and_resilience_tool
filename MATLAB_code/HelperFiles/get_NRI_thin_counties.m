
% cd('..')
% addpath(['.' filesep 'MATLAB_code' filesep])
% add_rm_custom_paths('add')
% cd('MATLAB_code')
% County Level Risk Data
nri_county_struct = shaperead("NRI_Shapefile_Counties.shp");
crs_info_nri = shapeinfo("NRI_Shapefile_Counties.shp");
crs_nri = crs_info_nri.CoordinateReferenceSystem;
nri_county_GT = struct2geotable(nri_county_struct, CoordinateReferenceSystem = crs_nri);

N_NRI = size(nri_county_GT,1);

%%  New county shapefiles
% replace county shapes with more compact shape files from the census
small_county_struct = shaperead('cb_2021_us_county_20m.shp','Attributes',{'STATE_NAME','STUSPS', 'COUNTYFP','COUNTYNS'});
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


% initialize final cell array with the nri shapefiles
Shape = newShape_cell_array;
CountyNS = cell(N_NRI,1);
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
        Shape{indx_nri} = small_county_GT{i,1};
        CountyNS{indx_nri} = small_county_GT.COUNTYNS{i};
    end
end


nri_county_risk_GT = [cell2table(Shape) cell2table(CountyNS) nri_county_GT(:,["SOVI_SCORE", "RESL_SCORE", "POPULATION"])];
% save('../Data/environmental_social_risks/nri_county_risk.mat','nri_county_risk_GT')
shapewrite(nri_county_risk_GT,'../Data/environmental_social_risks/sovi_resl_pop.shp'); 

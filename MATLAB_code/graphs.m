% cd('..')
% addpath(['.' filesep 'MATLAB_code' filesep])
% add_rm_custom_paths('add')
% cd('MATLAB_code')

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

% The default CRS for the NRI is planar (WGS 84)
% The default CRS for the small county shapes is a geographic (NAD83)
% They need to be the same to swap out the shape in the same geotable so
% we're going to switch
N_small = size(small_county_GT,1);

% initialize final cell array with the nri shapefiles
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
        CountyNS{indx_nri} = small_county_GT.COUNTYNS{i};
    end
end

nri_county_risk_GT = [cell2table(CountyNS) nri_county_GT(:,["SOVI_SCORE", "RESL_SCORE", "POPULATION"])];

[Lia,Locb] = ismember(cat(1, small_county_GT.COUNTYNS{:}), cat(1, nri_county_risk_GT.CountyNS{:}), 'rows');
sovi_resl_pop = array2table(zeros(length(Locb), 3), 'VariableNames', {'SOVI_SCORE', 'RESL_SCORE', 'POPULATION'});
for ii = 1:length(Locb)
    if Locb(ii) == 0
        sovi_resl_pop(ii, :) = array2table(NaN(1, 3));
    else
        sovi_resl_pop(ii,1) = nri_county_risk_GT(Locb(ii), 2);
        sovi_resl_pop(ii,2) = nri_county_risk_GT(Locb(ii), 3);
        sovi_resl_pop(ii,3) = nri_county_risk_GT(Locb(ii), 4);
    end
    
end
NDVI_values = load('NDVI_small_county_new.mat').NDVI_mat.NDVI;
correlation_table = [array2table(NDVI_values) sovi_resl_pop];
R = corrplot(correlation_table)
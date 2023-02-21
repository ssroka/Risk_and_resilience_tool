
create_S_mat_flag = false;
create_county_data_flag = true;

addpath('../Data/ClimRR/GridCellsShapefile/')
addpath('../Data/ClimRR/')

if create_S_mat_flag

% ================================================================
%% Create matrix to convert ClimRR pixels to county data
% ================================================================
% County Level Risk Data
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

%N_sml_cnty = size(small_county_GT,1);

%% convert all of the mappolyshapes to geopolyshapes
% takes 30 minutes to run
newShape_cell_array = cell(N_climrr,3);

for i = 1:N_climrr
    [lat,lon] = projinv(crs_climrr,[climrr_county_GT.X{i}],[climrr_county_GT.Y{i}]);
    newShape = geopolyshape(lat,lon);
    newShape.GeographicCRS = crs_sml_cnty;
    newShape_cell_array{i,1} = newShape;
    newShape_cell_array{i,2} = lat;
    newShape_cell_array{i,3} = lon;
end


% The default CRS for the NRI is planar (WGS 84)
% The default CRS for the small county shapes is a geographic (NAD83)
% They need to be the same to swap out the shape in the same geotable so
% we're going to switch
N_small = size(small_county_GT,1);

ID = readtable('ID.csv');
ID_c = table2cell(ID);

Shape = newShape_cell_array;
for ii = 1:N_climrr
    for jj = 1:N_small
            if ID_c{ii}==jj
                Shape{ii ,1} = small_county_GT{jj, 1}; 
            end
    end
end

end

if create_county_data_flag

load('row_col_ind_ClimRR_S','S')

S_mean = S./repmat(sum(S,2),1,size(S,2));

% max seasonal temp
T_max_raw = readtable('AnnualTemperatureMaximum.csv');

T_correct_order = zeros(size(S,2),1);
for i = 1:size(T_max_raw,1)
[~,Loc] = ismember(climrr_county_GT.Crossmodel,T_max_raw.Crossmodel(i,1));

end

T_max_45 = S_mean*T_max.rcp45_midc;
T_max_85 = S_mean*T_max.rcp85_midc;

% no precip
no_prec = readtable('ConsecutiveDayswithNoPrecipitation.csv');

no_prec_45 = S_mean*no_prec.rcp45_midc;
no_prec_85 = S_mean*no_prec.rcp85_midc;

save('climrr_data_2_plot')

% 
% % max seasonal temp
% T_max_seasonal = readtable('SeasonalTemperatureMaximum.csv');
% 
% 

%




end



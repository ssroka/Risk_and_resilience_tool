function [climrr_cell_array] = get_ClimRR_thin_counties()

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

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

N_sml_cnty = size(small_county_GT,1);

%% convert all of the mappolyshapes to geopolyshapes

newShape_cell_array = cell(N_climrr,3);

for i = 1:N_climrr
    [lat,lon] = projinv(crs_climrr,[climrr_county_GT.X{1}],[climrr_county_GT.Y{1}]);
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


%% find which quantities to average over for all of the future risk
ID = zeros(N_climrr,1);

% broken, plz help fix >.<
for i =1:2%N_climrr
    polyin = polyshape(newShape_cell_array{i,3},newShape_cell_array{i,2});
    [x,y] = centroid(polyin);
    for j = 1:N_sml_cnty
        xv = small_county_GT.X{j};
        yv = small_county_GT.Y{j};
        if inpolygon(x,y,xv,yv)
            ID(i) = j;
            break
        end
    end
end



disp('debug')






end


addpath('../USCensus_small_counties/')
addpath('GridCellsShapefile/')
%%

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

climRR_cell_array = cell(N_climrr,3);

for i = 1:N_climrr
    [lat,lon] = projinv(crs_climrr,[climrr_county_GT.X{i}],[climrr_county_GT.Y{i}]);
    newShape = geopolyshape(lat,lon);
    newShape.GeographicCRS = crs_sml_cnty;
    climRR_cell_array{i,1} = newShape;
    climRR_cell_array{i,2} = lat;
    climRR_cell_array{i,3} = lon;
end


% The default CRS for the NRI is planar (WGS 84)
% The default CRS for the small county shapes is a geographic (NAD83)
% They need to be the same to swap out the shape in the same geotable so
% we're going to switch

climrr_2_sm_cnty = spalloc(N_sml_cnty,N_climrr,N_climrr);

row_col_ind = zeros(N_climrr,2);
row_col_ind(:,1) = 1:N_climrr;
for i = 1:N_climrr

    mean_lat = mean(climRR_cell_array{i,2},'omitnan');
    mean_lon = mean(climRR_cell_array{i,3},'omitnan');
    for j = 1:N_sml_cnty
        in_cnty = (mean_lat>small_county_GT.BoundingBox{j,:}(1,2)) &&...
            (mean_lat < small_county_GT.BoundingBox{j,:}(2,2)) &&...
            (mean_lon>small_county_GT.BoundingBox{j,:}(1,1)) &&...
            (mean_lon < small_county_GT.BoundingBox{j,:}(2,1));
        if in_cnty
            row_col_ind(i,2) = j;
            break
        end
    end

end
row_col_ind_nz = row_col_ind;
% not every climRR square got matched into a county's bounding box (5 zeros
% in col 2)
row_col_ind_nz(row_col_ind_nz(:,2)==0,:) = [];

S = sparse(row_col_ind_nz(:,2),row_col_ind_nz(:,1),ones(size(row_col_ind_nz,1),1),N_sml_cnty,N_climrr);
save('row_col_ind_ClimRR_S.mat','row_col_ind','row_col_ind_nz','S','small_county_GT','climRR_cell_array','climrr_county_GT')


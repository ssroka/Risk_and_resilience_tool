small_county_struct = shaperead('cb_2021_us_county_20m.shp');
crs_info_sml_cnty = shapeinfo("cb_2021_us_county_20m.shp");
crs_sml_cnty = crs_info_sml_cnty.CoordinateReferenceSystem;
small_county_GT = struct2geotable(small_county_struct,'geographic',["Y","X"], CoordinateReferenceSystem = crs_sml_cnty);

NDVI_countyns = readtable('CountyNDVI.csv');

NDVI_mat = [small_county_GT NDVI_countyns(:,2)];

save('NDVI_small_county.mat', 'NDVI_mat')
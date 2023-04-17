ccc
addpath ../Data/'DAC Shapefiles (v2022c)'/
%%


shp_file_str ="DAC Shapefiles (v2022c).shp";

s = shaperead(shp_file_str);
crs_info = shapeinfo(shp_file_str);
crs = crs_info.CoordinateReferenceSystem;
try
s_GT = struct2geotable(s,'geographic',["Y" "X"],CoordinateReferenceSystem = crs);
catch
s_GT = struct2geotable(s,CoordinateReferenceSystem = crs);
end
%%
% geoplot(s_GT)

DAC_id = find(s_GT.DACSTS);

geoplot(s_GT(DAC_id,:))

DAC_GT = s_GT(DAC_id,:);
%%
save('../Data/DAC Shapefiles (v2022c)/DAC.mat','DAC_GT')

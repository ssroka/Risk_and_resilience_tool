ccc
% p = shaperead('Rail_wgs_84_project_4326.shp');
% info = shapeinfo('Rail_wgs_84_project_4326.shp');
% p_GT =
% struct2geotable(p,"geographic",["Y","X"],'CoordinateReferenceSystem',geocrs(4326));%
% exported from lambert to geographic wgs 84
% geoplot(p_GT)
% 
% rail_GT = p_GT;
% 
% save('rail_GT',"rail_GT")
% https://www.bts.gov/newsroom/rail-network-spatial-dataset


ccc
p = shaperead('Electric_Power_Transmission_Lines_shp.shp');
info = shapeinfo('Electric_Power_Transmission_Lines_shp.shp');
p_GT = struct2geotable(p,"geographic",["Y","X"],'CoordinateReferenceSystem',geocrs(4326));% using WGS 84 
geoplot(p_GT)

electric_GT = p_GT;

save('electric_GT',"electric_GT")

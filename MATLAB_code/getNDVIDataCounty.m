% replace state shapes with more compact shape files from the census
small_county_struct = shaperead('cb_2021_us_county_20m.shp');
crs_info_sml_cnty = shapeinfo("cb_2021_us_county_20m.shp");
crs_sml_cnty = crs_info_sml_cnty.CoordinateReferenceSystem;
small_county_GT = struct2geotable(small_county_struct,'geographic',["Y","X"], CoordinateReferenceSystem = crs_sml_cnty);

%appedn
fid = fopen('countyns.csv','w');


for j = 1:length(small_county_GT.COUNTYNS)

    if j == 1
str = sprintf('[{''CountyID'':%s,''LonLat'': ''(',small_county_GT.COUNTYNS{j});
    else
        str = [str sprintf('\n{''CountyID'':%s,''LonLat'': ''(',small_county_GT.COUNTYNS{j})];
    end

for i = 1:length(small_county_GT.X{j})
    str = [str sprintf('%0.2f %0.2f',small_county_GT.X{j}(i),small_county_GT.Y{j}(i))];
    if i<length(small_county_GT.X{j})
        str = [str ','];
    end
end

str = [str ')''},'];

end

str = [str ']'];

fprintf(fid,str);

fclose(fid)
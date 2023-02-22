%%  New county shapefiles
addpath('../Data/USCensus_small_counties/')
addpath('../Data/point_sources/')
% replace county shapes with more compact shape files from the census
small_county_struct = shaperead('cb_2021_us_county_20m.shp','Attributes',{'STATE_NAME','STUSPS', 'COUNTYFP','COUNTYNS'});
crs_info_sml_cnty = shapeinfo("cb_2021_us_county_20m.shp");
crs_sml_cnty = crs_info_sml_cnty.CoordinateReferenceSystem;
small_county_GT = struct2geotable(small_county_struct,'geographic',["Y","X"], CoordinateReferenceSystem = crs_sml_cnty);

pwrplnt = readtable("EPA_flight_GHG_powerplants_data.xls");
pwrplnt_GT = table2geotable(pwrplnt);
N_pt_src = size(pwrplnt_GT,1);

CountyNS = cell(N_pt_src,1);
CountyNS(:) = {''};
for i = 1:N_pt_src
    for j = 1:size(small_county_GT,1)
        IN = inpolygon(pwrplnt_GT.LONGITUDE(i),pwrplnt_GT.LATITUDE(i),small_county_GT.X{j}(1:end-1),small_county_GT.Y{j}(1:end-1));
        if IN
            CountyNS{i} = small_county_GT.COUNTYNS{j};
            break
        end
    end
end
% for i = 1:N_pt_src
% isdouble(CountyNS{i})
% end

pwrplnt_county_GT = [pwrplnt_GT cell2table(CountyNS)];
save('../Data/point_sources/pwrplnt_county_GT.mat','pwrplnt_county_GT')


cmntplnt = readtable("EPA_flight_GHG_cementplants_data.xls");
cmntplnt_GT = table2geotable(cmntplnt);
N_pt_src = size(cmntplnt_GT,1);

CountyNS = cell(N_pt_src,1);
CountyNS(:) = {''};
for i = 1:N_pt_src
    for j = 1:size(small_county_GT,1)
        IN = inpolygon(cmntplnt_GT.LONGITUDE(i),cmntplnt_GT.LATITUDE(i),small_county_GT.X{j}(1:end-1),small_county_GT.Y{j}(1:end-1));
        if IN
            CountyNS{i} = small_county_GT.COUNTYNS{j};
            break
        end
    end
end

cmntplnt_county_GT = [cmntplnt_GT cell2table(CountyNS)];
save('../Data/point_sources/cmntplnt_county_GT.mat','cmntplnt_county_GT')


ethnlplnt = readtable("EPA_flight_GHG_ethanolplants_data.xls");
ethnlplnt_GT = table2geotable(ethnlplnt);
N_pt_src = size(ethnlplnt_GT,1);

CountyNS = cell(N_pt_src,1);
CountyNS(:) = {''};
for i = 1:N_pt_src
    for j = 1:size(small_county_GT,1)
        IN = inpolygon(ethnlplnt_GT.LONGITUDE(i),ethnlplnt_GT.LATITUDE(i),small_county_GT.X{j}(1:end-1),small_county_GT.Y{j}(1:end-1));
        if IN
            CountyNS{i} = small_county_GT.COUNTYNS{j};
            break
        end
    end
end

ethnlplnt_county_GT = [ethnlplnt_GT cell2table(CountyNS)];
save('../Data/point_sources/ethnlplnt_county_GT.mat','ethnlplnt_county_GT')


steelplnt = readtable("EPA_flight_GHG_ironsteel.xls");
steelplnt_GT = table2geotable(steelplnt);
N_pt_src = size(steelplnt,1);

CountyNS = cell(N_pt_src,1);
CountyNS(:) = {''};
for i = 1:N_pt_src
    for j = 1:size(small_county_GT,1)
        IN = inpolygon(steelplnt_GT.LONGITUDE(i),steelplnt_GT.LATITUDE(i),small_county_GT.X{j}(1:end-1),small_county_GT.Y{j}(1:end-1));
        if IN
            CountyNS{i} = small_county_GT.COUNTYNS{j};
            break
        end
    end
end

steelplnt_county_GT = [steelplnt_GT cell2table(CountyNS)];
save('../Data/point_sources/steelplnt_county_GT.mat','steelplnt_county_GT')



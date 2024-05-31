

clc;clear;close all

load('pwrplnt_county_GT.mat','pwrplnt_county_GT')

load('cmntplnt_county_GT.mat','cmntplnt_county_GT')

load('ethnlplnt_county_GT.mat','ethnlplnt_county_GT')

load('steelplnt_county_GT.mat','steelplnt_county_GT')

county_struct = shaperead('cb_2021_us_county_20m.shp');
info = shapeinfo('cb_2021_us_county_20m.shp');
county_GT = struct2geotable(county_struct,"geographic",["Y" "X"],"CoordinateReferenceSystem",info.CoordinateReferenceSystem);

% assign all of the point sources to counties

for i = 1:4 % point sources
    switch i
        case 1
            T = pwrplnt_county_GT;
            mat_name = 'pwrplnt_county';
        case 2
            T = cmntplnt_county_GT;
            mat_name = 'cmntplnt_county';

        case 3
            T = ethnlplnt_county_GT;
            mat_name = 'ethnlplnt_county';

        case 4
            T = steelplnt_county_GT;
            mat_name = 'steelplnt_county';

    end
    N_pt_src = size(T,1);
    N_cnty = size(county_GT,1);
    C = cell(N_pt_src,1);

    for j = 1:N_pt_src
        % note lon is first
        county_centroid_lon_lat = cell2mat(cellfun(@(x) mean(x),county_GT.BoundingBox,'UniformOutput',false));
        dist_deg = distance([ones(N_cnty,1)*T(j,:).LONGITUDE,ones(N_cnty,1)*T(j,:).LATITUDE,],county_centroid_lon_lat);
        % start with the county with the centroid closest to the point source and
        % test with inpolygon
        [~,inds] = sort(dist_deg);
        for k = 1:N_cnty
            if inpolygon(T(j,:).LONGITUDE,T(j,:).LATITUDE,county_GT.X{inds(k)},county_GT.Y{inds(k)})
                C(j) = county_GT(inds(k),:).COUNTYNS;
                break
            end
        end
    end
    eval(sprintf('%s=C;',mat_name))

    save(sprintf('Data/point_sources/%s.mat',mat_name),mat_name)

end


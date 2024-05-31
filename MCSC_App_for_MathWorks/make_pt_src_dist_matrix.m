

clc;clear;close all

load('pwrplnt_county_GT.mat','pwrplnt_county_GT')

load('cmntplnt_county_GT.mat','cmntplnt_county_GT')

load('ethnlplnt_county_GT.mat','ethnlplnt_county_GT')

load('steelplnt_county_GT.mat','steelplnt_county_GT')

load('injection_sites_GT.mat','injection_sites_GT')


deg2mi = @(x)69*x; % convert degrees to miles
N_inj = size(injection_sites_GT,1);


for i = 1:4 % point sources
    switch i
        case 1
            T = pwrplnt_county_GT;
            mat_name = 'pwrplnt_D_inj';
        case 2
            T = cmntplnt_county_GT;
            mat_name = 'cmntplnt_D_inj';

        case 3
            T = ethnlplnt_county_GT;
            mat_name = 'ethnlplnt_D_inj';

        case 4
            T = steelplnt_county_GT;
            mat_name = 'steelplnt_D_inj';

    end
    N_pt_src = size(T,1);

    D = zeros(N_pt_src,N_inj);

    for j = 1:N_pt_src

        inject_lat_lon = [injection_sites_GT.Latitude injection_sites_GT.Longitude];

        dist_deg = distance([ones(N_inj,1)*T(j,:).LATITUDE,ones(N_inj,1)*T(j,:).LONGITUDE],inject_lat_lon);

        D(j,:) = deg2mi(dist_deg');

    end
    eval(sprintf('%s=D;',mat_name))

    save(sprintf('Data/point_sources/%s.mat',mat_name),mat_name)

end









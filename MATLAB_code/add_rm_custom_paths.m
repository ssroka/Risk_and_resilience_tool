function add_rm_custom_paths(add_rm_string)

custom_paths = {
    "../Data/point_sources",
    "../Data/point_sources/PowerPlants_US_EIA.zip",
    "../Data/pipelines",
    "../Data/pipelines/OHWVPA_potential_pipelines_data.zip",
    "../Data/member_facilities",
    "../Data/grid_greeness",
    "../Data/environmental_social_risks",
    "../Data/environmental_social_risks/ClimateZones_IS_EIA.zip",
    "../Data/environmental_social_risks/NRI_Shapefile_States.zip",
    "../Data/environmental_social_risks/NRI_Shapefile_Counties.zip",
    "../Data/environmental_social_risks/NationalRiskIndex_Metadata.zip",
    "../Data/eGRID_subregions",
    "../Data/CO2_basins",
    "../Data/CO2_basins/SedimentaryBasins_US_EIA.zip",
    "../Data/CO2_basins/firecracker_sedimentary_basin_data.zip",
    "../Data/CCUS_infrastructure",
    "../Data/CCUS_infrastructure/National_carbon_capture_technology_data.zip",
    };

switch add_rm_string

    case 'add'
        for i = 1:length(custom_paths)
            addpath(custom_paths{i});
        end

    case 'remove'

        for i = 1:length(custom_paths)
            rmpath(custom_paths{i});
        end

end

end
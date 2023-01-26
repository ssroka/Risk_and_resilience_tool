%{
CARBON Tool

This is an auxiliary file that sets up file paths

Author: Abigail Idiculla
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function add_rm_custom_paths(add_rm_string)

custom_paths = {


    ['.' filesep 'Data' filesep 'point_sources' filesep ],
    ['.' filesep 'Data' filesep 'point_sources' filesep 'PowerPlants_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'USCensus_small_states' filesep ],

    ['.' filesep 'Data' filesep 'population' filesep ],
    ['.' filesep 'Data' filesep 'population' filesep 'ACSDT5Y2020.B01003_2022-07-22T175938' filesep ],
    ['.' filesep 'Data' filesep 'population' filesep 'cb_2021_us_cbsa_20m' filesep ],
    ['.' filesep 'Data' filesep 'population' filesep 'tl_2021_us_cbsa' filesep ],
    ['.' filesep 'Data' filesep 'population' filesep 'tl_2021_us_uac10' filesep ],
    ['.' filesep 'Data' filesep 'population' filesep 'tlgdb_2021_a_us_nationgeo.gdb' filesep ],
    %['.' filesep 'Data' filesep 'population' filesep 'places' filesep ],
    

    ['.' filesep 'Data' filesep 'pipelines' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'Newest_pipelines_data' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'OHWVPA_potential_pipelines_data' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'PetroleumProduct_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'NaturalGas_InterIntrastate_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'HGL_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep  'CrudeOil_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep  'CO2_pipeline_data_DOE' filesep ],
    
    ['.' filesep 'Data' filesep 'member_facilities' filesep ],
    ['.' filesep 'Data' filesep 'NDVI' filesep ],

    ['.' filesep 'Data' filesep 'Roads' filesep ],
    ['.' filesep 'Data' filesep 'Roads' filesep 'Highways_(2019)' filesep],
    
    ['.' filesep 'Data' filesep 'grid_greeness' filesep ],
    ['.' filesep 'Data' filesep 'grid_greeness' filesep 'ISO'],
    ['.' filesep 'Data' filesep 'grid_greeness' filesep 'NERC_Regions'],
    
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Shapefile_States' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Shapefile_Counties' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Shapefile_CensusTracts' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Table_Counties' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NationalRiskIndex_Metadata' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'ClimateZones_US_EIA' filesep ],
    
    ['.' filesep 'Data' filesep 'eGRID_subregions' filesep ],
    
    ['.' filesep 'Data' filesep 'CO2_basins' filesep ],
    
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'SedimentaryBasins_US_EIA' filesep ],
    
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'firecracker_sedimentary_basin_data' filesep ],
    
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Powder_river_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Powder_river_basin_density' filesep ],
    
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Permian_palo_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Permian_palo_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Permian_palo_basin_boundaries' filesep 'SAU_C5045' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Permian_palo_basin_boundaries' filesep 'SAU_C5044' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Permian_palo_basin_boundaries' filesep 'SAU_C5043' filesep ],
        
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Hanna_laramie_shirley_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Hanna_laramie_shirley_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_boundaries' filesep 'SAU_C5049' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_boundaries' filesep 'SAU_C5047' filesep ],
        

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_boundaries' filesep 'SAU_C5037' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_boundaries' filesep 'SAU_C5036' filesep ],
        
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Eastern_mesozoic_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Eastern_mesozoic_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Denver_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Denver_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_boundaries' filesep 'SAU_C5005' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_boundaries' filesep 'SAU_C5004' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Bighorn_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Bighorn_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Atlantic_coastal_plain_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Atlantic_coastal_plain_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_density' filesep 'Cell_C5062' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_density' filesep 'Cell_C5056' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_boundaries' filesep 'SAU_C5062' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Arkoma_kansas_midcontinent_basin_boundaries' filesep 'SAU_C5056' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Alaska_north_slope_kandik_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Alaska_north_slope_kandik_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Alaska_north_slope_kandik_basin_boundaries' filesep 'SAU_C5002_Final' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Alaska_north_slope_kandik_basin_boundaries' filesep 'SAU_C5001_Final' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'South_florida_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'South_florida_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_density' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep 'SAU_C5041' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep 'SAU_C5022' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep 'SAU_C5021' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep 'SAU_C5020' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Southern_rocky_basin_boundaries' filesep 'SAU_C5019' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Williston_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Williston_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CCUS_infrastructure' filesep ],
    ['.' filesep 'Data' filesep 'CCUS_infrastructure' filesep 'National_carbon_capture_technology_data' filesep ],

    ['.' filesep 'Data' filesep 'USCensus_small_counties']
        
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
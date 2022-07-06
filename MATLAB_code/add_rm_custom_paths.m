function add_rm_custom_paths(add_rm_string)

custom_paths = {

    ['.' filesep 'Data' filesep 'point_sources' filesep ],

    ['.' filesep 'Data' filesep 'point_sources' filesep 'PowerPlants_US_EIA' filesep ],
    
    ['.' filesep 'Data' filesep 'pipelines' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'Newest_pipelines_data' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'OHWVPA_potential_pipelines_data' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'PetroleumProduct_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'NaturalGas_InterIntrastate_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep 'HGL_Pipelines_US_EIA' filesep ],
    ['.' filesep 'Data' filesep 'CrudeOil_Pipelines_US_EIA' filesep ],
    
    ['.' filesep 'Data' filesep 'member_facilities' filesep ],
    
    ['.' filesep 'Data' filesep 'grid_greeness' filesep ],
    
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Shapefile_States' filesep ],
    ['.' filesep 'Data' filesep 'environmental_social_risks' filesep 'NRI_Shapefile_Counties' filesep ],
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
        
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Hanna_laramie_shirley_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Hanna_laramie_shirley_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Gulf_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Greater_green_river_basin_density' filesep ],
        
    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Eastern_mesozoic_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Eastern_mesozoic_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Denver_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Denver_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Columbia_basin_density' filesep ],

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

    ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Williston_basin_boundaries' filesep ],
        ['.' filesep 'Data' filesep 'CO2_basins' filesep 'Williston_basin_density' filesep ],

    ['.' filesep 'Data' filesep 'CCUS_infrastructure' filesep ],
    ['.' filesep 'Data' filesep 'CCUS_infrastructure' filesep 'National_carbon_capture_technology_data' filesep ],
        
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
function add_rm_custom_paths(add_rm_string)

custom_paths = {

    ".\Data\point_sources\",

    ".\Data\point_sources\PowerPlants_US_EIA\",
    
    ".\Data\pipelines\",
    ".\Data\pipelines\Newest_pipelines_data",
    ".\Data\pipelines\OHWVPA_potential_pipelines_data\",
    ".\Data\pipelines\PetroleumProduct_Pipelines_US_EIA\",
    ".\Data\pipelines\NaturalGas_InterIntrastate_Pipelines_US_EIA\"
    ".\Data\pipelines\HGL_Pipelines_US_EIA\"
    ".\Data\CrudeOil_Pipelines_US_EIA\"
    
    ".\Data\member_facilities\",
    
    ".\Data\grid_greeness\",
    
    ".\Data\environmental_social_risks\",
    ".\Data\environmental_social_risks\NRI_Shapefile_States\",
    ".\Data\environmental_social_risks\NRI_Shapefile_Counties\",
    ".\Data\environmental_social_risks\NationalRiskIndex_Metadata\",
    ".\Data\environmental_social_risks\ClimateZones_US_EIA\",
    
    ".\Data\eGRID_subregions\",
    
    ".\Data\CO2_basins\",
    
    ".\Data\CO2_basins\SedimentaryBasins_US_EIA",
    
    ".\Data\CO2_basins\firecracker_sedimentary_basin_data",
    
    ".\Data\CO2_basins\Powder_river_basin_boundaries",
        ".\Data\CO2_basins\Powder_river_basin_density",
    
    ".\Data\CO2_basins\Permian_palo_basin_boundaries",
        ".\Data\CO2_basins\Permian_palo_basin_density",
        
    ".\Data\CO2_basins\Hanna_laramie_shirley_basin_boundaries",
        ".\Data\CO2_basins\Hanna_laramie_shirley_basin_density",

    ".\Data\CO2_basins\Gulf_basin_boundaries",
        ".\Data\CO2_basins\Gulf_basin_density",

    ".\Data\CO2_basins\Greater_green_river_basin_boundaries",
        ".\Data\CO2_basins\Greater_green_river_basin_density",
        
    ".\Data\CO2_basins\Eastern_mesozoic_basin_boundaries",
        ".\Data\CO2_basins\Eastern_mesozoic_basin_density",

    ".\Data\CO2_basins\Denver_basin_boundaries",
        ".\Data\CO2_basins\Denver_basin_density",

    ".\Data\CO2_basins\Columbia_basin_boundaries",
        ".\Data\CO2_basins\Columbia_basin_density",

    ".\Data\CO2_basins\Bighorn_basin_boundaries",
        ".\Data\CO2_basins\Bighorn_basin_density",

    ".\Data\CO2_basins\Atlantic_coastal_plain_boundaries",
        ".\Data\CO2_basins\Atlantic_coastal_plain_density",

    ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_boundaries",
        ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_density",
        ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_density\Cell_C5062",
        ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_density\Cell_C5056",
        ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_boundaries\SAU_C5062",
        ".\Data\CO2_basins\Arkoma_kansas_midcontinent_basin_boundaries\SAU_C5056",

    ".\Data\CO2_basins\Alaska_north_slope_kandik_basin_boundaries",
        ".\Data\CO2_basins\Alaska_north_slope_kandik_basin_density",
        ".\Data\CO2_basins\Alaska_north_slope_kandik_basin_boundaries\SAU_C5002_Final",
        ".\Data\CO2_basins\Alaska_north_slope_kandik_basin_boundaries\SAU_C5001_Final",

    ".\Data\CO2_basins\South_florida_basin_boundaries",
        ".\Data\CO2_basins\South_florida_basin_density",

    ".\Data\CO2_basins\Southern_rocky_basin_boundaries",
        ".\Data\CO2_basins\Southern_rocky_basin_density",

    ".\Data\CO2_basins\Williston_basin_boundaries",
        ".\Data\CO2_basins\Williston_basin_density",

    ".\Data\CCUS_infrastructure\",
    ".\Data\CCUS_infrastructure\National_carbon_capture_technology_data",
        
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
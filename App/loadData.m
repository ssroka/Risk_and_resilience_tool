%{
%%%%%%%%%%%%
%
% Copyright (c) 2023 Sydney Sroka, Abigail Idiculla, and the MIT Climate and Sustainability Consortium
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
% IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Created 2022-2023 for the MIT Climate and Sustainability Consortium
% Resilience Pathway 
%
%%%%%%%%%%%%

This is an auxiliary file to load data into the node tree

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function app = loadData(app)

% load in the geotable, store the information in the corresponding Node,
% then clear the geotable to conserve memory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlinks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

app.PointSourcesNode_2.Tag = app.PointSourcesNode_2.Text;
app.PointSourcesNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"; 'FLIGHT provides information ' ...
    'about greenhouse gas (GHG) emissions from large facilities in the U.S. These facilities are required to report annual data ' ...
    'about GHG emissions to EPA as part of the Greenhouse Gas Reporting Program (GHGRP). The GHGRP includes most, but not all, U.S. emissions.' ...
    'Click on the link below for more information.'];
app.PowerPlantsNode_2.Tag = app.PowerPlantsNode_2.Text;
app.PowerPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"; 'This dataset contains power plants ' ...
    'that emit more than 25,000 metric tons of CO2 equivalent (CO2e) per year. Click on the link below for more information.'];
app.CementPlantsNode_2.Tag = app.CementPlantsNode_2.Text;
app.CementPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"; 'This dataset contains cement plants ' ...
    'that emit more than 25,000 metric tons of CO2 equivalent (CO2e) per year. Click on the link below for more information.'];
app.EthanolPlantsNode_2.Tag = app.EthanolPlantsNode_2.Text;
app.EthanolPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"; 'This dataset contains ethanol plants ' ...
    'that emit more than 25,000 metric tons of CO2 equivalent (CO2e) per year. Click on the link below for more information.'];
app.IronandSteelPlantsNode_2.Tag = app.IronandSteelPlantsNode_2.Text;
app.IronandSteelPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"; 'This dataset contains iron and steel plants ' ...
    'that emit more than 25,000 metric tons of CO2 equivalent (CO2e) per year. Click on the link below for more information.'];

app.InjectionSitesNode.Tag = app.InjectionSitesNode.Text;
app.InjectionSitesNode.NodeData = ["https://www.netl.doe.gov/coal/carbon-storage/worldwide-ccs-database";
    "National Energy Technology Laboratory and Department of Energy";
    'This dataset evaluates carbon dioxide (CO2) injection sites for storage.' ...
    'The original dataset also includes information on active, proposed, and terminated CCS projects. Click on the link below for more information.'];

app.MaxSummerDailyAvgTemperatureNode.Tag = app.MaxSummerDailyAvgTemperatureNode.Text;
app.MaxSummerDailyAvgTemperatureNode.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and includes ' ...
    'local data on estimated future annual and seasonal averages of the maximum daily temperatures. ' ...
    'Click on the link below for more information.'];
app.RCP85Node_4.Tag = app.RCP85Node_4.Text;
app.RCP85Node_4.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and includes ' ...
    'local data on estimated future annual and seasonal averages of the maximum daily temperatures according to ' ...
    'RCP4.5 scenario (human GHG emissions peak around 2040, then decline). ' ...
    'Click on the link below for more information.'];
app.ConsecutiveDayswithoutPrecipitationNode_2.Tag = app.ConsecutiveDayswithoutPrecipitationNode_2.Text;
app.ConsecutiveDayswithoutPrecipitationNode_2.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and ' ...
    'includes local data on estimated future drought (consecutive days with no precipitation). ' ...
    'Click on the link below for more information.'];
app.RCP45Node_3.Tag = app.RCP45Node_3.Text;
app.RCP45Node_3.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and ' ...
    'includes local data on estimated future drought (consecutive days with no precipitation) according to ' ...
    'RCP4.5 scenario (human GHG emissions peak around 2040, then decline). ' ...
    'Click on the link below for more information.'];
app.RCP85Node_5.Tag = app.RCP85Node_5.Text;
app.RCP85Node_5.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and' ...
    ' includes local data on estimated future drought (consecutive days with no precipitation) according to ' ...
    'RCP8.5 scenario (human GHG emissions continue to rise throughout the 21st century). ' ...
    'Click on the link below for more information.'];
app.TotalAnnualPrecipitationNode.Tag = app.TotalAnnualPrecipitationNode.Text;
app.TotalAnnualPrecipitationNode.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset is from the Climate Risk and Resilience Portal (ClimRR) and ' ...
    'includes local data on estimated future annual total precipitation. ' ...
    'Click on the link below for more information.'];
app.RCP45Node_4.Tag = app.RCP45Node_4.Text;
app.RCP45Node_4.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset from the Climate Risk and Resilience Portal (ClimRR) and ' ...
    'includes local data on estimated future annual total precipitation according to ' ...
    'RCP8.5 scenario (human GHG emissions continue to rise throughout the 21st century). ' ...
    'Click on the link below for more information.'];
app.RCP85Node_6.Tag = app.RCP85Node_6.Text;
app.RCP85Node_6.NodeData = ["https://www.anl.gov/ccrds/ClimRR";
    "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)";
    'This dataset from the Climate Risk and Resilience Portal (ClimRR) and ' ...
    'includes local data on estimated future annual total precipitation according to ' ...
    'RCP8.5 scenario (human GHG emissions continue to rise throughout the 21st century). ' ...
    'Click on the link below for more information.'];


app.EarthquakeNode_2.Tag = app.EarthquakeNode_2.Text;
app.EarthquakeNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset illustrates United States communities most at risk for earthquakes.' ...
    'Click on the link below for more information.'];
app.DroughtNode_2.Tag = app.DroughtNode_2.Text;
app.DroughtNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index (Drought specifically refers to risk to agriculture)";
    'This National Risk Index dataset illustrates United States communities most at risk for agricultural droughts.' ...
    'Click on the link below for more information.'];
app.HurricaneNode_2.Tag = app.HurricaneNode_2.Text;
app.HurricaneNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset illustrates United States communities most at risk for hurricanes.' ...
    'Click on the link below for more information.'];
app.RiverineFloodingNode_2.Tag = app.RiverineFloodingNode_2.Text;
app.RiverineFloodingNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset illustrates United States communities most at risk for riverine floodings.' ...
    'Click on the link below for more information.'];
app.StrongWindNode_2.Tag = app.StrongWindNode_2.Text;
app.StrongWindNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset illustrates United States communities most at risk for strong winds.' ...
    'Click on the link below for more information.'];
app.WildfireNode_2.Tag = app.WildfireNode_2.Text;
app.WildfireNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset illustrates United States communities most at risk for wildfires.' ...
    'Click on the link below for more information.'];
app.SocialVulnerabilityNode_2.Tag = app.SocialVulnerabilityNode_2.Text;
app.SocialVulnerabilityNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index Social Vulnerability dataset utilizes 16 socioeconomic variables that ' ...
    'contribute to a community s reduced ability to prepare for, respond to, and recover from hazards, to score social vulnerability.' ...
    'The Social Vulnerability score represents the national percentile ranking of social vulnerability for a given county or ' ...
    'Census tract in comparison to all other communities at the same level.' ...
    'Click on the link below for more information.'];
app.CommunityResilienceNode_2.Tag = app.CommunityResilienceNode_2.Text;
app.CommunityResilienceNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This National Risk Index dataset measures Community Resilience, ' ...
    'which is defined by National Institute of Standards and Technology (NIST) as the ability of a community ' ...
    'to prepare for anticipated natural hazards, adapt to changing conditions, and withstand and recover rapidly from disruptions. ' ...
    'Community Resilience represents the relative level of community resilience ' ...
    'in comparison to all other communities at the same level. ' ...
    'Click on the link below for more information.'];
app.PopulationNode_2.Tag = app.PopulationNode_2.Text;
app.PopulationNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index";
    'This population dataset comes from the National Risk Index. ' ...
    'Click on the link below for more information.'];

app.DisadvantagedCommunitiesNode_2.Tag = app.DisadvantagedCommunitiesNode_2.Text;
app.DisadvantagedCommunitiesNode_2.NodeData = ["https://screeningtool.geoplatform.gov/en/"; "Council on Environmental Quality Climate and Economic Justice Screening Tool (CEJST)";
    'This dataset--provided by CEJST--identifies communities that are economically disadvantaged and overburdened by ' ...
    'pollution and underinvestment in housing, transportation, water and wastewater infrastructure, and health care. '...
    'A community qualifies as disadvantaged if the census tract is above the threshold for one or more environmental or climate indicators and the ' ...
    'tract is above the threshold for the socioeconomic indicators. ' ...
    'Click on the link below for more information.'];

app.NDVINode_2.Tag = app.NDVINode_2.Text;
app.NDVINode_2.NodeData = ["https://modis.gsfc.nasa.gov/data/dataprod/mod13.php"; "NASA MODIS Normalized Difference Vegetation Index (NDVI) via IBM's GEODN";
    'This dataset displays consistent spatial and temporal comparisons of vegetation canopy greenness, a composite property of leaf area, chlorophyll and canopy structure.' ...
    'The MODIS vegetation indices are produced on 16-day intervals and at multiple spatial resolutions. ' ...
    'Click on the link below for more information.'];

app.PresentNode_3.Tag = app.PresentNode_3.Text;
app.PresentNode_3.NodeData = ["https://www.eia.gov/outlooks/aeo/supplement/excel/sup_elec.xlsx"; "Energy Information Administration (EIA)";
    'This dataset comes grom the Energy Information Administration Annual Energy Outlook and displays the present carbon intensity of NERC and ISO regions across the US. ' ...
    'Click on the link below for more information.'];
app.Projected2050Node_3.Tag = app.Projected2050Node_3.Text;
app.Projected2050Node_3.NodeData = ["https://www.eia.gov/outlooks/aeo/supplement/excel/sup_elec.xlsx"; "Energy Information Administration (EIA)";
    'This dataset comes grom the Energy Information Administration Annual Energy Outlook and displays the projected carbon intensity of NERC and ISO regions in 2050. ' ...
    'Click on the link below for more information.'];

app.InterstatesNode_2.Tag = app.InterstatesNode_2.Text;
app.InterstatesNode_2.NodeData = ["https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html";
    "U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch";
    'This dataset comes grom the US Census Bureau and displays primary road interstates. ' ...
    'Primary roads are generally divided, limited-access highways within the interstate highway system or under State management, and are distinguished by the presence of interchanges. ' ...
    'These highways are accessible by ramps and may include some toll highways' ...
    'Click on the link below for more information.'];

app.GeologicalReservoirsNode.Tag = app.GeologicalReservoirsNode.Text;
app.GeologicalReservoirsNode.NodeData = ["https://pubs.usgs.gov/ds/774/pdf/DS774.pdf"; "US Geological Survey (USGS)";
    'The USGS provided shapefiles of storage assessment units in sedimentary rocks used for geologic CO2 sequestration. ' ...
    'Click on the link below for more information.'];

app.OperationalNode.Tag = app.OperationalNode.Text;
app.OperationalNode.NodeData = ["https://www.energy.gov/sites/prod/files/2015/04/f22/QER%20Analysis%20-%20A%20Review%20of%20the%20CO2%20Pipeline%20Infrastructure%20in%20the%20U.S_0.pdf";
    "National Energy Technology Laboratory (NETL) and Department of Energy (DOE)";
    'The "Pipelines" layer includes sub layers corresponding to current operational carbon dioxide pipelines as indicated in "A Review of the CO2 Pipeline Infrastructure in the U.S." by the National Energy Technology Laboratory and U.S. Department of Energy' ...
    ' Office of Fossil Energy. Click on the link below for more information.'];
app.PlannedNode.Tag = app.PlannedNode.Text;
app.PlannedNode.NodeData = ["https://www.energy.gov/sites/prod/files/2015/04/f22/QER%20Analysis%20-%20A%20Review%20of%20the%20CO2%20Pipeline%20Infrastructure%20in%20the%20U.S_0.pdf";
    "National Energy Technology Laboratory (NETL) and Department of Energy (DOE)";
    'The "Pipelines" layer includes sub layers corresponding to current operational carbon dioxide pipelines as indicated in "A Review of the CO2 Pipeline Infrastructure in the U.S." by the National Energy Technology Laboratory and U.S. Department of Energy' ...
    ' Office of Fossil Energy. Click on the link below for more information.'];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% point sources
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

app.PowerPlantsNode.Tag = app.PowerPlantsNode.Text;
load('pwrplnt_county_GT.mat','pwrplnt_county_GT')
app.PowerPlantsNode.NodeData = pwrplnt_county_GT;

app.CementPlantsNode.Tag = app.CementPlantsNode.Text;
load('cmntplnt_county_GT.mat','cmntplnt_county_GT')
app.CementPlantsNode.NodeData = cmntplnt_county_GT;

app.EthanolPlantsNode.Tag = app.EthanolPlantsNode.Text;
load('ethnlplnt_county_GT.mat','ethnlplnt_county_GT')
app.EthanolPlantsNode.NodeData = ethnlplnt_county_GT;

app.IronandSteelPlantsNode.Tag = app.IronandSteelPlantsNode.Text;
load('steelplnt_county_GT.mat','steelplnt_county_GT')
app.IronandSteelPlantsNode.NodeData = steelplnt_county_GT;

clear pwrplnt_county_GT cmntplnt_county_GT ethnlplnt_county_GT steelplnt_county_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CCS Infrastructure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

app.InjectionsitesNode.Tag = app.InjectionsitesNode.Text;
load('injection_sites_GT.mat','injection_sites_GT')
app.InjectionsitesNode.NodeData = injection_sites_GT;

clear injection_sites_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ClimRR projected climate risk data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('climrr_county_risk_GT.mat','climrr_county_risk_GT')

app.MaxSummerDailyAvgTemperatureFNode.Tag = app.MaxSummerDailyAvgTemperatureFNode.Text;

app.RCP85Node_2.Tag = app.RCP85Node_2.Text;
app.RCP85Node_2.NodeData =climrr_county_risk_GT(:,["Shape","T_max_85"]);

app.ConsecutiveDayswithoutPrecipitationNode.Tag = app.ConsecutiveDayswithoutPrecipitationNode.Text;

app.RCP45Node.Tag = app.RCP45Node.Text;
app.RCP45Node.NodeData =climrr_county_risk_GT(:,["Shape","no_prec_45"]);

app.RCP85Node.Tag = app.RCP85Node.Text;
app.RCP85Node.NodeData =climrr_county_risk_GT(:,["Shape","no_prec_85"]);

app.TotalAnnualPrecipitationinNode.Tag = 'Total Annual Precipitation [in]';

app.RCP45Node_2.Tag = app.RCP45Node_2.Text;
app.RCP45Node_2.NodeData =climrr_county_risk_GT(:,["Shape","prec_45"]);

app.RCP85Node_3.Tag = app.RCP85Node_3.Text;
app.RCP85Node_3.NodeData =climrr_county_risk_GT(:,["Shape","prec_85"]);

clear climrr_county_risk_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NRI present climate risk data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('nri_county_risk.mat','nri_county_risk_GT');

app.EarthquakeNode.Tag = app.EarthquakeNode.Text;
app.EarthquakeNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","ERQK_RISKR"]);

app.DroughtNode.Tag = app.DroughtNode.Text;
app.DroughtNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","DRGT_RISKR"]);

app.HurricaneNode.Tag = app.HurricaneNode.Text;
app.HurricaneNode.NodeData =   nri_county_risk_GT(:, ["Shape","CountyNS","HRCN_RISKR"]);

app.RiverineFloodingNode.Tag = app.RiverineFloodingNode.Text;
app.RiverineFloodingNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","RFLD_RISKR"]);

app.StrongWindNode.Tag = app.StrongWindNode.Text;
app.StrongWindNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","SWND_RISKR"]);

app.WildfireNode.Tag = app.WildfireNode.Text;
app.WildfireNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","WFIR_RISKR"]);

app.SocialVulnerabilityNode.Tag = app.SocialVulnerabilityNode.Text;
app.SocialVulnerabilityNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","SOVI_RATNG"]);

app.CommunityResilienceNode.Tag = app.CommunityResilienceNode.Text;
app.CommunityResilienceNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","RESL_RATNG"]);

app.PopulationNode.Tag = app.PopulationNode.Text;
app.PopulationNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","POPULATION"]);

clear nri_county_risk_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Disadvantaged Communities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load('CJEST_DAC_C.mat','CJEST_DAC_C');
% app.DACCEQNode.Tag = app.DACCEQNode.Text;
% app.DACCEQNode.NodeData = CJEST_DAC_C;
% 
% clear CJEST_DAC_C

load('CJEST_DAC_T.mat','CJEST_DAC_T');
app.DACtribaloverlapCEQNode.Tag = app.DACtribaloverlapCEQNode.Text;
app.DACtribaloverlapCEQNode.NodeData = CJEST_DAC_T;

clear CJEST_DAC_T

load('DOE_DAC.mat','DOE_DAC');
app.DACScoreDOENode.Tag = app.DACScoreDOENode.Text;
app.DACScoreDOENode.NodeData = DOE_DAC;

clear DOE_DAC

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NDVI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('NDVI_small_county_new.mat','NDVI_mat');
app.NDVINode.Tag = app.NDVINode.Text;
app.NDVINode.NodeData = NDVI_mat;

clear NDVI_mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NERC grid carbon intensity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('nerc_GT.mat','nerc_GT');

app.current2021Node.Tag = app.current2021Node.Text;
app.current2021Node.NodeData = nerc_GT(:,{'Shape','CI_2021'});

app.projected2050Node.Tag = app.projected2050Node.Text;
app.projected2050Node.NodeData = nerc_GT(:,{'Shape','CI_2050'});

clear nerc_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Roads
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('roads_GT_I.mat','roads_GT_I');

app.InterstatesNode.Tag = app.InterstatesNode.Text;
app.InterstatesNode.NodeData = roads_GT_I;

clear roads_GT_I

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CO2 reservoirs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('saline_basin_GT.mat','saline_basin_GT');

app.GeologicalreservoirsNode.Tag = app.GeologicalreservoirsNode.Text;
app.GeologicalreservoirsNode.NodeData = saline_basin_GT;

clear saline_basin_GT

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CO2 pipelines
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% operational --------
load('operational_GT.mat','operational_GT');

app.OperationalPipelinesNode.Tag = app.OperationalPipelinesNode.Text;
app.OperationalPipelinesNode.NodeData = operational_GT;

clear operational_GT

% planned --------
load('planned_GT.mat','planned_GT');

app.PlannedPipelinesNode.Tag = app.PlannedPipelinesNode.Text;
app.PlannedPipelinesNode.NodeData = planned_GT;

clear planned_GT


end
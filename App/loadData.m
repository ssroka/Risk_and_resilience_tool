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
app.PointSourcesNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"];
app.PowerPlantsNode_2.Tag = app.PowerPlantsNode_2.Text;
app.PowerPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"];
app.CementPlantsNode_2.Tag = app.CementPlantsNode_2.Text;
app.CementPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"];
app.EthanolPlantsNode_2.Tag = app.EthanolPlantsNode_2.Text;
app.EthanolPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"];
app.IronandSteelPlantsNode_2.Tag = app.IronandSteelPlantsNode_2.Text;
app.IronandSteelPlantsNode_2.NodeData = ["https://ghgdata.epa.gov/ghgp/main.do"; "Environmental Protection Agency"];

app.InjectionSitesNode.Tag = app.InjectionSitesNode.Text;
app.InjectionSitesNode.NodeData = ["https://www.netl.doe.gov/coal/carbon-storage/worldwide-ccs-database"; "National Energy Technology Laboratory and Department of Energy"];

app.MaxSummerDailyAvgTemperatureNode.Tag = app.MaxSummerDailyAvgTemperatureNode.Text;
app.MaxSummerDailyAvgTemperatureNode.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.RCP85Node_4.Tag = app.RCP85Node_4.Text;
app.RCP85Node_4.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.ConsecutiveDayswithoutPrecipitationNode_2.Tag = app.ConsecutiveDayswithoutPrecipitationNode_2.Text;
app.ConsecutiveDayswithoutPrecipitationNode_2.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.RCP45Node_3.Tag = app.RCP45Node_3.Text;
app.RCP45Node_3.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.RCP85Node_5.Tag = app.RCP85Node_5.Text;
app.RCP85Node_5.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.TotalAnnualPrecipitationNode.Tag = app.TotalAnnualPrecipitationNode.Text;
app.TotalAnnualPrecipitationNode.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.RCP45Node_4.Tag = app.RCP45Node_4.Text;
app.RCP45Node_4.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];
app.RCP85Node_6.Tag = app.RCP85Node_6.Text;
app.RCP85Node_6.NodeData = ["https://www.anl.gov/ccrds/ClimRR"; "Argonne National Laboratory Climate Risk and Resilience Portal Center for Climate Resilience and Decision Science (CCRDS)"];


app.EarthquakeNode_2.Tag = app.EarthquakeNode_2.Text;
app.EarthquakeNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.DroughtNode_2.Tag = app.DroughtNode_2.Text;
app.DroughtNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index (Drought specifically refers to risk to agriculture)"];
app.HurricaneNode_2.Tag = app.HurricaneNode_2.Text;
app.HurricaneNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.RiverineFloodingNode_2.Tag = app.RiverineFloodingNode_2.Text;
app.RiverineFloodingNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.StrongWindNode_2.Tag = app.StrongWindNode_2.Text;
app.StrongWindNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.WildfireNode_2.Tag = app.WildfireNode_2.Text;
app.WildfireNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.SocialVulnerabilityNode_2.Tag = app.SocialVulnerabilityNode_2.Text;
app.SocialVulnerabilityNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.CommunityResilienceNode_2.Tag = app.CommunityResilienceNode_2.Text;
app.CommunityResilienceNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];
app.PopulationNode_2.Tag = app.PopulationNode_2.Text;
app.PopulationNode_2.NodeData = ["https://hazards.fema.gov/nri/"; "FEMA National Risk Index"];

app.DisadvantagedCommunitiesNode_2.Tag = app.DisadvantagedCommunitiesNode_2.Text;
app.DisadvantagedCommunitiesNode_2.NodeData = ["https://screeningtool.geoplatform.gov/en/"; "Council on Environmental Quality Climate and Economic Justice Screening Tool (CEJST)"];

app.NDVINode_2.Tag = app.NDVINode_2.Text;
app.NDVINode_2.NodeData = ["https://modis.gsfc.nasa.gov/data/dataprod/mod13.php"; "NASA MODIS Normalized Difference Vegetation Index (NDVI) via IBM's GEODN"];

app.PresentNode_3.Tag = app.PresentNode_3.Text;
app.PresentNode_3.NodeData = ["https://www.eia.gov/outlooks/aeo/supplement/excel/sup_elec.xlsx"; "Energy Information Administration (EIA)"];
app.Projected2050Node_3.Tag = app.Projected2050Node_3.Text;
app.Projected2050Node_3.NodeData = ["https://www.eia.gov/outlooks/aeo/supplement/excel/sup_elec.xlsx"; "Energy Information Administration (EIA)"];

app.InterstatesNode_2.Tag = app.InterstatesNode_2.Text;
app.InterstatesNode_2.NodeData = ["https://www.census.gov/geographies/mapping-files/time-series/geo/carto-boundary-file.html"; "U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Data Collection and Products Branch"];

app.GeologicalReservoirsNode.Tag = app.GeologicalReservoirsNode.Text;
app.GeologicalReservoirsNode.NodeData = ["https://pubs.usgs.gov/ds/774/pdf/DS774.pdf"; "US Geological Survey (USGS)"];

app.OperationalNode.Tag = app.OperationalNode.Text;
app.OperationalNode.NodeData = ["https://www.energy.gov/sites/prod/files/2015/04/f22/QER%20Analysis%20-%20A%20Review%20of%20the%20CO2%20Pipeline%20Infrastructure%20in%20the%20U.S_0.pdf"; "National Energy Technology Laboratory (NETL) and Department of Energy (DOE)"];
app.PlannedNode.Tag = app.PlannedNode.Text;
app.PlannedNode.NodeData = ["https://www.energy.gov/sites/prod/files/2015/04/f22/QER%20Analysis%20-%20A%20Review%20of%20the%20CO2%20Pipeline%20Infrastructure%20in%20the%20U.S_0.pdf"; "National Energy Technology Laboratory (NETL) and Department of Energy (DOE)"];


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

load('CJEST_DAC_C.mat','CJEST_DAC_C');
app.DACCEQNode.Tag = app.DACCEQNode.Text;
app.DACCEQNode.NodeData = CJEST_DAC_C;

clear CJEST_DAC_C

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
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
% NRI present climate risk data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

load('DAC.mat','DAC_GT');
app.DisadvantagedCommunitiesNode.Tag = app.DisadvantagedCommunitiesNode.Text;
app.DisadvantagedCommunitiesNode.NodeData = DAC_GT;

clear DAC_GT

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
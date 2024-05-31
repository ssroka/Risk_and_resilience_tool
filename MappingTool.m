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

This is the main file for an app that creates an interactive, user-friendly
map to support business decisions regarding CCS and resiliency retrofitting

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
classdef MappingTool < matlab.apps.AppBase
    % This is the base class of an App which contains methods needed by Apps.

    properties(Access = public)
        UIFigure            matlab.ui.Figure                    % initialize figure
        GridLayout          matlab.ui.container.GridLayout      % grid for the GUI
        DataPanel           matlab.ui.container.Panel           % data layers
        MapPanel            matlab.ui.container.Panel           % map
        NDVIPanel           matlab.ui.container.Panel           % filter NDVI
        PointSrcPanel       matlab.ui.container.Panel           % filter point src
        POIPanel            matlab.ui.container.Panel           % filter points of interest
        DataTree            matlab.ui.container.CheckBoxTree    % data layers
        PointSrcNode        matlab.ui.container.TreeNode        % point sources
        PointSrcPwrNode     matlab.ui.container.TreeNode        % power plants
        PointSrcCmtNode     matlab.ui.container.TreeNode        % cement plants
        PointSrcEthNode     matlab.ui.container.TreeNode        % ethanol plants
        PointSrcIrnNode     matlab.ui.container.TreeNode        % iron and steel plants
        CCSNode             matlab.ui.container.TreeNode        % CCS infrastructure
        CCSPipeNode         matlab.ui.container.TreeNode        % CO2 pipelines
        CCSPipeOprNode      matlab.ui.container.TreeNode        % operational pipelines
        CCSPipePlnNode      matlab.ui.container.TreeNode        % planned pipelines
        CCSInjNode          matlab.ui.container.TreeNode        % CO2 injection sites
        CCSSeqNode          matlab.ui.container.TreeNode        % geological sequestraion sites
        NatHazNode          matlab.ui.container.TreeNode        % Natural Hazards
        NatHazEqkNode       matlab.ui.container.TreeNode        % Earthquake
        NatHazDrtNode       matlab.ui.container.TreeNode        % Drought
        NatHazHrcNode       matlab.ui.container.TreeNode        % Hurricane
        NatHazFldNode       matlab.ui.container.TreeNode        % Riverine Flooding
        NatHazWndNode       matlab.ui.container.TreeNode        % Strong Wind
        NatHazWfrNode       matlab.ui.container.TreeNode        % Wildfire
        GridCarbonNode      matlab.ui.container.TreeNode        % Carbon intensity of the electric grid
        GridCarbonTdyNode   matlab.ui.container.TreeNode        % Carbon intensity (present)
        GridCarbonFtrNode   matlab.ui.container.TreeNode        % Carbon intensity (projected, 2050)
        NDVINode            matlab.ui.container.TreeNode        % Normalized Difference Vegetation Index
        SOVINode            matlab.ui.container.TreeNode        % Social Vulnerability Index
        CRINode             matlab.ui.container.TreeNode        % Community Resilience Index
        PopulationNode      matlab.ui.container.TreeNode        % Population
        RoadsNode           matlab.ui.container.TreeNode        % Interstates
        NatHazPrjNode       matlab.ui.container.TreeNode        % Projected natural hazard risk (2050)
        NatHazPrjTempNode   matlab.ui.container.TreeNode        % Avg summer high temp
        NatHazPrjTemp85Node matlab.ui.container.TreeNode        % Avg summer high temp (RCP 8.5)
        NatHazPrjNoPNode    matlab.ui.container.TreeNode        % Consecutive days without precip
        NatHazPrjNoP45Node  matlab.ui.container.TreeNode        % Consecutive days without precip (RCP 4.5)
        NatHazPrjNoP85Node  matlab.ui.container.TreeNode        % Consecutive days without precip (RCP 8.5)
        NatHazPrjTotPNode   matlab.ui.container.TreeNode        % Total annual precipitation [in]
        NatHazPrjTotP45Node matlab.ui.container.TreeNode        % Total annual precipitation [in] (RCP 4.5)
        NatHazPrjTotP85Node matlab.ui.container.TreeNode        % Total annual precipitation [in] (RCP 8.5)
        DACNode             matlab.ui.container.TreeNode        % Disadvantaged Communities
        BioDivNode          matlab.ui.container.TreeNode        % Biodiversity/protected areas

    end

    % Callbacks with handle components
    methods (Access = private)

        function startupFcn(app)
            clear;close all;clc
%             cd('..')
%             addpath(['.' filesep 'MATLAB_code' filesep])
            add_rm_custom_paths('add')
%             cd('MATLAB_code')

            % TURNING OFF POLYLINEZ UNSUPPORTED WARNING
            warning('off','map:shapefile:unsupportedType')
            warning('off', 'map:shapefile:missingDBF')
            warning('off', 'MATLAB:table:ModifiedAndSavedVarnames')
            warning('off', 'MATLAB:handle_graphics:exceptions:SceneNode')
        end

    end

    % Component initialization
    methods (Access = public)

        % Create components
        function createComponents(app)


            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Name = 'Map';
            app.UIFigure.WindowState = 'maximized';


            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure, [12 12]);
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];


            % Create DataPanel
            app.DataPanel = uipanel(app.GridLayout);
            app.DataPanel.FontName = 'Helvetica';
            app.DataPanel.FontSize = 14;
            app.DataPanel.Title = 'Layers';
            app.DataPanel.Layout.Row = [1 4];
            app.DataPanel.Layout.Column = [1 3];
            app.DataPanel.Scrollable = 'on';


            % Create MapPanel
            app.MapPanel = uipanel(app.GridLayout);
            app.MapPanel.FontName = 'Helvetica';
            app.MapPanel.Title = 'Map';
            app.MapPanel.Layout.Row = [1 12];
            app.MapPanel.Layout.Column = [4 12];
            app.MapPanel.Scrollable = 'on';


            % Create GeoAxes
            gx = geoaxes(app.MapPanel, 'Basemap', 'darkwater', 'NextPlot', 'add');
            gx.Title.FontName = 'Helvetica';
            gx.Title.String = 'MCSC Interactive Geospatial Mapping Tool'; % display label, come up with better name
            gx.Title.FontSize = 18;
            gx.Subtitle.String = sprintf('An interactive map to support better business decisions regarding CCS and resiliency retrofitting');
            gx.Subtitle.FontName = 'Helvetica';
            gx.Subtitle.FontSize = 16;
            gx.FontSize = 16;
            gx.Subtitle.FontAngle = 'italic';
            gx.Scalebar.Visible = 'on'; % display scale bar
            gx.Grid = "off"; % no grid (may be distracting)
            % add option to turn grid on
            gx.LatitudeLabel.FontName = 'Helvetica';
            gx.LatitudeLabel.FontSize = 16;
            gx.LongitudeLabel.FontName = 'Helvetica';
            gx.LongitudeLabel.FontSize = 16;
            tlbr = axtoolbar(gx, {'export', 'datacursor', 'stepzoomin', 'stepzoomout', 'restoreview'}); % add differfent options to map toolbar
            addToolbarMapButton(tlbr, "basemap"); % allow user to choose different basemaps for personalized visualization
            geolimits(gx, [10 70], [-180 -30]); % map shows entirety of the USA
            hold(gx,'on')


            % Create NDVIPanel
            app.NDVIPanel = uipanel(app.GridLayout);
            app.NDVIPanel.FontName = 'Helvetica';
            app.NDVIPanel.Title = 'Filter Vegetation Index...';
            app.NDVIPanel.FontSize = 18;
            app.NDVIPanel.Layout.Row = [9 10];
            app.NDVIPanel.Layout.Column = [1 3];
            app.NDVIPanel.Scrollable = 'on';


            % Create PointSrcPanel
            app.PointSrcPanel = uipanel(app.GridLayout);
            app.PointSrcPanel.FontName = 'Helvetica';
            app.PointSrcPanel.Title = 'Filter point sources by ...';
            app.PointSrcPanel.FontSize = 18;
            app.PointSrcPanel.Layout.Row = [5 8];
            app.PointSrcPanel.Layout.Column = [1 3];
            app.PointSrcPanel.Scrollable = 'on';

            % Create POIPanel
            app.POIPanel = uipanel(app.GridLayout);
            app.POIPanel.FontName = 'Helvetica';
            app.POIPanel.Title = 'Check a location ...';
            app.POIPanel.FontSize = 18;
            app.POIPanel.Layout.Row = [11 12];
            app.POIPanel.Layout.Column = [1 3];
            app.POIPanel.Scrollable = 'on';

            % Create DataTree
            app.DataTree = uitree(app.DataPanel, 'checkbox');
            app.DataTree.CheckedNodesChangedFcn = @(src,event) checkchange(src, event, app, gx);
            app.DataTree.FontName = 'Helvetica';

            % Create nodes
            % Node 1 parent
            app.PointSrcNode = uitreenode(app.DataTree);
            app.PointSrcNode.Text = 'Point Source';

            % Node 1 children
            app.PointSrcPwrNode = uitreenode(app.PointSrcNode);
            app.PointSrcPwrNode.Text = 'Power Plants';
            app.PointSrcPwrNode.Tag = 'Power Plants';
            load('pwrplnt_county_GT.mat','pwrplnt_county_GT')
            app.PointSrcPwrNode.NodeData = pwrplnt_county_GT;

            app.PointSrcCmtNode = uitreenode(app.PointSrcNode);
            app.PointSrcCmtNode.Text = 'Cement Plants';
            app.PointSrcCmtNode.Tag = 'Cement Plants';
            load('cmntplnt_county_GT.mat','cmntplnt_county_GT')
            app.PointSrcCmtNode.NodeData = cmntplnt_county_GT;

            app.PointSrcEthNode = uitreenode(app.PointSrcNode);
            app.PointSrcEthNode.Text = 'Ethanol Plants';
            app.PointSrcEthNode.Tag = 'Ethanol Plants';
            load('ethnlplnt_county_GT.mat','ethnlplnt_county_GT')
            app.PointSrcEthNode.NodeData = ethnlplnt_county_GT;

            app.PointSrcIrnNode = uitreenode(app.PointSrcNode);
            app.PointSrcIrnNode.Text = 'Iron and Steel Plants';
            app.PointSrcIrnNode.Tag = 'Iron and Steel Plants';
            load('steelplnt_county_GT.mat','steelplnt_county_GT')
            app.PointSrcIrnNode.NodeData = steelplnt_county_GT;

            % CCS
            app.CCSNode = uitreenode(app.DataTree);
            app.CCSNode.Text = 'CCS Infrastructure';

            app.CCSPipeNode = uitreenode(app.CCSNode);
            app.CCSPipeNode.Text = 'Pipelines';
            app.CCSPipeNode.Tag = 'Pipelines';

            app.CCSPipeOprNode = uitreenode(app.CCSPipeNode);
            app.CCSPipeOprNode.Text = 'Operational Pipelines';
            app.CCSPipeOprNode.Tag = 'Operational Pipelines';
            operational_T = shaperead('operational_pipelines.shp');
            operational_GT = struct2geotable(operational_T,'geographic',["Y" "X"], CoordinateReferenceSystem=geocrs(4269)); %NAD83
            % see link for CRS https://epsg.org/search/by-name?sessionkey=qi7z76madw&searchedTerms=nad83
            app.CCSPipeOprNode.NodeData = operational_GT;

            app.CCSPipePlnNode = uitreenode(app.CCSPipeNode);
            app.CCSPipePlnNode.Text = 'Planned Pipelines';
            app.CCSPipePlnNode.Tag = 'Planned Pipelines';
            planned_T = shaperead('planned_pipelines.shp');
            planned_GT = struct2geotable(planned_T,'geographic',["Y" "X"], CoordinateReferenceSystem=geocrs(4269)); %NAD83
            % see link for CRS https://epsg.org/search/by-name?sessionkey=qi7z76madw&searchedTerms=nad83
            app.CCSPipePlnNode.NodeData = planned_GT;

            app.CCSInjNode = uitreenode(app.CCSNode);
            app.CCSInjNode.Text = 'Injection Sites';
            app.CCSInjNode.Tag = 'Injection Sites';
            njctn = readtable("NETL_CCS_injection_site_data.csv");
            njctn_GT = table2geotable(njctn);
            app.CCSInjNode.NodeData = njctn_GT;

            app.CCSSeqNode = uitreenode(app.CCSNode);
            app.CCSSeqNode.Text = 'Sequestration Reservouir';
            app.CCSSeqNode.Tag = 'Sequestration Reservouir';
            app.CCSSeqNode.NodeData = basinData;


            % Natural Hazards
            app.NatHazNode = uitreenode(app.DataTree);
            app.NatHazNode.Text = 'Natural Hazards';

            load('nri_county_risk.mat','nri_county_risk_GT');
            for i = 1:size(nri_county_risk_GT,1)
                if isa(nri_county_risk_GT.CountyNS{i},'double')
                    nri_county_risk_GT.CountyNS{i} = '';
                end
            end

            app.NatHazNode.NodeData = nri_county_risk_GT;

            app.NatHazEqkNode = uitreenode(app.NatHazNode);
            app.NatHazEqkNode.Text = 'Earthquake';
            app.NatHazEqkNode.Tag = 'Earthquake';
            app.NatHazEqkNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","ERQK_RISKR"]);

            app.NatHazDrtNode = uitreenode(app.NatHazNode);
            app.NatHazDrtNode.Text = 'Drought';
            app.NatHazDrtNode.Tag = 'Drought';
            app.NatHazDrtNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","DRGT_RISKR"]);


            app.NatHazHrcNode = uitreenode(app.NatHazNode);
            app.NatHazHrcNode.Text = 'Hurricane';
            app.NatHazHrcNode.Tag = 'Hurricane';
            app.NatHazHrcNode.NodeData =   nri_county_risk_GT(:, ["Shape","CountyNS","HRCN_RISKR"]);


            app.NatHazFldNode = uitreenode(app.NatHazNode);
            app.NatHazFldNode.Text = 'Riverine Flooding';
            app.NatHazFldNode.Tag = 'Riverine Flooding';
            app.NatHazFldNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","RFLD_RISKR"]);


            app.NatHazWndNode = uitreenode(app.NatHazNode);
            app.NatHazWndNode.Text = 'Strong Wind';
            app.NatHazWndNode.Tag = 'Strong Wind';
            app.NatHazWndNode.NodeData =  nri_county_risk_GT(:, ["Shape","CountyNS","SWND_RISKR"]);


            app.NatHazWfrNode = uitreenode(app.NatHazNode);
            app.NatHazWfrNode.Text = 'Wildfire';
            app.NatHazWfrNode.Tag = 'Wildfire';
            app.NatHazWfrNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","WFIR_RISKR"]);

            % Node 4 parent
            app.GridCarbonNode = uitreenode(app.DataTree);
            app.GridCarbonNode.Text = 'Grid Carbon Intensity [lbs CO2/ MWh]';
            [nerc_GT] = getGridData();
            nerc_GT = nerc_GT(1:end-1,:);% removing the Indeterminate section

            app.GridCarbonNode.NodeData = nerc_GT;

            app.GridCarbonTdyNode = uitreenode(app.GridCarbonNode);
            app.GridCarbonTdyNode.Text = '2021';
            app.GridCarbonTdyNode.Tag = '2021';
            app.GridCarbonTdyNode.NodeData = nerc_GT(:,{'Shape','CI_2021'});

            app.GridCarbonFtrNode = uitreenode(app.GridCarbonNode);
            app.GridCarbonFtrNode.Text = '2050 projection';
            app.GridCarbonFtrNode.Tag = '2021 projection';
            app.GridCarbonFtrNode.NodeData = nerc_GT(:,{'Shape','CI_2050'});

            clear nerc_GT

            % NDVI 
            app.NDVINode = uitreenode(app.DataTree);
            app.NDVINode.Text = 'NDVI';
            NDVI_GT = load('NDVI_small_county_new.mat');
            app.NDVINode.NodeData = NDVI_GT.NDVI_mat;

            % Social Vulnerability 
            app.SOVINode = uitreenode(app.DataTree);
            app.SOVINode.Text = 'Social Vulnerability';
            app.SOVINode.Tag = 'Social Vulnerability';
            app.SOVINode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","SOVI_RATNG"]);
            
            % Community Resilience 
            app.CRINode = uitreenode(app.DataTree);
            app.CRINode.Text = 'Community Resilience';
            app.CRINode.Tag = 'Community Resilience';
            app.CRINode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","RESL_RATNG"]);


            % Population Node
            app.PopulationNode = uitreenode(app.DataTree);
            app.PopulationNode.Text = 'Population';
            app.PopulationNode.Tag = 'Population';
            app.PopulationNode.NodeData = nri_county_risk_GT(:, ["Shape","CountyNS","POPULATION"]);

            clear nri_county_risk_GT

            % Roads
            app.RoadsNode = uitreenode(app.DataTree);
            app.RoadsNode.Text = 'Interstates';
            app.RoadsNode.Tag = 'Interstates';
            load('roads_GT_I.mat','roads_GT_I');
            app.RoadsNode.NodeData = roads_GT_I;

            % NatHazPrjNode
            app.NatHazPrjNode = uitreenode(app.DataTree);
            app.NatHazPrjNode.Text = 'Projected Risk (~2050)';
            load('climrr_county_risk_GT.mat','climrr_county_risk_GT')

            app.NatHazPrjTempNode = uitreenode(app.NatHazPrjNode);
            app.NatHazPrjTempNode.Text = 'Max Daily Summer Avg Temperature';
            app.NatHazPrjTempNode.Tag = 'Max Daily Summer Avg Temperature';

            app.NatHazPrjTemp85Node = uitreenode(app.NatHazPrjTempNode);
            app.NatHazPrjTemp85Node.Text = 'RCP 8.5';
            app.NatHazPrjTemp85Node.Tag = 'RCP 8.5';
            app.NatHazPrjTemp85Node.NodeData =climrr_county_risk_GT(:,["Shape","T_max_85"]);

            app.NatHazPrjNoPNode = uitreenode(app.NatHazPrjNode);
            app.NatHazPrjNoPNode.Text = 'Consecutive Days without Precipitation';
            app.NatHazPrjNoPNode.Tag = 'Consecutive Days without Precipitation';

            app.NatHazPrjNoP45Node = uitreenode(app.NatHazPrjNoPNode);
            app.NatHazPrjNoP45Node.Text = 'RCP 4.5';
            app.NatHazPrjNoP45Node.Tag = 'RCP 4.5';
            app.NatHazPrjNoP45Node.NodeData =climrr_county_risk_GT(:,["Shape","no_prec_45"]);

            app.NatHazPrjNoP85Node = uitreenode(app.NatHazPrjNoPNode);
            app.NatHazPrjNoP85Node.Text = 'RCP 8.5';
            app.NatHazPrjNoP85Node.Tag = 'RCP 8.5';
            app.NatHazPrjNoP85Node.NodeData =climrr_county_risk_GT(:,["Shape","no_prec_85"]);

            app.NatHazPrjTotPNode = uitreenode(app.NatHazPrjNode);
            app.NatHazPrjTotPNode.Text = 'Total Annual Precipitation [in]';
            app.NatHazPrjTotPNode.Tag = 'Total Annual Precipitation [in]';

            app.NatHazPrjTotP45Node = uitreenode(app.NatHazPrjTotPNode);
            app.NatHazPrjTotP45Node.Text = 'RCP 4.5';
            app.NatHazPrjTotP45Node.Tag = 'RCP 4.5';
            app.NatHazPrjTotP45Node.NodeData =climrr_county_risk_GT(:,["Shape","prec_45"]);

            app.NatHazPrjTotP85Node = uitreenode(app.NatHazPrjTotPNode);
            app.NatHazPrjTotP85Node.Text = 'RCP 8.5';
            app.NatHazPrjTotP85Node.Tag = 'RCP 8.5';
            app.NatHazPrjTotP85Node.NodeData =climrr_county_risk_GT(:,["Shape","prec_85"]);

            clear climrr_county_risk_GT

            % DAC Node
            app.DACNode = uitreenode(app.DataTree);
            app.DACNode.Text = 'Disadvantaged Communities';
            app.DACNode.Tag = 'Disadvantaged Communities';
            load('DAC.mat','DAC_GT');
            app.DACNode.NodeData = DAC_GT;

            % Biodiversity Node
            app.BioDivNode = uitreenode(app.DataTree);
            app.BioDivNode.Text = 'Protected Areas';
            app.BioDivNode.Tag = 'Protected Areas';
            load('biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/IBAT.mat','PP_GT_V');
            app.BioDivNode.NodeData = PP_GT_V;


            % Middle panel grid
            gl = uigridlayout(app.PointSrcPanel, [5 7]);
            gl.ColumnSpacing = 5;
            gl.RowSpacing = 5;
            gl.Padding = [5 5 5 5];

            % Distance from CCS
            b_1 = uibutton(gl,'state');
            b_1.FontName = 'Helvetica';
            b_1.FontSize = 14;
            b_1.Text = sprintf('Distance to\nInjection','interpreter','Latex');
            b_1.Tag = 'dist_TF';
            b_1.Layout.Row = 1;
            b_1.Layout.Column = [1 2];

            ef_1 = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on');
            ef_1.FontSize = 14;
            ef_1.Tag = 'dist_num';
            ef_1.Layout.Row = 1;
            ef_1.Layout.Column = [4 5];

            lbl_1_1 = uilabel(gl);
            lbl_1_1.Text = '<';
            lbl_1_1.HorizontalAlignment = 'center';
            lbl_1_1.FontSize = 18;
            lbl_1_1.Layout.Row = 1;
            lbl_1_1.Layout.Column = 3;

            lbl_1_2 = uilabel(gl);
            lbl_1_2.Text = 'miles';
            lbl_1_2.FontSize = 18;
            lbl_1_2.Layout.Row = 1;
            lbl_1_2.Layout.Column = [6 7];

            % NRI
            b_2 = uibutton(gl,'state');
            b_2.FontName = 'Helvetica';
            b_2.FontSize = 14;
            b_2.Text = sprintf('Natural\nHazard Risk','interpreter','Latex');
            b_2.Tag = 'nathaz_TF';
            b_2.Layout.Row = 2;
            b_2.Layout.Column = [1 2];

            dd_2_1 = uidropdown(gl, 'Items', {'None','Earthquake', 'Drought', 'Hurricane','Riverine Flooding', 'Strong Wind', 'Wildfire'},...
                'Editable','off', 'Placeholder', 'Enter risk');
            dd_2_1.FontSize = 14;
            dd_2_1.Tag = 'nathaz_type';
            dd_2_1.Layout.Row = 2;
            dd_2_1.Layout.Column = [4 5];

            dd_2_2 = uidropdown(gl, 'Items', {'None','Very High', 'Relatively High', 'Relatively Moderate', 'Relatively Low', 'Very Low'}, 'Editable', 'off');
            dd_2_2.FontSize = 14;
            dd_2_2.Tag = 'nathaz_level';
            dd_2_2.Layout.Row = 2;
            dd_2_2.Layout.Column = [6 7];

            % CO2 emissions
            b_3 =  uibutton(gl,'state');
            b_3.FontName = 'Helvetica';
            b_3.FontSize = 16;
            b_3.Text = sprintf('Emissions','interpreter','Latex');
            b_3.Tag = 'em_TF';
            b_3.Layout.Row = 3;
            b_3.Layout.Column = [1 2];

            ef_3 = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on');
            ef_3.FontSize = 14;
            ef_3.Tag = 'em_num';
            ef_3.Layout.Row = 3;
            ef_3.Layout.Column = [4 5];

            lbl_3_1 = uilabel(gl);
            lbl_3_1.Text = '>';
            lbl_3_1.HorizontalAlignment = 'center';
            lbl_3_1.FontSize = 18;
            lbl_3_1.Layout.Row = 3;
            lbl_3_1.Layout.Column = 3;

            lbl_3_2 = uilabel(gl);
            lbl_3_2.Text = 'MT CO$_2$e/a';
            lbl_3_2.Interpreter = 'LaTex';
            lbl_3_2.FontName = 'Helvetica';
            lbl_3_2.FontSize = 18;
            lbl_3_2.Layout.Row = 3;
            lbl_3_2.Layout.Column = [6 7];

            % Population
            b_4 =  uibutton(gl,'state');
            b_4.FontName = 'Helvetica';
            b_4.FontSize = 16;
            b_4.Text = sprintf('Population','interpreter','Latex');
            b_4.Tag = 'pop_TF';
            b_4.Layout.Row = 4;
            b_4.Layout.Column = [1 2];

            ef_4 = uieditfield(gl, 'numeric', 'Editable', 'on');
            ef_4.FontSize = 14;
            ef_4.Tag = 'pop_num';
            ef_4.Layout.Row = 4;
            ef_4.Layout.Column = [4 5];

            dd_4 = uidropdown(gl, 'Items', {'<','>'});
            dd_4.FontSize = 18;
            dd_4.Tag = 'pop_gt_lt';
            dd_4.Layout.Row = 4;
            dd_4.Layout.Column = 3;

            lbl_4 = uilabel(gl);
            lbl_4.Text = 'people';
            lbl_4.FontSize = 18;
            lbl_4.Layout.Row = 4;
            lbl_4.Layout.Column = 6;

            % Update Map button
            b = uibutton(gl);
            b.Text = 'Update point sources';
            b.FontSize = 20;
            b.FontName = 'Helvetica';
            b.Layout.Row = 5;
            b.Layout.Column = [1 7];
            b.ButtonPushedFcn =  {@updateMap_point_src, app, gx};

            % Bottom grid panel
            gl_b = uigridlayout(app.NDVIPanel, [2 7]);
            gl_b.ColumnSpacing = 5;
            gl_b.RowSpacing = 5;
            gl_b.Padding = [5 5 5 5];

            % NRI
            b_b1 = uibutton(gl_b,'state');
            b_b1.FontName = 'Helvetica';
            b_b1.FontSize = 14;
            b_b1.Text = sprintf('Natural\nHazard Risk','interpreter','Latex');
            b_b1.Tag = 'nathaz_TF';
            b_b1.Layout.Row = 1;
            b_b1.Layout.Column = [1 2];

            dd_3_1 = uidropdown(gl_b, 'Items', {'None','Earthquake','Drought', 'Hurricane','Riverine Flooding', 'Strong Wind', 'Wildfire'},...
                'Editable','off', 'Placeholder', 'Enter risk');
            dd_3_1.FontSize = 14;
            dd_3_1.Tag = 'nathaz_type';
            dd_3_1.Layout.Row = 1;
            dd_3_1.Layout.Column = [4 5];

            dd_3_2 = uidropdown(gl_b, 'Items', {'None','Very High', 'Relatively High', 'Relatively Moderate', 'Relatively Low', 'Very Low'}, 'Editable', 'off');
            dd_3_2.FontSize = 14;
            dd_3_2.Tag = 'nathaz_level';
            dd_3_2.Layout.Row = 1;
            dd_3_2.Layout.Column = [6 7];

            % Update Map NDVI button
            b_b_NDVI = uibutton(gl_b);
            b_b_NDVI.Text = 'Update NDVI';
            b_b_NDVI.FontSize = 20;
            b_b_NDVI.FontName = 'Helvetica';
            b_b_NDVI.Layout.Row = 2;
            b_b_NDVI.Layout.Column = [1 7];
            b_b_NDVI.ButtonPushedFcn =  {@updateMap_NDVI, app, gx};

            % Lowest grid panel
            gl_B = uigridlayout(app.POIPanel, [2 7]);
            gl_B.ColumnSpacing = 5;
            gl_B.RowSpacing = 5;
            gl_B.Padding = [5 5 5 5];

            % Check a point
            b_lat = uieditfield(gl_B, 'numeric', 'Editable', 'on');
            b_lat.FontSize = 14;
            b_lat.Tag = 'lat';
            b_lat.Layout.Row = 1;
            b_lat.Layout.Column = [1];

            b_lon = uieditfield(gl_B, 'numeric', 'Editable', 'on');
            b_lon.FontSize = 14;
            b_lon.Tag = 'lon';
            b_lon.Layout.Row = 1;
            b_lon.Layout.Column = [2];

            b_rad = uieditfield(gl_B, 'numeric', 'Editable', 'on');
            b_rad.FontSize = 14;
            b_rad.Limits = [0 Inf];
            b_rad.Tag = 'radius';
            b_rad.Layout.Row = 1;
            b_rad.Layout.Column = [3 4];

            dd_3_2 = uidropdown(gl_B, 'Items', {'DAC','Protected Area'}, 'Editable', 'off');
            dd_3_2.FontSize = 14;
            dd_3_2.Tag = 'DAC_PP';
            dd_3_2.Layout.Row = 1;
            dd_3_2.Layout.Column = [6 7];

            % Update Map Check Loc button
            b_b_DAC = uibutton(gl_B);
            b_b_DAC.Text = 'Check Location';
            b_b_DAC.Tag = 'Check Location';
            b_b_DAC.FontSize = 14;
            b_b_DAC.FontName = 'Helvetica';
            b_b_DAC.Layout.Row = 2;
            b_b_DAC.Layout.Column = [6 7];
            b_b_DAC.ButtonPushedFcn =  {@updateMap_checkLoc, app, gx};

            b_b_DAC_clear = uibutton(gl_B);
            b_b_DAC_clear.Text = 'Clear';
            b_b_DAC_clear.Tag = 'Clear';
            b_b_DAC_clear.FontSize = 14;
            b_b_DAC_clear.FontName = 'Helvetica';
            b_b_DAC_clear.Layout.Row = 2;
            b_b_DAC_clear.Layout.Column = [5];
            b_b_DAC_clear.ButtonPushedFcn =  {@updateMap_checkLoc, app, gx};


            b_lbl_lat = uilabel(gl_B);
            b_lbl_lat.Text = 'lat $^\circ$';
            b_lbl_lat.Interpreter = 'LaTex';
            b_lbl_lat.HorizontalAlignment = 'center';
            b_lbl_lat.VerticalAlignment = 'top';
            b_lbl_lat.FontName = 'Helvetica';
            b_lbl_lat.FontSize = 20;
            b_lbl_lat.Layout.Row = 2;
            b_lbl_lat.Layout.Column = [1];

            b_lbl_lon = uilabel(gl_B);
            b_lbl_lon.Text = 'lon $^\circ$';
            b_lbl_lon.Interpreter = 'LaTex';
            b_lbl_lon.FontName = 'Helvetica';
            b_lbl_lon.HorizontalAlignment = 'center';
            b_lbl_lon.VerticalAlignment = 'top';
            b_lbl_lon.FontSize = 20;
            b_lbl_lon.Layout.Row = 2;
            b_lbl_lon.Layout.Column = [2];

            b_lbl_rad = uilabel(gl_B);
            b_lbl_rad.Text = 'radius [mi]';
            b_lbl_rad.HorizontalAlignment = 'center';
            b_lbl_rad.VerticalAlignment = 'top';
            b_lbl_rad.FontSize = 20;
            b_lbl_rad.Layout.Row = 2;
            b_lbl_rad.Layout.Column = [3 4];


            % Display figure only when all components have been created
            app.UIFigure.Visible = 'on';

            % When "update map" button is pushed, get data in filter
            % fields, points currently plotted on the map, and then replot
            % according to new data
            function updateMap_point_src(src, event, app, ax)
                cn = app.DataPanel.Children(1).CheckedNodes;
                pt_srcs = []; % initialize point source layers
                all_layers = get(ax,'Children'); % all plotted data layers
                all_pt_src_names = {app.DataPanel.Children(1).Children(1).Children(:).Text};
                for ii_data_layers = 1:length(all_layers) % loop thorugh all layers and see which are point layers
                    point_type_flag = strcmp(class(all_layers(ii_data_layers)),'map.graphics.chart.primitive.Point');
                    point_source_flag = ismember(all_layers(ii_data_layers).Tag,all_pt_src_names);
                    if point_type_flag && point_source_flag
                        pt_srcs = [pt_srcs;all_layers(ii_data_layers)];
                    end
                end

                if ~isempty(pt_srcs) % don't filter pointlessly

                    % find the index of the child with the corresponding button
                    dist_TF_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'dist_TF'));
                    dist_TF = app.PointSrcPanel.Children.Children(dist_TF_idx);

                    nathaz_TF_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'nathaz_TF'));
                    nathaz_TF = app.PointSrcPanel.Children.Children(nathaz_TF_idx);

                    pop_TF_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'pop_TF'));
                    pop_TF = app.PointSrcPanel.Children.Children(pop_TF_idx);

                    em_TF_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'em_TF'));
                    em_TF = app.PointSrcPanel.Children.Children(em_TF_idx);

                    if dist_TF.Value
                        dist_num_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'dist_num'));
                        dist_num = app.PointSrcPanel.Children.Children(dist_num_idx);
                    end

                    if nathaz_TF.Value
                        nathaz_type_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'nathaz_type'));
                        nathaz_type = app.PointSrcPanel.Children.Children(nathaz_type_idx);
                        nathaz_level_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'nathaz_level'));
                        nathaz_level = app.PointSrcPanel.Children.Children(nathaz_level_idx);

                        nathaz_data_struct = app.DataPanel.Children.Children(3); % Natural hazard data is the third child of the tree
                        nathaz_data_struct_idx = find(strcmp({nathaz_data_struct.Children.Tag},nathaz_type.Value));
                        % the risk levels are in the third column of NodeData
                        state_ids_NH = strcmp(table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(:,3)),nathaz_level.Value);
                        % the state abbreviations are in the second column of NodeData
                        states_2_plot_NH = table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(state_ids_NH,2));
                    else
                        states_2_plot_NH = [];
                    end

                    if pop_TF.Value
                        pop_num_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'pop_num'));
                        pop_num = app.PointSrcPanel.Children.Children(pop_num_idx);

                        pop_gt_lt_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'pop_gt_lt'));
                        pop_gt_lt = app.PointSrcPanel.Children.Children(pop_gt_lt_idx);


                        pop_data_struct = app.DataPanel.Children.Children(8); % Population data is the 8th child of the tree
                        % the risk levels are in the third column of NodeData
                        if strcmp(pop_gt_lt.Value,">")
                            state_ids_pop = pop_data_struct.NodeData.POPULATION>pop_num.Value;
                        else
                            state_ids_pop = pop_data_struct.NodeData.POPULATION<pop_num.Value;
                        end
                        % the state abbreviations are in the second column of NodeData
                        states_2_plot_pop = table2array(pop_data_struct.NodeData(state_ids_pop,2));
                    else
                        states_2_plot_pop = [];
                    end

                    if em_TF.Value
                        em_num_idx = find(strcmp({app.PointSrcPanel.Children.Children(:).Tag}, 'em_num'));
                        em_num = app.PointSrcPanel.Children.Children(em_num_idx);
                    else
                        em_num.Value = NaN;
                    end

                    if ~isempty(states_2_plot_NH) && ~isempty(states_2_plot_pop)
                        states_2_plot = states_2_plot_NH(ismember(states_2_plot_NH,states_2_plot_pop));
                    else
                        states_2_plot = unique([states_2_plot_NH;states_2_plot_pop]);
                    end



                    if nathaz_TF.Value || pop_TF.Value || em_TF.Value || dist_TF.Value
                        for ii_point_srcs = 1:length(pt_srcs)
                            % delete layer
                            cn_idx = find(ismember({cn.Text},pt_srcs(ii_point_srcs).Tag));
                            delete(pt_srcs(ii_point_srcs))
                            % re-plot only filtered points
                            if (nathaz_TF.Value || pop_TF.Value) && ~em_TF.Value &&  ~dist_TF.Value
                                pointLayer(ax, cn(cn_idx),states_2_plot)
                            elseif em_TF.Value  &&  ~dist_TF.Value
                                pointLayer(ax, cn(cn_idx),states_2_plot,em_num.Value*1e6)  % user entry is in Mega metric tons => multiply by 1e6, data is in metric tons
                            else
                                inject_lat_lon = [app.DataPanel.Children.Children(2).Children(2).NodeData.Latitude app.DataPanel.Children.Children(2).Children(2).NodeData.Longitude];
                                pointLayer(ax, cn(cn_idx),states_2_plot,em_num.Value*1e6,dist_num.Value,inject_lat_lon)  % user entry is in Mega metric tons => multiply by 1e6, data is in metric tons
                            end
                        end
                    end
                end

            end
            % When "update map" button is pushed, get data in filter
            % fields, points currently plotted on the map, and then replot
            % according to new data
            function updateMap_NDVI(src, event, app, ax)
                cn = app.DataPanel.Children(1).CheckedNodes;
                poly_src = []; % initialize polygon layers
                all_layers = get(ax,'Children'); % all plotted data layers
                all_pt_src_names = {app.DataPanel.Children(1).Children(1).Children(:).Text};
                for ii_data_layers = 1:length(all_layers) % loop thorugh all layers and see which are polygon layers
                    poly_type_flag = strcmp(class(all_layers(ii_data_layers)),'map.graphics.chart.primitive.Polygon');
                    poly_source_flag = strcmp(all_layers(ii_data_layers).Tag,'NDVI');
                    if poly_type_flag && poly_source_flag
                        poly_src = [poly_src;all_layers(ii_data_layers)];
                    end
                end
                % find the index of the child with the corresponding button
                nathaz_TF_idx = find(strcmp({app.NDVIPanel.Children.Children(:).Tag}, 'nathaz_TF'));
                nathaz_TF = app.NDVIPanel.Children.Children(nathaz_TF_idx);

                if nathaz_TF.Value
                    nathaz_type_idx = find(strcmp({app.NDVIPanel.Children.Children(:).Tag}, 'nathaz_type'));
                    nathaz_type = app.NDVIPanel.Children.Children(nathaz_type_idx);
                    nathaz_level_idx = find(strcmp({app.NDVIPanel.Children.Children(:).Tag}, 'nathaz_level'));
                    nathaz_level = app.NDVIPanel.Children.Children(nathaz_level_idx);

                    nathaz_data_struct = app.DataPanel.Children.Children(3); % Natural hazard data is the third child of the tree
                    nathaz_data_struct_idx = find(strcmp({nathaz_data_struct.Children.Tag},nathaz_type.Value));
                    % the risk levels are in the third column of NodeData
                    state_ids_NH = strcmp(table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(:,3)),nathaz_level.Value);
                    % the state abbreviations are in the second column of NodeData
                    states_2_plot_NH = table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(state_ids_NH,2));
                else
                    states_2_plot_NH = [];
                end

                % no other filters yet, so just set equal
                states_2_plot = states_2_plot_NH;

                if nathaz_TF.Value
                    for ii_poly_srcs = 1:length(poly_src)
                        % delete layer
                        cn_idx = find(ismember({cn.Text},poly_src(ii_poly_srcs).Tag));
                        delete(poly_src(ii_poly_srcs))
                        % re-plot only filtered points
                    end
                    polyLayer(ax, cn(cn_idx),states_2_plot)
                end
            end

            function updateMap_checkLoc(src, event, app, ax)
                all_layers = get(ax,'Children'); % all plotted data layers
                % remove previous circle and point if any
                for ii_data_layers = 1:length(all_layers) % loop thorugh all layers and see which are polygon layers
                    radius_flag = strcmp(all_layers(ii_data_layers).Tag,'CheckLocRad');
                    point_flag = strcmp(all_layers(ii_data_layers).Tag,'CheckLocPt');
                    if radius_flag || point_flag
                        delete(all_layers(ii_data_layers));
                    end
                end
                if strcmp(src.Tag,'Check Location')
                    cn = app.DataPanel.Children(1).CheckedNodes;
                    DAC_PP_idx = find(strcmp({app.POIPanel.Children.Children(:).Tag}, 'DAC_PP'));
                    DAC_PP = app.POIPanel.Children.Children(DAC_PP_idx);
                    
                    if strcmp(DAC_PP.Value,'DAC') % can only be 'DAC','Protected Area'
                        plt_DAC = true;
                        plt_PA = false;
                    else
                        plt_DAC = false;
                        plt_PA = true;
                    end

                    if ~isempty(cn) && plt_DAC
                        for ii_cn = 1:length(cn)
                            if strcmp(cn(ii_cn).Text,'Disadvantaged Communities')
                                plt_DAC = false;
                                break
                            end
                        end
                    end
                    if ~isempty(cn) && plt_PA
                        for ii_cn = 1:length(cn)
                            if strcmp(cn(ii_cn).Text,'Protected Areas')
                                plt_PA = false;
                                break
                            end
                        end
                    end
                    if plt_DAC
                        polyLayer(ax,app.DataPanel.Children(1).Children(11))
                        app.DataPanel.Children(1).CheckedNodes = [app.DataPanel.Children(1).CheckedNodes app.DataPanel.Children(1).Children(11)];
                    end
                    if plt_PA
                        polyLayer(ax,app.DataPanel.Children(1).Children(12))
                        app.DataPanel.Children(1).CheckedNodes = [app.DataPanel.Children(1).CheckedNodes app.DataPanel.Children(1).Children(12)];
                    end

                    lat_num_idx = find(strcmp({app.POIPanel.Children.Children(:).Tag}, 'lat'));
                    lat_num = app.POIPanel.Children.Children(lat_num_idx);
                    lon_num_idx = find(strcmp({app.POIPanel.Children.Children(:).Tag}, 'lon'));
                    lon_num = app.POIPanel.Children.Children(lon_num_idx);
                    rad_num_idx = find(strcmp({app.POIPanel.Children.Children(:).Tag}, 'radius'));
                    rad_num = app.POIPanel.Children.Children(rad_num_idx);
                    r = rad_num.Value/69.0; % convert miles to degrees

                    % plot new circle and point
                    th_vec = linspace(0,2*pi);
                    geoplot(ax,r*sin(th_vec)+lat_num.Value,r*cos(th_vec)+lon_num.Value,...
                        'r','linewidth',2,'Tag', 'CheckLocRad','displayname','radius')
                    geoplot(ax,lat_num.Value,lon_num.Value,...
                        'ro','MarkerFaceColor','r','linewidth',2,'Tag', 'CheckLocPt','displayname','location')
                    geolimits(ax, [-2 2]*r+lat_num.Value, [-2 2]*r+lon_num.Value)

                end
            end


            % Function that plots/deletes when checkbox is
            % selected/deselected
            function checkchange(src, event, app, ax)
                nodes = event.LeafCheckedNodes;
                objs = get(ax, 'Children');

                % if there are checked boxes
                if ~isempty(nodes)

                    % find the names of everything that is checked
                    names = {nodes(:).Text};

                    % loop through the children
                    for kk = 1:length(objs)

                        % if a child and the box of the same name isn't checked, delete the object
                        if ~ismember(objs(kk).Tag, names)
                            delete(objs(kk))
                        end

                    end

                    % for each node (i.e. checked box) see if the object is already plotted, and if not plot it
                    for mm = 1:length(nodes)
                        data2plot = findobj(ax, 'Tag', nodes(mm).Text);

                        if isempty(data2plot)

                            % IN DEVELOPMENT
                            % plot if the node has point geometry
                            if strcmp(nodes(mm).NodeData.Shape.Geometry, "point")
                                pointLayer(ax, nodes(mm))

                                % plot if the node has polygon geometry
                            elseif strcmp(nodes(mm).NodeData.Shape.Geometry, "polygon")
                                polyLayer(ax, nodes(mm))

                                % plot lines
                            else
                                lineLayer(ax, nodes(mm), event)

                            end
                            legend(ax,'-dynamiclegend','Fontsize',18)

                        end

                    end

                    % if there are no checked boxes, delete all objects
                else

                    for kk = 1:length(objs)
                        delete(objs(kk))

                    end

                end
            end
        end
    end


    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = MappingTool

            % Execute startup function
            runStartupFcn(app, @startupFcn)

            % Create UIFigure and components
            createComponents(app)

        end

        function delete(app)
            % remove custom paths
            add_rm_custom_paths('remove');
            delete(app.UIFigure);
            disp('path removed')
        end

    end
end




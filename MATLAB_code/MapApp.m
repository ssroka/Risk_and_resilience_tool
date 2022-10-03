classdef MapApp < matlab.apps.AppBase
    % MapApp This is the base class of an App which contains methods needed by Apps.

    properties(Access = public)
        UIFigure    matlab.ui.Figure
        GridLayout  matlab.ui.container.GridLayout
        LeftPanel matlab.ui.container.Panel
        RightPanel matlab.ui.container.Panel
        BottomPanel matlab.ui.container.Panel
        MiddlePanel matlab.ui.container.Panel
        Tree      matlab.ui.container.CheckBoxTree
        Node1      matlab.ui.container.TreeNode
        Node1_1      matlab.ui.container.TreeNode
        Node1_2      matlab.ui.container.TreeNode
        Node1_3      matlab.ui.container.TreeNode
        Node1_4      matlab.ui.container.TreeNode
        Node2     matlab.ui.container.TreeNode
        Node2_1     matlab.ui.container.TreeNode
        Node2_2     matlab.ui.container.TreeNode
        Node2_3     matlab.ui.container.TreeNode
        Node3     matlab.ui.container.TreeNode
        Node3_4     matlab.ui.container.TreeNode
        Node3_8     matlab.ui.container.TreeNode
        Node3_12     matlab.ui.container.TreeNode
        Node3_13     matlab.ui.container.TreeNode
        Node3_17     matlab.ui.container.TreeNode
        Node4     matlab.ui.container.TreeNode
        Node5      matlab.ui.container.TreeNode
        Node6     matlab.ui.container.TreeNode
        Node8     matlab.ui.container.TreeNode
    end

    % Callbacks with handle components
    methods (Access = private)

        function startupFcn(app)
            clear;close all;clc
            cd('..')
            addpath(['.' filesep 'MATLAB_code' filesep])
            add_rm_custom_paths('add')
            cd('MATLAB_code')

            % TURNING OFF POLYLINEZ UNSUPPORTED WARNING
            warning('off','map:shapefile:unsupportedType')
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
            app.GridLayout = uigridlayout(app.UIFigure, [7 12]);
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];


            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.FontName = 'Helvetica';
            app.LeftPanel.FontSize = 14;
            app.LeftPanel.Title = 'Layers';
            app.LeftPanel.Layout.Row = [1 2];
            app.LeftPanel.Layout.Column = [1 3];
            app.LeftPanel.Scrollable = 'on';


            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.FontName = 'Helvetica';
            app.RightPanel.Title = 'Map';
            app.RightPanel.Layout.Row = [1 7];
            app.RightPanel.Layout.Column = [4 12];
            app.RightPanel.Scrollable = 'on';


            % Create GeoAxes
            gx = geoaxes(app.RightPanel, 'Basemap', 'darkwater', 'NextPlot', 'add');
            gx.Title.FontName = 'Helvetica';
            gx.Title.String = 'Map'; % display label, come up with better name
            gx.Title.FontSize = 18;
            gx.Subtitle.String = sprintf('An interactive, user friendly map to display relevant power sector data\n and support better business decisions regarding CCS and resiliency retrofitting');
            gx.Subtitle.FontName = 'Helvetica';
            gx.Subtitle.FontSize = 16;
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


            % Create BottomPanel
            app.BottomPanel = uipanel(app.GridLayout);
            app.BottomPanel.FontName = 'Helvetica';
            app.BottomPanel.Title = 'Calculator';
            app.BottomPanel.Layout.Row = [6 7];
            app.BottomPanel.Layout.Column = [1 3];
            app.BottomPanel.Scrollable = 'on';


            % Create MiddlePanel
            app.MiddlePanel = uipanel(app.GridLayout);
            app.MiddlePanel.FontName = 'Helvetica';
            app.MiddlePanel.Title = 'Filter point sources by ...';
            app.MiddlePanel.Layout.Row = [3 5];
            app.MiddlePanel.Layout.Column = [1 3];
            app.MiddlePanel.Scrollable = 'on';

            % Create Tree
            app.Tree = uitree(app.LeftPanel, 'checkbox');
            app.Tree.CheckedNodesChangedFcn = @(src,event) checkchange(src, event, app, gx);
            app.Tree.FontName = 'Helvetica';

            % Create nodes
            % Node 1 parent
            app.Node1 = uitreenode(app.Tree);
            app.Node1.Text = 'Point Source';

            % Node 1 children
            app.Node1_1 = uitreenode(app.Node1);
            app.Node1_1.Text = 'Power Plants';
            app.Node1_1.Tag = 'Power Plants';
            pwrplnt = readtable("EPA_flight_GHG_powerplants_data.xls");
            pwrplnt_GT = table2geotable(pwrplnt);
            app.Node1_1.NodeData = pwrplnt_GT;

            app.Node1_2 = uitreenode(app.Node1);
            app.Node1_2.Text = 'Cement Plants';
            app.Node1_2.Tag = 'Cement Plants';
            cmntplnt = readtable("EPA_flight_GHG_cementplants_data.xls");
            cmntplnt_GT = table2geotable(cmntplnt);
            app.Node1_2.NodeData = cmntplnt_GT;

            app.Node1_3 = uitreenode(app.Node1);
            app.Node1_3.Text = 'Ethanol Plants';
            app.Node1_3.Tag = 'Ethanol Plants';
            ethnlplnt = readtable("EPA_flight_GHG_ethanolplants_data.xls");
            ethnlplnt_GT = table2geotable(ethnlplnt);
            app.Node1_3.NodeData = ethnlplnt_GT;

            app.Node1_4 = uitreenode(app.Node1);
            app.Node1_4.Text = 'Iron and Steel Plants';
            app.Node1_4.Tag = 'Iron and Steel Plants';
            steelplnt = readtable("EPA_flight_GHG_ironsteel.xls");
            steelplnt_GT = table2geotable(steelplnt);
            app.Node1_4.NodeData = steelplnt_GT;
            % iron and steel plants cannot be filtered yet

            % Node 2 Parent
            app.Node2 = uitreenode(app.Tree);
            app.Node2.Text = 'CCS Infrastructure';

            % Node 2 children
            app.Node2_1 = uitreenode(app.Node2);
            app.Node2_1.Text = 'Pipelines';
            app.Node2_1.Tag = 'Pipelines';
            pplns_GT = readgeotable("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
            app.Node2_1.NodeData = pplns_GT;

            % IN DEVELOPMENT
            app.Node2_2 = uitreenode(app.Node2);
            app.Node2_2.Text = 'Injection Sites';
            app.Node2_2.Tag = 'Injection Sites';
            njctn = readtable("NETL_CCS_injection_site_data.csv");
            njctn_GT = table2geotable(njctn);
            app.Node2_2.NodeData = njctn_GT;

            % IN DEVELOPMENT
            app.Node2_3 = uitreenode(app.Node2);
            app.Node2_3.Text = 'Sequestration Resevouir';
            app.Node2_3.Tag = 'Sequestration Resevouir';
            basinTable = basinData;
            app.Node2_3.NodeData = basinTable;


            % Node 3 Parent
            app.Node3 = uitreenode(app.Tree);
            app.Node3.Text = 'Natural Hazards';

            % --------------State Level Data --------------
            nri_shp = shaperead("NRI_Shapefile_States.shp",...
                'Attributes', {'AREA','STATE', 'STATEABBRV',...
                'POPULATION', 'AREA',...
                });

            crs_info = shapeinfo("NRI_Shapefile_States.shp");

            crs = crs_info.CoordinateReferenceSystem;
            nri_GT = struct2geotable(nri_shp, CoordinateReferenceSystem = crs);
            nri_risk = readtable('NRI_STATE_A_WEIGHTED.csv','Delimiter', ',');
            nri_GT = [nri_GT nri_risk];
            app.Node3.NodeData = nri_GT;

            % Node 3 Children
            app.Node3_4 = uitreenode(app.Node3);
            app.Node3_4.Text = 'Drought';
            app.Node3_4.Tag = 'Drought';
            app.Node3_4.NodeData =  nri_GT(:, ["Shape",'STATEABBRV',"DRGT_RISKR"]);


            app.Node3_8 = uitreenode(app.Node3);
            app.Node3_8.Text = 'Hurricane';
            app.Node3_8.Tag = 'Hurricane';
            app.Node3_8.NodeData =   nri_GT(:, ["Shape",'STATEABBRV',"HRCN_RISKR"]);


            app.Node3_12 = uitreenode(app.Node3);
            app.Node3_12.Text = 'Riverine Flooding';
            app.Node3_12.Tag = 'Riverine Flooding';
            app.Node3_12.NodeData =  nri_GT(:, ["Shape",'STATEABBRV',"RFLD_RISKR"]);


            app.Node3_13 = uitreenode(app.Node3);
            app.Node3_13.Text = 'Strong Wind';
            app.Node3_13.Tag = 'Strong Wind';
            app.Node3_13.NodeData =   nri_GT(:, ["Shape",'STATEABBRV',"SWND_RISKR"]);


            app.Node3_17 = uitreenode(app.Node3);
            app.Node3_17.Text = 'Wildfire';
            app.Node3_17.Tag = 'Wildfire';
            app.Node3_17.NodeData =   nri_GT(:, ["Shape",'STATEABBRV',"WFIR_RISKR"]);

            % Node 4 parent
            app.Node4 = uitreenode(app.Tree);
            app.Node4.Text = 'Power Sector Carbon Intensity [lbs CO2_e / MWh]';
            eGRID_GT = readgeotable("eGRID2020_subregions.shp");
            eGRID_CO2e = readtable("eGRID_CarbonIntensity_EPA.xlsx",...
                'sheet',"SRCO2EQA",...
                'range','B1:J28',...
                'ReadVariableNames',true);
            eGRID_lbs_MWh = readtable("eGRID_CarbonIntensity_EPA.xlsx",...
                'sheet',"lbsperMWhr",...
                'range', 'B2:J29',...
                'ReadVariableNames',true);
            % append CO2e and lbs/MWh to eGRID_GT
            eGRID_GT =  [eGRID_GT eGRID_CO2e eGRID_lbs_MWh];
            app.Node4.NodeData = eGRID_GT;

            % Node 5 parent
            app.Node5 = uitreenode(app.Tree);
            app.Node5.Text = 'Social Vulnerability';
            sovi_GT = nri_GT(:,{'Shape','STATEABBRV','SOVI_RATNG'});
            app.Node5.NodeData = sovi_GT;

            % Node 6 parent
            app.Node6 = uitreenode(app.Tree);
            app.Node6.Text = 'Community Resilience';
            resl_GT = nri_GT(:,{'Shape','STATEABBRV','RESL_RATNG'});
            app.Node6.NodeData = resl_GT;

            % Node 8 Parent
            app.Node8 = uitreenode(app.Tree);
            app.Node8.Text = 'Population';
            app.Node8.Tag = 'Population';
            app.Node8.NodeData = nri_GT(:, ["Shape",'STATEABBRV',"POPULATION"]);

            % Middle panel grid
            gl = uigridlayout(app.MiddlePanel, [6 7]);
            gl.ColumnSpacing = 5;
            gl.RowSpacing = 5;
            gl.Padding = [5 5 5 5];



            % Distance from CCS
            b_1 = uibutton(gl,'state');
            b_1.FontName = 'Helvetica';
            b_1.FontSize = 14;
            b_1.Text = sprintf('Distance from\nInjection Site','interpreter','Latex');
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

            dd_2_1 = uidropdown(gl, 'Items', {'None','Drought', 'Hurricane','Riverine Flooding', 'Strong Wind', 'Wildfire'},...
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
            b_3.FontSize = 18;
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
            lbl_3_2.Text = 'MT CO2e';
            lbl_3_2.FontSize = 18;
            lbl_3_2.Layout.Row = 3;
            lbl_3_2.Layout.Column = [6 7];

            % Population
            b_4 =  uibutton(gl,'state');
            b_4.FontName = 'Helvetica';
            b_4.FontSize = 18;
            b_4.Text = sprintf('Population','interpreter','Latex');
            b_4.Tag = 'pop_TF';
            b_4.Layout.Row = 4;
            b_4.Layout.Column = [1 2];

            ef_4 = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on');
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
            lbl_4.Text = 'million';
            lbl_4.FontSize = 18;
            lbl_4.Layout.Row = 4;
            lbl_4.Layout.Column = 6;

            % Update Map button
            b = uibutton(gl);
            b.Text = 'Update map';
            b.FontSize = 14;
            b.FontName = 'Helvetica';
            b.Layout.Row = 6;
            b.Layout.Column = [1 7];
            b.ButtonPushedFcn =  {@updateMap, app, gx};

            % Display figure only when all components have been created
            app.UIFigure.Visible = 'on';

            % When "update map" button is pushed, get data in filter
            % fields, points currently plotted on the map, and then replot
            % according to new data
            function updateMap(src, event, app, ax)
                cn = app.LeftPanel.Children(1).CheckedNodes;
                pt_srcs = []; % initialize point source layers
                all_layers = get(ax,'Children'); % all plotted data layers
                for ii_data_layers = 1:length(all_layers) % loop thorugh all layers and see which are point layers
                    if strcmp(class(all_layers(ii_data_layers)),'map.graphics.chart.primitive.Point')
                        pt_srcs = [pt_srcs;all_layers(ii_data_layers)];
                    end
                end

                if ~isempty(pt_srcs) % don't filter pointlessly

                    % find the index of the child with the corresponding button
                    dist_TF_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'dist_TF'));
                    dist_TF = app.MiddlePanel.Children.Children(dist_TF_idx);

                    nathaz_TF_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'nathaz_TF'));
                    nathaz_TF = app.MiddlePanel.Children.Children(nathaz_TF_idx);

                    pop_TF_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'pop_TF'));
                    pop_TF = app.MiddlePanel.Children.Children(pop_TF_idx);

                    em_TF_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'em_TF'));
                    em_TF = app.MiddlePanel.Children.Children(em_TF_idx);

                    if dist_TF.Value
                        dist_num_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'dist_num'));
                        dist_num = app.MiddlePanel.Children.Children(dist_num_idx);
                    end

                    if nathaz_TF.Value
                        nathaz_type_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'nathaz_type'));
                        nathaz_type = app.MiddlePanel.Children.Children(nathaz_type_idx);
                        nathaz_level_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'nathaz_level'));
                        nathaz_level = app.MiddlePanel.Children.Children(nathaz_level_idx);

                        nathaz_data_struct = app.LeftPanel.Children.Children(3); % Natural hazard data is the third child of the tree
                        nathaz_data_struct_idx = find(strcmp({nathaz_data_struct.Children.Tag},nathaz_type.Value));
                        % the risk levels are in the third column of NodeData
                        state_ids_NH = strcmp(table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(:,3)),nathaz_level.Value);
                        % the state abbreviations are in the second column of NodeData
                        states_2_plot_NH = table2array(nathaz_data_struct.Children(nathaz_data_struct_idx).NodeData(state_ids_NH,2));
                    else
                        states_2_plot_NH = [];
                    end

                    if pop_TF.Value
                        pop_num_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'pop_num'));
                        pop_num = app.MiddlePanel.Children.Children(pop_num_idx);

                        pop_gt_lt_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'pop_gt_lt'));
                        pop_gt_lt = app.MiddlePanel.Children.Children(pop_gt_lt_idx);


                        pop_data_struct = app.LeftPanel.Children.Children(7); % Population data is the 8th child of the tree
                        % the risk levels are in the third column of NodeData
                        if strcmp(pop_gt_lt.Value,">")
                            state_ids_pop = pop_data_struct.NodeData.POPULATION>pop_num.Value*1e6; % user entry is in millions => multiply by 1e6
                        else
                            state_ids_pop = pop_data_struct.NodeData.POPULATION<pop_num.Value*1e6; % user entry is in millions => multiply by 1e6
                        end
                        % the state abbreviations are in the second column of NodeData
                        states_2_plot_pop = table2array(pop_data_struct.NodeData(state_ids_pop,2));
                    else
                        states_2_plot_pop = [];
                    end

                    if em_TF.Value
                        em_num_idx = find(strcmp({app.MiddlePanel.Children.Children(:).Tag}, 'em_num'));
                        em_num = app.MiddlePanel.Children.Children(em_num_idx);
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
                                inject_lat_lon = [app.LeftPanel.Children.Children(2).Children(2).NodeData.Latitude app.LeftPanel.Children.Children(2).Children(2).NodeData.Longitude];
                                pointLayer(ax, cn(cn_idx),states_2_plot,em_num.Value*1e6,dist_num.Value,inject_lat_lon)  % user entry is in Mega metric tons => multiply by 1e6, data is in metric tons
                            end
                        end
                    end
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
        function app = MapApp

            % Execute startup function
            runStartupFcn(app, @startupFcn)

            % Create UIFigure and components
            createComponents(app)

        end

        %         Code that removes path before app deletion to maximize efficiency and
        %         storage space

        function delete(app)
            cd('..')
            add_rm_custom_paths('remove');
            cd('MATLAB_code')
            delete(app.UIFigure);
            % deletes immediately after creating the figure, but can still
            % plot the data
            % no need to delete figure to delete paths
            disp('path removed')
        end

    end
end




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
        Node2     matlab.ui.container.TreeNode
        Node2_1     matlab.ui.container.TreeNode
        Node2_2     matlab.ui.container.TreeNode
        Node2_3     matlab.ui.container.TreeNode
        Node3     matlab.ui.container.TreeNode
        Node3_1     matlab.ui.container.TreeNode
        Node3_2     matlab.ui.container.TreeNode
        Node3_3     matlab.ui.container.TreeNode
        Node3_4     matlab.ui.container.TreeNode
        Node3_5     matlab.ui.container.TreeNode
        Node3_6     matlab.ui.container.TreeNode
        Node3_7     matlab.ui.container.TreeNode
        Node3_8     matlab.ui.container.TreeNode
        Node3_9     matlab.ui.container.TreeNode
        Node3_10     matlab.ui.container.TreeNode
        Node3_11     matlab.ui.container.TreeNode
        Node3_12     matlab.ui.container.TreeNode
        Node3_13     matlab.ui.container.TreeNode
        Node3_14     matlab.ui.container.TreeNode
        Node3_15     matlab.ui.container.TreeNode
        Node3_16     matlab.ui.container.TreeNode
        Node3_17     matlab.ui.container.TreeNode
        Node3_18     matlab.ui.container.TreeNode
        Node4     matlab.ui.container.TreeNode
        Node5      matlab.ui.container.TreeNode
        Node6     matlab.ui.container.TreeNode
        Node7     matlab.ui.container.TreeNode
        %         Node7     matlab.ui.container.TreeNode
        %         Node7_1     matlab.ui.container.TreeNode
        %         Node7_2     matlab.ui.container.TreeNode
        %         Node7_3     matlab.ui.container.TreeNode
        %         Node7_4     matlab.ui.container.TreeNode
        %         Node7_5     matlab.ui.container.TreeNode
        %         Node7_6     matlab.ui.container.TreeNode
        %         Node7_7     matlab.ui.container.TreeNode
        %         Node7_8     matlab.ui.container.TreeNode
        %         Node7_9     matlab.ui.container.TreeNode
        %         Node7_10     matlab.ui.container.TreeNode
        %         Node7_11     matlab.ui.container.TreeNode
        %         Node7_12     matlab.ui.container.TreeNode
        %         Node7_13     matlab.ui.container.TreeNode
        %         Node7_14     matlab.ui.container.TreeNode
        %         Node7_15     matlab.ui.container.TreeNode
        %         Node7_16     matlab.ui.container.TreeNode
        Node8     matlab.ui.container.TreeNode
        Node9     matlab.ui.container.TreeNode
    end

    % Callbacks with handle components
    methods (Access = private)

        function startupFcn(app)
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
            app.Node1_1.Text = 'Power Plant';
            pwrplnt = readtable("EPA_flight_GHG_powerplants_data.xls");
            pwrplnt_GT = table2geotable(pwrplnt);
            app.Node1_1.NodeData = pwrplnt_GT;


            app.Node1_2 = uitreenode(app.Node1);
            app.Node1_2.Text = 'Cement Plant';
            cmntplnt = readtable("EPA_flight_GHG_cementplants_data.xls");
            cmntplnt_GT = table2geotable(cmntplnt);
            app.Node1_2.NodeData = cmntplnt_GT;


            app.Node1_3 = uitreenode(app.Node1);
            app.Node1_3.Text = 'Ethanol Plant';
            ethnlplnt = readtable("EPA_flight_GHG_ethanolplants_data.xls");
            ethnlplnt_GT = table2geotable(ethnlplnt);
            app.Node1_3.NodeData = ethnlplnt_GT;


            % Node 2 Parent
            app.Node2 = uitreenode(app.Tree);
            app.Node2.Text = 'CCS Infrastructure';


            % Node 2 children
            app.Node2_1 = uitreenode(app.Node2);
            app.Node2_1.Text = 'Pipelines';
            pplns_GT = readgeotable("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
            app.Node2_1.NodeData = pplns_GT;

            % IN DEVELOPMENT
            app.Node2_2 = uitreenode(app.Node2);
            app.Node2_2.Text = 'Injection Sites';
            njctn = readtable("NETL_CCS_injection_site_data.csv");
            njctn_GT = table2geotable(njctn);
            app.Node2_2.NodeData = njctn_GT;


            % IN DEVELOPMENT
            app.Node2_3 = uitreenode(app.Node2);
            app.Node2_3.Text = 'Sequestration Resevouir';

            

            % Node 3 Parent
            app.Node3 = uitreenode(app.Tree);

            app.Node3.Text = 'Natural Hazards';

            % select certain fields to avoid loading too much data
            nri = shaperead("NRI_Shapefile_Counties.shp", 'Attributes', {'Shape', 'Geometry', 'BoundingBox', 'X', 'Y', 'STATE', 'STATEABBRV', 'POPULATION', 'AREA', 'EAL_RATNG', 'AVLN_EALR', 'CFLD_EALR'...
                'CWAV_EALR', 'DRGT_EALR', 'ERQK_EALR', 'HAIL_EALR', 'HWAV_EALR', 'HRCN_EALR', 'ISTM_EALR', 'LNDS_EALR', 'LTNG_EALR', 'RFLD_EALR', 'SWND_EALR', 'TRND_EALR', 'TSUN_EALR', 'VLCN_EALR', 'WFIR_EALR', 'WNTW_EALR'});
            crs_info = shapeinfo("NRI_Shapefile_Counties.shp");
            crs = crs_info.CoordinateReferenceSystem;
            nri_GT = struct2geotable(nri(1:10), CoordinateReferenceSystem = crs);
            app.Node3.NodeData = nri_GT;
            sovi_resl = readtable("NRI_Table_Counties.csv");
            sovi = sovi_resl.SOVI_RATNG;
            sovi_T = cell2table(sovi(1:10), "VariableNames", "SOVI_RATNG");
            resl = sovi_resl.RESL_RATNG;
            resl_T = cell2table(resl(1:10), "VariableNames", "RESL_RATNG");



            % Node 3 children
            app.Node3_1 = uitreenode(app.Node3);
            app.Node3_1.Text = 'Avalanche';
            app.Node3_1.NodeData = nri_GT(:, [1, 11]);


            app.Node3_2 = uitreenode(app.Node3);
            app.Node3_2.Text = 'Coastal Flooding';
            app.Node3_2.NodeData = nri_GT(:, [1, 12]) ;


            app.Node3_3 = uitreenode(app.Node3);
            app.Node3_3.Text = 'Cold Wave';
            app.Node3_3.NodeData = nri_GT(:, [1, 13]) ;


            app.Node3_4 = uitreenode(app.Node3);
            app.Node3_4.Text = 'Drought';
            app.Node3_4.NodeData = nri_GT(:, [1, 14]) ;


            app.Node3_5 = uitreenode(app.Node3);
            app.Node3_5.Text = 'Earthquake';
            app.Node3_5.NodeData = nri_GT(:, [1, 15]) ;


            app.Node3_6 = uitreenode(app.Node3);
            app.Node3_6.Text = 'Hail';
            app.Node3_6.NodeData =  nri_GT(:, [1, 16]) ;


            app.Node3_7 = uitreenode(app.Node3);
            app.Node3_7.Text = 'Heat Wave';
            app.Node3_7.NodeData =  nri_GT(:, [1, 17]) ;


            app.Node3_8 = uitreenode(app.Node3);
            app.Node3_8.Text = 'Hurricane';
            app.Node3_8.NodeData =  nri_GT(:, [1, 18]) ;


            app.Node3_9 = uitreenode(app.Node3);
            app.Node3_9.Text = 'Ice Storm';
            app.Node3_9.NodeData =  nri_GT(:, [1, 19]) ;


            app.Node3_10 = uitreenode(app.Node3);
            app.Node3_10.Text = 'Landslide' ;
            app.Node3_10.NodeData =  nri_GT(:, [1, 20]) ;


            app.Node3_11 = uitreenode(app.Node3);
            app.Node3_11.Text = 'Lightning';
            app.Node3_11.NodeData =  nri_GT(:, [1, 21]) ;


            app.Node3_12 = uitreenode(app.Node3);
            app.Node3_12.Text = 'Riverine Flooding';
            app.Node3_12.NodeData =  nri_GT(:, [1, 22]) ;


            app.Node3_13 = uitreenode(app.Node3);
            app.Node3_13.Text = 'Strong Wind';
            app.Node3_13.NodeData =  nri_GT(:, [1, 23]) ;


            app.Node3_14 = uitreenode(app.Node3);
            app.Node3_14.Text = 'Tornado';
            app.Node3_14.NodeData =  nri_GT(:, [1, 24]) ;


            app.Node3_15 = uitreenode(app.Node3);
            app.Node3_15.Text = 'Tsunami';
            app.Node3_15.NodeData =  nri_GT(:, [1, 25]) ;


            app.Node3_16 = uitreenode(app.Node3);
            app.Node3_16.Text = 'Volcanic Activity';
            app.Node3_16.NodeData =  nri_GT(:, [1, 26]) ;


            app.Node3_17 = uitreenode(app.Node3);
            app.Node3_17.Text = 'Wildfire';
            app.Node3_17.NodeData =  nri_GT(:, [1, 27]) ;


            app.Node3_18 = uitreenode(app.Node3);
            app.Node3_18.Text = 'Winter Weather';
            app.Node3_18.NodeData =  nri_GT(:, [1, 28]) ;


            % Node 4 parent
            app.Node4 = uitreenode(app.Tree);
            app.Node4.Text = 'Power Sector Carbon Intensity';


            % Node 5 parent
            app.Node5 = uitreenode(app.Tree);
            app.Node5.Text = 'Social Vulnerability';
            sovi_GT = [nri_GT, sovi_T];
            app.Node5.NodeData = sovi_GT(:, {'Shape', 'STATEABBRV', 'SOVI_RATNG'});

            % Node 6 parent
            app.Node6 = uitreenode(app.Tree);
            app.Node6.Text = 'Community Resilience';
            resl_GT = [nri_GT, resl_T];
            app.Node6.NodeData = resl_GT(:, {'Shape', 'STATEABBRV', 'RESL_RATNG'});

            % Node 6 parent
            app.Node7 = uitreenode(app.Tree);
            app.Node7.Text = 'eGRID Subregion';

            % MCSC company locations
            % adding_mcsc_companies;


            % Node 8 Parent
            app.Node8 = uitreenode(app.Tree);
            app.Node8.Text = 'Population Density';
            pop_sz = readtable('ACSDT5Y2020.B01003_data_with_overlays_2022-04-27T113129.csv');


            % Node 9 Parent
            app.Node9 = uitreenode(app.Tree);
            app.Node9.Text = 'Climate Zones';
            % clmtzns = readgeotable("ClimateZones.shp");
            % app.Node8.NodeData = clmtzns;


            % Middle panel grid
            gl = uigridlayout(app.MiddlePanel, [6 7]);
            gl.ColumnSpacing = 5;
            gl.RowSpacing = 5;
            gl.Padding = [5 5 5 5];


            % Distance from CCS
            lbl_1 = uilabel(gl);
            lbl_1.FontName = 'Helvetica';
            lbl_1.Text = 'Distance from CO2 pipelines and injection sites (miles):';
            lbl_1.Layout.Row = 1;
            lbl_1.Layout.Column = [1 5];
            pip = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on');
            pip.Layout.Row = 1;
            pip.Layout.Column = [6 7];


            % NRI
            lbl_2 = uilabel(gl);
            lbl_2.Text = 'FEMA Risk Index:';
            lbl2.FontName = 'Helvetica';
            lbl_2.Layout.Row = 2;
            lbl_2.Layout.Column = [1 3];
            ind = uidropdown(gl, 'Items', {'Very High', 'Relatively High', 'Relatively Moderate', 'Relatively Low', 'Very Low'}, 'Editable', 'off');
            ind.Layout.Row = 2;
            ind.Layout.Column = [6 7];
            rsk = uidropdown(gl, 'Items', {'Avalanche', 'Coastal Flooding', 'Cold Wave', 'Drought', 'Earthquake', 'Hail', 'Heat Wave', 'Hurricane', 'Ice Storm', 'Landslide', 'Lightning', 'Riverine Flooding', 'Strong Wind', 'Tornado', 'Tsunami', 'Volcanic Activity', 'Wildfire', 'Winter Weather'},...
                'Editable','off', 'Placeholder', 'Enter risk');
            rsk.Layout.Row = 2;
            rsk.Layout.Column = [4 5];


            % CO2 emissions
            lbl_3 = uilabel(gl);
            lbl_3.Text = 'CO2 emissions (MT CO2e):';
            lbl_3.FontName = 'Helvetica';
            lbl_3.Layout.Row = 3;
            lbl_3.Layout.Column = [1 5];
            emm = uieditfield(gl, 'numeric', 'Limits', [0 17.232898], 'Editable', 'on', 'Value', 0);
            emm.Layout.Row = 3;
            emm.Layout.Column = [6 7];


            % Facility age
            lbl_4 = uilabel(gl);
            lbl_4.Text = 'Facility age (years):';
            lbl_4.FontName = 'Helvetica';
            lbl_4.Layout.Row = 4;
            lbl_4.Layout.Column = [1 5];
            age = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on', 'Value', 0);
            age.Layout.Row = 4;
            age.Layout.Column = [6 7];


            % Distance from population
            lbl_5 = uilabel(gl);
            lbl_5.Text = 'Distance from populations (miles):';
            lbl_5.FontName = 'Helvetica';
            lbl_5.Layout.Row = 5;
            lbl_5.Layout.Column = [1 5];
            pop = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on', 'Value', 0);
            pop.Layout.Row = 5;
            pop.Layout.Column = [6 7];


            % Update Map button
            b = uibutton(gl);
            b.Text = 'Update map';
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

                % get values in filter fields
                CCS_distance = app.MiddlePanel.Children.Children(2).Value;
                risk_level = app.MiddlePanel.Children.Children(4).Value;
                risk_type = app.MiddlePanel.Children.Children(5).Value;
                co2_emissions = app.MiddlePanel.Children.Children(7).Value;
                %                 facility_age = app.MiddlePanel.Children.Children(9).Value;
                %                 pop_distance = app.MiddlePanel.Children.Children(11).Value;



                % only the first 10 point sources for testing efficiency
                % (we would like to include all points in the final
                % product)
                for ii = 1:10


                    % make a table of all the point sources
                    T = [app.Node1.Children(1).NodeData; app.Node1.Children(2).NodeData; app.Node1.Children(3).NodeData];

                    % get latitude and longitude of current point source
                    latp = T{ii, 'LATITUDE'};
                    lonp = T{ii, 'LONGITUDE'};

                    % select each line from the pipeline geotable
                    for jj = 1:size(app.Node2.Children(1).NodeData)

                        % convert from miles to degrees
                        r_deg = CCS_distance/69.2;

                        % create circle using lat and lon for the first point source
                        [latc, lonc] = scircle1(latp, lonp, r_deg);

                        

                        info = shapeinfo("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
                        p = info.CoordinateReferenceSystem.GeographicCRS;

                        % make GT a table to extract the latitude and
                        % longitude of the first line for the first point
                        % source
                        T_pipe = geotable2table(app.Node2_1.NodeData, ["Latitude","Longitude"]);
                        [latl, lonl] = projinv(info.CoordinateReferenceSystem, T_pipe(jj,:).Latitude{1}, T_pipe(jj,:).Longitude{1});
% IN DEVELOPMENT                      
[lat_in, lon_in] = app.Node2_2.NodeData(:, {'Latitude', 'Longitude'});

                        

                        % if any part of the first line is within the radius of the first point source
                        % then the first point source meets the user requirements
                        if any(inpolygon(latl, lonl, latc, lonc)) && any(inpolygon(lat_in, lon_in, latc, lonc))

                            % do the plant emissions of this plant meet the
                            % value entered by user
                            plnt_emissions = (T{ii, 'GHGQUANTITY_METRICTONSCO2e_'}/1000000);

                            % if the emissions of the first point source
                            % meets (at least) the emissions value entered
                            % by the user, then the first point source
                            % satisfies the minimum requirement for
                            % emissions
                            if co2_emissions <= plnt_emissions

                                % check the risk selected by the user and
                                % plot the point sources that experience that natural hazard
                                switch string(risk_type)

                                    % if the risk is avalanche, make the
                                    % geoaxes, point source data, app
                                    % components, avalanche data, the
                                    % current point source, and the index
                                    % value selected by user
                                    case "Avalanche"
                                        riskFilter(ax, T, app, app.Node3_1, risk_level, ii)

                                    case "Coastal Flooding"
                                        riskFilter(ax, T, app, app.Node3_2, risk_level, ii)

                                    case "Cold Wave"
                                        riskFilter(ax, T, app, app.Node3_3, risk_level, ii)

                                    case "Drought"
                                        riskFilter(ax, T, app, app.Node3_4, risk_level, ii)

                                    case "Earthquake"
                                        riskFilter(ax, T, app, app.Node3_5, risk_level, ii)

                                    case "Hail"
                                        riskFilter(ax, T, app, app.Node3_6, risk_level, ii)

                                    case "Heat Wave"
                                        riskFilter(ax, T, app, app.Node3_7, risk_level, ii)

                                    case "Hurricane"
                                        riskFilter(ax, T, app, app.Node3_8, risk_level, ii)

                                    case "Ice Storm"
                                        riskFilter(ax, T, app, app.Node3_9, risk_level, ii)

                                    case "Landslide"
                                        riskFilter(ax, T, app, app.Node3_10, risk_level, ii)

                                    case "Lightning"
                                        riskFilter(ax, T, app, app.Node3_11, risk_level, ii)

                                    case "Riverine Flooding"
                                        riskFilter(ax, T, app, app.Node3_12, risk_level, ii)

                                    case "Strong Wind"
                                        riskFilter(ax, T, app, app.Node3_13, risk_level, ii)

                                    case "Tornado"
                                        riskFilter(ax, T, app, app.Node3_14, risk_level, ii)

                                    case "Tsunami"
                                        riskFilter(ax, T, app, app.Node3_15, risk_level, ii)

                                    case"Volcanic Activity"
                                        riskFilter(ax, T, app, app.Node3_16, risk_level, ii)

                                    case "Wildfire"
                                        riskFilter(ax, T, app, app.Node3_17, risk_level, ii)

                                    case"Winter Weather"
                                        riskFilter(ax, T, app, app.Node3_18, risk_level, ii)
                                end
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
                                pointLayer(ax, nodes(mm), event)

                            % plot if the node has polygon geometry
                            elseif strcmp(nodes(mm).NodeData.Shape.Geometry, "polygon")
                                riskLayer(ax, nodes(mm).NodeData, event)

                            % plot lines
                            else
                                lineLayer(ax, nodes(mm), event)
                                
                            end

                        end

                    end

                % if there are not any checked boxes, delete all objects   
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
                    add_rm_custom_paths('remove');
                    delete(app.UIFigure);
                    % deletes immediately after creating the figure, but can still
                    % plot the data
                    % no need to delete figure to delete paths
                    disp('path removed')
                end

    end
end




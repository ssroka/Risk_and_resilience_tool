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
            app.LeftPanel.FontName = 'Open Sans';
            app.LeftPanel.Title = 'Layers';
            app.LeftPanel.Layout.Row = [1 2];
            app.LeftPanel.Layout.Column = [1 3];
            app.LeftPanel.Scrollable = 'on';


            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.FontName = 'Open Sans';
            app.RightPanel.Title = 'Map';
            app.RightPanel.Layout.Row = [1 7];
            app.RightPanel.Layout.Column = [4 12];
            app.RightPanel.Scrollable = 'on';


            % Create GeoAxes
            gx = geoaxes(app.RightPanel, 'Basemap', 'darkwater', 'NextPlot', 'add');
            gx.Title.String = 'Map'; % display label, come up with better name
            gx.Subtitle.String = sprintf('An interactive, user friendly map to display relevant power sector data\n and support better business decisions regarding CCUS and resiliency retrofitting');
            gx.Subtitle.FontAngle = 'italic';
            gx.Scalebar.Visible = 'on'; % display scale bar
            gx.Grid = "off"; % no grid (may be distracting)
            % add option to turn grid on
            set(gx, 'fontname', 'Open Sans','fontsize',24); % use open sans font
            tlbr = axtoolbar(gx, {'export', 'datacursor', 'stepzoomin', 'stepzoomout', 'restoreview'}); % add differfent options to map toolbar
            addToolbarMapButton(tlbr, "basemap"); % allow user to choose different basemaps for personalized visualization
            geolimits(gx, [10 70], [-180 -30]); % map shows entirety of the USA
            hold(gx,'on')


            % Create BottomPanel
            app.BottomPanel = uipanel(app.GridLayout);
            app.BottomPanel.FontName = 'Open Sans';
            app.BottomPanel.Title = 'Calculator';
            app.BottomPanel.Layout.Row = [6 7];
            app.BottomPanel.Layout.Column = [1 3];
            app.BottomPanel.Scrollable = 'on';


            % Create MiddlePanel
            app.MiddlePanel = uipanel(app.GridLayout);
            app.MiddlePanel.FontName = 'Open Sans';
            app.MiddlePanel.Title = 'Filter point sources by ...';
            app.MiddlePanel.Layout.Row = [3 5];
            app.MiddlePanel.Layout.Column = [1 3];
            app.MiddlePanel.Scrollable = 'on';


            % Create Tree
            app.Tree = uitree(app.LeftPanel, 'checkbox');
            app.Tree.CheckedNodesChangedFcn = @(src,event) checkchange(src, event, app, gx);


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
            app.Node2.Text = 'CCUS Infrastructure';


            % Node 2 children
            app.Node2_1 = uitreenode(app.Node2);
            app.Node2_1.Text = 'Pipelines';
            pplns_GT = readgeotable("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
            app.Node2_1.NodeData = pplns_GT;


            app.Node2_2 = uitreenode(app.Node2);
            app.Node2_2.Text = 'Injection Sites';
            %                 njctn = readtable("CATF_CCUS_database.xlsx");
            %                 njctn_GT = table2geotable(njctn);
            %                 app.Node2_1.NodeData = njctn_GT;


            app.Node2_3 = uitreenode(app.Node2);
            app.Node2_3.Text = 'Sequestration Resevouir';
            %                 pplns = readgeotable("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
            %                 app.Node2_1.NodeData = pplns;


            % Node 3 Parent
            app.Node3 = uitreenode(app.Tree);
            app.Node3.Text = 'Environmental Risk';

            % select certain fields to avoid loading too much data
            nri = shaperead("NRI_Shapefile_States.shp", 'Attributes', {'Shape', 'Geometry', 'BoundingBox', 'X', 'Y', 'STATE', 'STATEABBRV', 'POPULATION', 'AREA', 'EAL_RATNG', 'AVLN_EALR', 'CFLD_EALR'...
                'CWAV_EALR', 'DRGT_EALR', 'ERQK_EALR', 'HAIL_EALR', 'HWAV_EALR', 'HRCN_EALR', 'ISTM_EALR', 'LNDS_EALR', 'LTNG_EALR', 'RFLD_EALR', 'SWND_EALR', 'TRND_EALR', 'TSUN_EALR', 'VLCN_EALR', 'WFIR_EALR', 'WNTW_EALR'});
            crs_info = shapeinfo("NRI_Shapefile_States.shp");
            crs = crs_info.CoordinateReferenceSystem;
            nri_GT = struct2geotable(nri, CoordinateReferenceSystem = crs);
            app.Node3.NodeData = nri_GT;


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
            app.Node5.Text = 'Social Impact';


            % Node 6 parent
            app.Node6 = uitreenode(app.Tree);
            app.Node6.Text = 'eGRID Subregion';


            %             % Node 7 Parent
            %             app.Node7 = uitreenode(app.Tree);
            %             app.Node7.Text = 'Company Facilities';
            %
            %             % Node 7 children
            %             app.Node7_1 = uitreenode(app.Node7);
            %             app.Node7_1.Text = 'Accenture';
            %
            %             app.Node7_2 = uitreenode(app.Node7);
            %             app.Node7_2.Text = 'Apple';
            %
            %             app.Node7_3 = uitreenode(app.Node7);
            %             app.Node7_3.Text = 'BBVA';
            %
            %             app.Node7_4 = uitreenode(app.Node7);
            %             app.Node7_4.Text = 'Biogen';
            %
            %             app.Node7_5 = uitreenode(app.Node7);
            %             app.Node7_5.Text = 'Boeing';
            %
            %             app.Node7_6 = uitreenode(app.Node7);
            %             app.Node7_6.Text = 'Cargill';
            %
            %             app.Node7_7 = uitreenode(app.Node7);
            %             app.Node7_7.Text = 'Dow';
            %
            %             app.Node7_8 = uitreenode(app.Node7);
            %             app.Node7_8.Text = 'Holcim';
            %
            %             app.Node7_9 = uitreenode(app.Node7);
            %             app.Node7_9.Text = 'IBM';
            %
            %             app.Node7_10 = uitreenode(app.Node7);
            %             app.Node7_10.Text = 'Inditex';
            %
            %             app.Node7_11 = uitreenode(app.Node7);
            %             app.Node7_11.Text = 'MathWorks';
            %
            %             app.Node7_12 = uitreenode(app.Node7);
            %             app.Node7_12.Text = 'Nexplore - Hochtief';
            %
            %             app.Node7_13 = uitreenode(app.Node7);
            %             app.Node7_13.Text = 'PepsiCo';
            %
            %             app.Node7_14 = uitreenode(app.Node7);
            %             app.Node7_14.Text = 'Rand-Whitney Containerboard, a Kraft Group company';
            %
            %             app.Node7_15 = uitreenode(app.Node7);
            %             app.Node7_15.Text = 'Verizon';
            %
            %             app.Node7_16 = uitreenode(app.Node7);
            %             app.Node7_16.Text = 'Vontier';


            % Node 8 Parent
            app.Node8 = uitreenode(app.Tree);
            app.Node8.Text = 'Climate Zones';
            % clmtzns = readgeotable("ClimateZones.shp");
            % app.Node8.NodeData = clmtzns;


            % Middle panel grid
            gl = uigridlayout(app.MiddlePanel, [10 7]);
            gl.ColumnSpacing = 2;
            gl.RowSpacing = 3;
            gl.Padding = [2 2 2 2];


            % Create DropDown and label
            lbl_1 = uilabel(gl);
            lbl_1.Text = 'Distance from CCUS infrastructure (miles):';
            lbl_1.Layout.Row = 1;
            lbl_1.Layout.Column = [1 4];
            pip = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on');
            pip.Layout.Row = 1;
            pip.Layout.Column = [5 7];


            % Create DropDown and label
            lbl_2 = uilabel(gl);
            lbl_2.Text = 'FEMA Risk Index:';
            lbl_2.Layout.Row = 3;
            lbl_2.Layout.Column = [1 3];
            ind = uidropdown(gl, 'Items', {'Very High', 'Relatively High', 'Relatively Moderate', 'Relatively Low', 'Very Low'}, 'Placeholder', 'Enter index', 'Editable','on');
            ind.Layout.Row = 3;
            ind.Layout.Column = [6 7];

            % make one for hazards
            rsk = uidropdown(gl, 'Items', {'Avalanche', 'Coastal Flooding', 'Cold Wave', 'Drought', 'Earthquake', 'Hail', 'Heat Wave', 'Hurricane', 'Ice Storm', 'Landslide', 'Lightning', 'Riverine Flooding', 'Strong Wind', 'Tornado', 'Tsunami', 'Volcanic Activity', 'Wildfire', 'Winter Weather'},...
                'Editable','on', 'Placeholder', 'Enter risk');
            rsk.Layout.Row = 3;
            rsk.Layout.Column = [4 5];



            % Create DropDown and label
            lbl_3 = uilabel(gl);
            lbl_3.Text = 'CO2 emissions (MT CO2e):';
            lbl_3.Layout.Row = 5;
            lbl_3.Layout.Column = [1 4];
            emm = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on', 'Value', 0);
            emm.Layout.Row = 5;
            emm.Layout.Column = [5 7];


            % Create DropDown and label
            lbl_4 = uilabel(gl);
            lbl_4.Text = 'Facility age (years):';
            lbl_4.Layout.Row = 7;
            lbl_4.Layout.Column = [1 4];
            age = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on', 'Value', 0);
            age.Layout.Row = 7;
            age.Layout.Column = [5 7];


            % Create DropDown and label
            lbl_5 = uilabel(gl);
            lbl_5.Text = 'Distance from populations (miles):';
            lbl_5.Layout.Row = 9;
            lbl_5.Layout.Column = [1 4];
            pop = uieditfield(gl, 'numeric', 'Limits', [0 1000], 'Editable', 'on', 'Value', 0);
            pop.Layout.Row = 9;
            pop.Layout.Column = [5 7];


            % Make button
            b_1 = uibutton(gl);
            b_1.Text = 'Update';
            b_1.Layout.Row = 2;
            b_1.Layout.Column = [6 7];
            b_1.ButtonPushedFcn =  {@updateMap, app, gx};


            % Make button
            b_2 = uibutton(gl);
            b_2.Text = 'Update';
            b_2.Layout.Row = 4;
            b_2.Layout.Column = [6 7];
            b_2.ButtonPushedFcn =  {@updateMap, app, gx};
            %
            %
            %             % Make button
            %             b_3 = uibutton(gl);
            %             b_3.Text = 'Update';
            %             b_3.Layout.Row = 6;
            %             b_3.Layout.Column = 6;
            %             b_3.ButtonPushedFcn =  @(src,event) updateMap(src, event, gx);
            %
            %
            %             % Make button
            %             b_4 = uibutton(gl);
            %             b_4.Text = 'Update';
            %             b_4.Layout.Row = 8;
            %             b_4.Layout.Column = 6;
            %             b_4.ButtonPushedFcn =  @(src,event) updateMap(src, event, gx);
            %
            %
            %             % Make button
            %             b_5 = uibutton(gl);
            %             b_5.Text = 'Update';
            %             b_5.Layout.Row = 10;
            %             b_5.Layout.Column = 6;
            %             b_5.ButtonPushedFcn =  @(src,event) updateMap(src, event, gx);


            % Display figure only when all components have been created
            app.UIFigure.Visible = 'on';



            % callback functions for filters



            % Push button to update the map for pipeline
            function updateMap(src, event, app, ax)

                % made data into one table
                T = [app.Node1.Children(1).NodeData; app.Node1.Children(2).NodeData; app.Node1.Children(3).NodeData];

                % select all lat and lons for every point and make a
                % new variable
                xy = [T(:, 'LATITUDE') T(:, 'LONGITUDE')]
                disp('table')

                % select all lat and lon for specific point and assign to variables
                % lat and lon
                for ii = 1:10
                    %size(xy,1)
                    latp = table2array(xy(ii, 1));
                    lonp = table2array(xy(ii, 2));

                    if event.Source ==  app.MiddlePanel.Children.Children(12)

                        % select each line from the pipeline geotable
                        for jj = 1:size(app.Node2.Children(1).NodeData,1)

                            r_mi = app.MiddlePanel.Children.Children(2).Value;

                            % convert from miles to degrees
                            r_deg = r_mi/69;

                            % create circle using lat and lon for the specific point
                            % change radius from degrees to miles
                            [latc, lonc] = scircle1(latp, lonp, r_deg);

                            %                           circle = [latc, lonc]

                            info = shapeinfo("OHWVPA_PotentialCO2PipelineRoutes_051022.shp");
                            p = info.CoordinateReferenceSystem.GeographicCRS;

                            % make GT a table and get latitude and longitudes
                            T_pipe = geotable2table(app.Node2.Children(1).NodeData, ["Latitude","Longitude"]);
                            [latl,lonl] = projinv(info.CoordinateReferenceSystem,T_pipe(jj,:).Latitude{1},T_pipe(jj,:).Longitude{1});

                            %                            shape2  = geolineshape(latl, lonl);

                            % if any x, y pair is in the circle, plot the
                            % circle and the point
                            if any(inpolygon(latl, lonl, latc, lonc))

                                h1 = geoplot(ax, latp, lonp, "om", MarkerFaceColor = "m");

                                %                                 h2 = geoplot(gx, latc, lonc)
                                %                                 h3 = geoplot(gx, shape2)

                            end

                        end

                    end


                    if event.Source == app.MiddlePanel.Children.Children(13)
                        risk = app.MiddlePanel.Children.Children(5).Value;
                        index = app.MiddlePanel.Children.Children(4).Value;

                        switch string(risk)
                            case "Avalanche"
                                plotPSbyRisk(ax, T, app, app.Node3_1, index)

                            case "Coastal Flooding"
                                plotPSbyRisk(ax, T, app, app.Node3_2, index)

                            case "Cold Wave"
                                plotPSbyRisk(ax, T, app, app.Node3_3, index)

                            case "Drought"
                                plotPSbyRisk(ax, T, app, app.Node3_4, index)

                            case "Earthquake"
                                plotPSbyRisk(ax, T, app, app.Node3_5, index)
 
                            case "Hail"
                                plotPSbyRisk(ax, T, app, app.Node3_6, index)
    
                            case "Heat Wave"
                                plotPSbyRisk(ax, T, app, app.Node3_7, index)
                                
                            case "Hurricane"
                                plotPSbyRisk(ax, T, app, app.Node3_8, index)
                               
                            case "Ice Storm"
                                plotPSbyRisk(ax, T, app, app.Node3_9, index)
                                
                            case "Landslide"
                                plotPSbyRisk(ax, T, app, app.Node3_10, index)
                               
                            case "Lightning"
                                plotPSbyRisk(ax, T, app, app.Node3_11, index)
                                
                            case "Riverine Flooding"
                                plotPSbyRisk(ax, T, app, app.Node3_12, index)
                                
                            case "Strong Wind"
                                plotPSbyRisk(ax, T, app, app.Node3_13, index)
                                
                            case "Tornado"
                                plotPSbyRisk(ax, T, app, app.Node3_14, index)
                               
                            case "Tsunami"
                                plotPSbyRisk(ax, T, app, app.Node3_15, index)
                               
                            case"Volcanic Activity"
                                plotPSbyRisk(ax, T, app, app.Node3_16, index)
                              
                            case "Wildfire"
                                plotPSbyRisk(ax, T, app, app.Node3_17, index)
                               
                            case"Winter Weather"
                                plotPSbyRisk(ax, T, app, app.Node3_18, index)
                              
                        end

                    end
                end
            end
        end
























        % callback functions for checkboxes


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
                for jj = 1:length(objs)

                    % if a child and the box of the same name isn't checked, delete the object
                    if ~ismember(objs(jj).Tag, names)
                        delete(objs(jj))
                    end

                end

                % for each node (i.e. checked box) see if the object is already plotted, and if not plot it
                for ii = 1:length(nodes)
                    data2plot = findobj(ax, 'Tag', nodes(ii).Text);

                    if isempty(data2plot)

                        % plot if the node has point geometry
                        if strcmp(nodes(ii).NodeData.Shape.Geometry,"point")
                            geoplot(ax, nodes(ii).NodeData,'markersize', 25, 'Tag', nodes(ii).Text)

                            % plot if the node has polygon geometry
                        elseif strcmp(nodes(ii).NodeData.Shape.Geometry, "polygon")

                            for s = 1:1

                                switch string(nodes(ii).NodeData{s, 11})
                                    case "Very High"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#a63603');
                                    case "Relatively High"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#e6550d');
                                    case "Relatively Moderate"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#fd8d3c');
                                    case "Relatively Low"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#fdbe85');
                                    case "Very Low"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#feedde');
                                    case "No Rating"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#f0f0f0');
                                    case "Not Applicable"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#bdbdbd');
                                    case "Insufficient Data"
                                        geoplot(ax, nodes(ii).NodeData(s, :), FaceColor = '#636363');
                                end


                            end

                        else
                            geoplot(ax, nodes(ii).NodeData,'linewidth',3, 'Tag', nodes(ii).Text)
                        end

                    end

                end

            else

                % if there are not any checked boxes, delete all "lines"
                for kk = 1:length(objs)

                    delete(objs(kk))

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

        % Code that executes before app deletion

        %         function delete(app)
        %             add_rm_custom_paths('remove');
        %             delete(app.UIFigure);
        %             % deletes immediately after creating the figure, but can still
        %             % plot the data
        %             % no need to delete figure to delete paths
        %             disp('path removed')
        %         end

    end



end

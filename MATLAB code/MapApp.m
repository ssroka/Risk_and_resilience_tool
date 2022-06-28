classdef MapApp < matlab.apps.AppBase
    % MapApp This is the base class of an App which contains methods needed by Apps.

    properties(Access = public)
        UIFigure    matlab.ui.Figure
        GridLayout  matlab.ui.container.GridLayout
        LeftPanel matlab.ui.container.Panel
        RightPanel matlab.ui.container.Panel
        BottomPanel matlab.ui.container.Panel
        UIAxes      matlab.ui.control.UIAxes
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
        Node7_1     matlab.ui.container.TreeNode
        Node7_2     matlab.ui.container.TreeNode
        Node7_3     matlab.ui.container.TreeNode
        Node7_4     matlab.ui.container.TreeNode
        Node7_5     matlab.ui.container.TreeNode
        Node7_6     matlab.ui.container.TreeNode
        Node7_7     matlab.ui.container.TreeNode
        Node7_8     matlab.ui.container.TreeNode
        Node7_9     matlab.ui.container.TreeNode
        Node7_10     matlab.ui.container.TreeNode
        Node7_11     matlab.ui.container.TreeNode
        Node7_12     matlab.ui.container.TreeNode
        Node7_13     matlab.ui.container.TreeNode
        Node7_14     matlab.ui.container.TreeNode
        Node7_15     matlab.ui.container.TreeNode
        Node7_16     matlab.ui.container.TreeNode
    end

    % Callbacks with handle components
    methods (Access = private)

%         function startupFcn(app)
%         end

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
            app.GridLayout = uigridlayout(app.UIFigure, [4 4]);
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.FontName = 'Open Sans';
            app.LeftPanel.Title = 'Layers';
            app.LeftPanel.Layout.Row = [1 3];
            app.LeftPanel.Layout.Column = 1;
            app.LeftPanel.Scrollable = 'on'; 

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.FontName = 'Open Sans';
            app.RightPanel.Title = 'Map';
            app.RightPanel.Layout.Row = [1 4];
            app.RightPanel.Layout.Column = [2 4];
            app.RightPanel.Scrollable = 'on';

            % Create GeoAxes
            gx = geoaxes(app.RightPanel, 'Basemap','darkwater');
            gx.Title.String = 'Map'; % display label, come up with better name
            gx.Subtitle.String = 'An interactive, user friendly map to display relevant power sector data and support better business decisions regarding CCUS and resiliency retrofitting';
            gx.Subtitle.FontAngle = 'italic';
            gx.Scalebar.Visible = 'on'; % display scale bar
            gx.Grid = "off"; % no grid (may be distracting)
            % add option to turn grid on
            set(gx, 'fontname', 'Open Sans'); % use open sans font
            tlbr = axtoolbar(gx, {'export', 'datacursor', 'stepzoomin', 'stepzoomout', 'restoreview'}); % add differfent options to map toolbar
            addToolbarMapButton(tlbr, "basemap"); % allow user to choose different basemaps for personalized visualization
            geolimits(gx, [-15 80], [-190 60]); % map shows entirety of the USA
            hold(gx,'on')

            % Create BottomPanel
            app.BottomPanel = uipanel(app.GridLayout);
            app.BottomPanel.FontName = 'Open Sans';
            app.BottomPanel.Title = 'Calculator';
            app.BottomPanel.Layout.Row = 4;
            app.BottomPanel.Layout.Column = 1;
            app.BottomPanel.Scrollable = 'on';

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
%                  pplnes = shaperead('OHWVPA_PotentialCO2PipelineRoutes_051022.shp');
%                  app.Node2_1.NodeData = pplnes;
            
            app.Node2_2 = uitreenode(app.Node2);
            app.Node2_2.Text = 'Injection Sites';

            app.Node2_3 = uitreenode(app.Node2);
            app.Node2_3.Text = 'Sequestration Resevouir';

            % Node 3 Parent
            app.Node3 = uitreenode(app.Tree);
            app.Node3.Text = 'Environmental Risk';

            % Node 3 children
            app.Node3_1 = uitreenode(app.Node3);
            app.Node3_1.Text = 'Avalanche';

            app.Node3_2 = uitreenode(app.Node3);
            app.Node3_2.Text = 'Coastal Flooding';

            app.Node3_3 = uitreenode(app.Node3);
            app.Node3_3.Text = 'Cold Wave';
            
            app.Node3_4 = uitreenode(app.Node3);
            app.Node3_4.Text = 'Drought';
            
            app.Node3_5 = uitreenode(app.Node3);
            app.Node3_5.Text = 'Earthquake';
            
            app.Node3_6 = uitreenode(app.Node3);
            app.Node3_6.Text = 'Hail';
            
            app.Node3_7 = uitreenode(app.Node3);
            app.Node3_7.Text = 'Heat Wave';
            
            app.Node3_8 = uitreenode(app.Node3);
            app.Node3_8.Text = 'Hurricane';
            
            app.Node3_9 = uitreenode(app.Node3);
            app.Node3_9.Text = 'Ice Storm';
            
            app.Node3_10 = uitreenode(app.Node3);
            app.Node3_10.Text = 'Landslide' ;
            
            app.Node3_11 = uitreenode(app.Node3);
            app.Node3_11.Text = 'Lightning';
            
            app.Node3_12 = uitreenode(app.Node3);
            app.Node3_12.Text = 'Riverine Flooding';
            
            app.Node3_13 = uitreenode(app.Node3);
            app.Node3_13.Text = 'Strong Wind';
            
            app.Node3_14 = uitreenode(app.Node3);
            app.Node3_14.Text = 'Tornado';
            
            app.Node3_15 = uitreenode(app.Node3);
            app.Node3_15.Text = 'Tsunami';
            
            app.Node3_16 = uitreenode(app.Node3);
            app.Node3_16.Text = 'Volcanic Activity';
            
            app.Node3_17 = uitreenode(app.Node3);
            app.Node3_17.Text = 'Wildfire';
            
            app.Node3_18 = uitreenode(app.Node3);
            app.Node3_18.Text = 'Winter Weather';

            % Node 4 parent
            app.Node4 = uitreenode(app.Tree);
            app.Node4.Text = 'Power Sector Carbon Intensity';

            % Node 5 parent
            app.Node5 = uitreenode(app.Tree);
            app.Node5.Text = 'Social Impact';

            % Node 6 parent
            app.Node6 = uitreenode(app.Tree);
            app.Node6.Text = 'eGRID Subregion';

            % Node 7 Parent
            app.Node7 = uitreenode(app.Tree);
            app.Node7.Text = 'Comapny Facilities';

            % Node 7 children
            app.Node7_1 = uitreenode(app.Node7);
            app.Node7_1.Text = 'Accenture';
            
            app.Node7_2 = uitreenode(app.Node7);
            app.Node7_2.Text = 'Apple';
            
            app.Node7_3 = uitreenode(app.Node7);
            app.Node7_3.Text = 'BBVA';
            
            app.Node7_4 = uitreenode(app.Node7);
            app.Node7_4.Text = 'Biogen';
            
            app.Node7_5 = uitreenode(app.Node7);
            app.Node7_5.Text = 'Boeing';
            
            app.Node7_6 = uitreenode(app.Node7);
            app.Node7_6.Text = 'Cargill';
            
            app.Node7_7 = uitreenode(app.Node7);
            app.Node7_7.Text = 'Dow';
            
            app.Node7_8 = uitreenode(app.Node7);
            app.Node7_8.Text = 'Holcim';
            
            app.Node7_9 = uitreenode(app.Node7);
            app.Node7_9.Text = 'IBM';
            
            app.Node7_10 = uitreenode(app.Node7);
            app.Node7_10.Text = 'Inditex';
            
            app.Node7_11 = uitreenode(app.Node7);
            app.Node7_11.Text = 'MathWorks';
            
            app.Node7_12 = uitreenode(app.Node7);
            app.Node7_12.Text = 'Nexplore - Hochtief';
            
            app.Node7_13 = uitreenode(app.Node7);
            app.Node7_13.Text = 'PepsiCo';
            
            app.Node7_14 = uitreenode(app.Node7);
            app.Node7_14.Text = 'Rand-Whitney Containerboard, a Kraft Group company';
            
            app.Node7_15 = uitreenode(app.Node7);
            app.Node7_15.Text = 'Verizon';
            
            app.Node7_16 = uitreenode(app.Node7);
            app.Node7_16.Text = 'Vontier';

            app.UIFigure.Visible = 'on';

             function checkchange(src, event, app, ax)
                nodes = event.LeafCheckedNodes;
                objs =  get(ax,'children');
                if ~isempty(nodes) % if there are checked boxes
                    names = {nodes(:).Text}; % find the names of everything that is checked
                    for jj = 1:length(objs) % loop through the children
                        if ~ismember(objs(jj).Tag, names) % if a child and the box of the same name isn't checked, delete the object
                            delete(objs(jj))
                        end
                    end
                    % for each node (i.e. checked box) see if the object is already plotted, and if not plot it
                    for ii = 1:length(nodes)
                        data2plot = findobj(ax, 'Tag', nodes(ii).Text);
                        if isempty(data2plot)
                            geoplot(ax, nodes(ii).NodeData,'marker','^','markersize',10, 'Tag',nodes(ii).Text)
                        end
                    end
                else % if there are not any checked boxes, delete all "lines"
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

            % Create UIFigure and components
            createComponents(app)

            % Execute startup function
            % runStartupFcn(app, @startupFcn)

        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end

    

end



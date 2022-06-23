clear;clc;close all

%% create app container

fig = uifigure; % GUI figure
    fig.Name = 'Map'; % come up with something more creative later
    fig.WindowState = 'maximized'; % figure window takes up entire page and code runs
    % add context menu

%% create app axes

gx = geoaxes(fig, 'Basemap','darkwater'); % initial gray scale map with longitude and latitude axes
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

%% create legend
% gx.Legend = legend({'Point Source', 'CCUS Infrastructure', 'Environmental Risk', 'Power Sector Carbon Intensity', 'Social Impact', 'eGRID Subregion', 'Company Facilities'});

%% tree nodes
t = uitree(fig, 'checkbox');
    t.BackgroundColor = [1 1 1];
    t.FontName = 'Open Sans';
    t.Visible = 'off';
    t.Position = [0 0 90 100];

n1 = uitreenode(t, 'Text', 'Point Source');
    n11 = uitreenode(n1, 'Text', 'Power Plant')
    n12 = uitreenode(n1, 'Text', 'Cement Plant')
    n13 = uitreenode(n1, 'Text', 'Ethanol Plant')

n2 = uitreenode(t, 'Text','CCUS Infrastructure');
    n21 = uitreenode(n2, 'Text', 'Pipelines');
    n22 = uitreenode(n2, 'Text', 'Injection Sites');
    n23 = uitreenode(n2, 'Text', 'Sequestration Resevouir');

%n3 = uitreenode(t,'Text','Carbon Sink');

n4 = uitreenode(t,'Text','Environmental Risk');
    n41 = uitreenode(n4, 'Text', 'Avalanche');
    n42 = uitreenode(n4, 'Text', 'Coastal Flooding');
    n43 = uitreenode(n4, 'Text', 'Cold Wave');
    n44 = uitreenode(n4, 'Text', 'Drought');
    n45 = uitreenode(n4, 'Text', 'Earthquake');
    n46 = uitreenode(n4, 'Text', 'Hail');
    n47 = uitreenode(n4, 'Text', 'Heat Wave');
    n48 = uitreenode(n4, 'Text', 'Hurricane');
    n49 = uitreenode(n4, 'Text', 'Ice Storm');
    n410 = uitreenode(n4, 'Text', 'Landslide');
    n411 = uitreenode(n4, 'Text', 'Lightning');
    n412 = uitreenode(n4, 'Text', 'Riverine Flooding');
    n413 = uitreenode(n4, 'Text', 'Strong Wind');
    n414 = uitreenode(n4, 'Text', 'Tornado');
    n415 = uitreenode(n4, 'Text', 'Tsunami');
    n416 = uitreenode(n4, 'Text', 'Volcanic Acitivity');
    n417 = uitreenode(n4, 'Text', 'Wildfire');
    n418 = uitreenode(n4, 'Text', 'Winter Weather');

n5 = uitreenode(t,'Text','Power Sector Carbon Intensity');

n6 = uitreenode(t,'Text','Social Impact');

n7 = uitreenode(t,'Text','eGRID Subregion');

n8= uitreenode(t,'Text','Company Facilities');
    n81 = uitreenode(n8, 'Text', 'Accenture');
    n82 = uitreenode(n8, 'Text', 'Apple');
    n83 = uitreenode(n8, 'Text', 'BBVA');
    n84 = uitreenode(n8, 'Text', 'Biogen');
    n85 = uitreenode(n8, 'Text', 'Boeing');
    n86 = uitreenode(n8, 'Text', 'Cargill');
    n87 = uitreenode(n8, 'Text', 'Dow');
    n88 = uitreenode(n8, 'Text', 'Holcim');
    n89 = uitreenode(n8, 'Text', 'IBM');
    n810 = uitreenode(n8, 'Text', 'Inditex');
    n811 = uitreenode(n8, 'Text', 'MathWorks');
    n812 = uitreenode(n8, 'Text', 'Nexplore - Hochtief');
    n813 = uitreenode(n8, 'Text', 'PepsiCo');
    n814 = uitreenode(n8, 'Text', 'Rand-Whitney Containerboard, a Kraft Group company');
    n815 = uitreenode(n8, 'Text', 'Verizon');
    n816 = uitreenode(n8, 'Text', 'Vontier');

%% pointer behavior
iptPointerManager(fig, 'enable');
pb.enterFcn = @(fig, currentPoint) set(fig, 'Pointer', 'fleur');
pb.exitFcn = @(fig, currentPoint) set(fig, 'Pointer', 'arrow');
pb.traverseFcn = [];
iptSetPointerBehavior(gx, pb);

% pb.enterFcn = @(fig, currentPoint) set('Pointer', 'hand');
% pb.exitFcn = @(fig, currentPoint) set('Pointer', 'fleur');
% pb.traverseFcn = [];
% iptSetPointerBehavior( ,pb);
% iptPointerManager(gcf);


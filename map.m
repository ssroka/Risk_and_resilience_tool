clear;clc;close all

%% define data files
egrid = 'egrid2020_data.xlsx'; % define data file
ccsdata = 'CATF_CCUS_Database.xlsx'; % define data file

%% options and table
plntopts = detectImportOptions(egrid, 'Sheet', 'PLNT20'); % only import the PLNT20 sheet
plntopts.VariableNamingRule = 'preserve'; % keep original variable names
ccsopts = detectImportOptions(ccsdata, 'Sheet', 'US'); % only import the US sheet
ccsopts.VariableNamingRule = 'preserve'; % keep original variable names

%% read data
powerplant = readtable(egrid, plntopts); % input data table
ccs = readtable(ccsdata, ccsopts); % input data table

%% define variable types
powerplant.('eGRID subregion acronym') = categorical(powerplant.('eGRID subregion acronym')); % make the plant name a categorical variable
ccs.('Subsector Description') = categorical(ccs.('Subsector Description')); % make the type of ccs a categorical variable

%%
% plntlat = powerplant.('Plant latitude')
% plntlon = powerplant.('Plant longitude')
% ccslat = ccs.("Approx. Latitude")
% ccslon = ccs.("Approx. Longitude")
plntgt = table2geotable(powerplant, 'geographic', {'Plant latitude' 'Plant longitude'});
ccsgt = table2geotable(ccs, 'geographic', {'Approx. Latitude' 'Approx. Longitude'});
%%
% create app container
fig = uifigure;
    fig.Name = 'Map'
    fig.WindowState = 'maximized'
   
% create app axes
gx = geoaxes(fig, 'Basemap','darkwater');
    tb = axtoolbar(gx, {'export', 'datacursor', 'stepzoomin', 'stepzoomout', 'restoreview'});
    addToolbarMapButton(tb, "basemap");
    geolimits(gx, [-15 80], [-190 60]);
    gx.Scalebar.Visible = 'on'
    gx.Title.String = 'Map'
% 


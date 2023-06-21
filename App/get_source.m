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

This is an auxiliary file to generate the data source pop-out windows

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function get_source(data_layer)

not_assigned = false;

switch data_layer
    case {"Power Plants","Cement Plants","Ethanol Plants","Iron and Steel Plants","Point Sources"}
        source_text = "Source: Environmental Protection Agency" + newline + "Facility Level Information on" + newline + "GreenHouse gases Tool (FLIGHT)";
        source_link = "https://ghgdata.epa.gov/ghgp/main.do";
    case {"Pipelines","Operational Pipelines","Planned Pipelines"}
        source_text = "Source: Department of Energy," + newline + "National Energy Technology Laboratory" + newline +...
            "Summit Carbon Solutions, Navigator CO2," + newline + "and Wolf Carbon Solutions";
        source_link = ["https://www.energy.gov/sites/prod/files/2015/04/f22/QER%20Analysis%20-%20A%20Review%20of%20the%20CO2%20Pipeline%20Infrastructure%20in%20the%20U.S_0.pdf";
            "https://www.iowapublicradio.org/ipr-news/2023-04-14/co2-pipelines-would-be-a-boon-for-ethanol-but-some-question-if-theyre-really-a-climate-solution"];
    case {"Injection sites"}
        source_text = "Source: Department of Energy," + newline + "National Energy Technology Laboratory" ;
        source_link = "https://www.netl.doe.gov/coal/carbon-storage/worldwide-ccs-database";
    case {"Geological reservoirs"}
        source_text = "Source: US Geological Survey";
        source_link = ["https://pubs.usgs.gov/ds/774/pdf/DS774.pdf";"https://pubs.usgs.gov/of/2012/1024/ofr20121024_shapefiles.pdf"];
    case {"Earthquake","Hurricane","Riverine Flooding","Strong Wind",...
            "Wildfire","Social Vulnerability","Community Resilience","Population"}
        source_text = "Source: FEMA National Risk Index";
        source_link = "https://hazards.fema.gov/nri/";
    case {"Drought"}
        source_text = "Source: FEMA National Risk Index" + newline + newline +...
            "Note that 'Drought' specifically refers to risk" + newline + "to agriculture";
        source_link = "https://hazards.fema.gov/nri/";
    case {"RCP 4.5","RCP 8.5"}
        source_text = "Source: Argonne National Laboratory" + newline + "Climate Risk and Resilience Portal"+ newline + ...
            "Center for Climate Resilience and"+ newline + "Decision Science (CCRDS)";
        source_link = "https://www.anl.gov/ccrds/ClimRR";
    case {"current (2021)", "projected (2050)", "Grid Carbon Intensity [lbs CO2/MWh]"}
        source_text = "Source: Energy Information Administration (EIA)";
        source_link = "https://www.eia.gov/outlooks/aeo/supplement/excel/sup_elec.xlsx";
    case {"NDVI"}
        source_text = "Normalized Difference Vegetation Index (NDVI)" + newline + "Source: NASA MODIS via IBM's GeoDN";
        source_link = "https://modis.gsfc.nasa.gov/data/dataprod/mod13.php";
    case {"Interstates"}
        source_text = "Source: Department of Transportation";
        source_link = "https://hub.arcgis.com/datasets/NCTCOGGIS::highways-2019/explore?location=32.615783%2C-97.215500%2C10.00";
    case {"Disadvantaged Communities"}
        source_text = "Source: Department of Energy, Justice40 Initiative" + newline +...
            "via Climate and Economic Justice Screening Tool" + newline + "(CEJST)";
        source_link = "https://screeningtool.geoplatform.gov/en/";
    otherwise
        not_assigned = true;

end

if ~not_assigned
    % Create message box figure & axes
    uifig = uifigure();
    uiax = uiaxes(uifig,'Position',[0 0 uifig.Position(3:4)]);
    uiax.Toolbar.Visible = 'off';
    axis(uiax,'off')

    th_src_text = text(uiax, .1, .9, source_text,...
        'FontSize',20,...
        'HorizontalAlignment','left');

    if length(source_link)<2
        th = text(uiax, .5, .3, '$\mathrm{\underline{link}}$',...
            'color',[0 0 .8],'FontSize',20,'Interpreter','latex',...
            'HorizontalAlignment','center');
        th.ButtonDownFcn = @(~,~)web(source_link); % this opens the website
    elseif length(source_link) == 2
        th1 = text(uiax, .45, .3, '$\mathrm{\underline{link 1,}}$',...
            'color',[0 0 .8],'FontSize',20,'Interpreter','latex',...
            'HorizontalAlignment','center');
        th1.ButtonDownFcn = @(~,~)web(source_link(1)); % this opens the website

        th2 = text(uiax, .55, .3, '$\mathrm{\underline{link 2}}$',...
            'color',[0 0 .8],'FontSize',20,'Interpreter','latex',...
            'HorizontalAlignment','center');
        th2.ButtonDownFcn = @(~,~)web(source_link(2)); % this opens the website
    end

    % Add OK button that closes figure
    close_button_length = 75; % Pixels
    close_button_height = 30; % Pixels
    close_button_position = [((uiax.Position(3)-uiax.Position(1))/2-close_button_length/2) 50 close_button_length close_button_height];
    bh = uibutton(uifig,'Text','Close','FontSize',20,...
        'Position',close_button_position,'ButtonPushedFcn',@(h,~)delete(h.Parent));
end
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

This is an auxiliary file to filter point sources by natural hazard risk
and population

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------

function [ids_2_plot] = filter_by_nat_haz_pop(app,pt_src_text,filter_text,level)

% C is a cell array of string county ids that correspond to the county the
% point source is in
switch pt_src_text
    case "Power Plants"
        load('pwrplnt_county.mat','pwrplnt_county')
        C = pwrplnt_county;
        clear pwrplnt_county
    case "Cement Plants"
        load('cmntplnt_county.mat','cmntplnt_county')
        C = cmntplnt_county;
        clear cmntplnt_county
    case "Ethanol Plants"
        load('ethnlplnt_county.mat','ethnlplnt_county')
        C = ethnlplnt_county;
        clear ethnlplnt_county
    case "Iron and Steel Plants"
        load('steelplnt_county.mat','steelplnt_county')
        C = steelplnt_county;
        clear steelplnt_county
end

switch filter_text

    case "Earthquake"
        Filter_node = app.EarthquakeNode;
    case "Drought"
        Filter_node = app.DroughtNode;
    case "Hurricane"
        Filter_node = app.HurricaneNode;
    case "Riverine Flooding"
        Filter_node = app.RiverineFloodingNode;
    case "Strong Wind"
        Filter_node = app.StrongWindNode;
    case "Wildfire"
        Filter_node = app.WildfireNode;
    case "Population"
        Filter_node = app.PopulationNode;
end

ids_2_plot = false(size(C,1),1);

for i = 1:length(C)
    ind_county = find(strcmp(C{i},{Filter_node.NodeData.CountyNS{:}}));
    if ~isempty(ind_county)
        if strcmp(filter_text,"Population")
            county_pop_level = table2array(Filter_node.NodeData(ind_county,3)); % as a cell, 3rd col has pop number
            if strcmp(app.DropDown_PopGTLT.Value,">")
                if county_pop_level > str2double(app.Edit_Population.Value)
                    ids_2_plot(i) = true;
                end
            else
                if county_pop_level < str2double(app.Edit_Population.Value)
                    ids_2_plot(i) = true;
                end
            end
        else
            county_risk_level = table2array(Filter_node.NodeData(ind_county,3)); % as a cell, 3rd col has risk level
            if strcmp(county_risk_level{1},level)
                ids_2_plot(i) = true;
            end
        end
    end
end

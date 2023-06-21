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

This is an auxiliary file to filter point sources by emissions

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function [ids_2_plot] = filter_by_emissions(app,pt_src_text,level)

switch pt_src_text
    case "Power Plants"
        emissions_data = app.PowerPlantsNode.NodeData.GHGQUANTITY_METRICTONSCO2e_;
    case "Cement Plants"
        emissions_data = app.CementPlantsNode.NodeData.GHGQUANTITY_METRICTONSCO2e_;
    case "Ethanol Plants"
        emissions_data = app.EthanolPlantsNode.NodeData.GHGQUANTITY_METRICTONSCO2e_;
    case "Iron and Steel Plants"
        emissions_data = app.IronandSteelPlantsNode.NodeData.GHGQUANTITY_METRICTONSCO2e_;
end

% point source data is in metric tons CO2e, need to convert to Mega tons
ids_2_plot = emissions_data/(1e6)>level;

end
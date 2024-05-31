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

This is an auxiliary file to plot point data

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------


function pointLayer(ax, nodes,states_2_plot,emmissions_min,dist_max,inject_lat_lon)

ids2plt = true(size(nodes.NodeData,1),1);

if nargin>2 && ~isempty(states_2_plot)
    ids2plt = ids2plt & ismember(nodes.NodeData.CountyNS,states_2_plot);
end

if nargin>3 && ~isnan(emmissions_min)
    ids2plt = ids2plt & (nodes.NodeData.GHGQUANTITY_METRICTONSCO2e_>emmissions_min);
end

if nargin>4
    deg2mi = @(x)69*x; % convert degrees to miles

    N_pt_src = size(nodes.NodeData,1);
    N_inj= size(inject_lat_lon,1);

    inds_dist = false(N_pt_src,1);

    for i = 1:N_pt_src
        dist_deg = distance([ones(N_inj,1)*nodes.NodeData.LATITUDE(i),ones(N_inj,1)*nodes.NodeData.LONGITUDE(i)],inject_lat_lon);
        inds_dist(i) = any(deg2mi(dist_deg)<dist_max);
    end

    ids2plt = ids2plt & inds_dist;
end

filter_flag = sum(ids2plt) < size(nodes.NodeData,1);

switch string(nodes.Text)
    case "Power Plants"

        if  filter_flag% if there was a filter
            MEC = '#000000';
        else
            MEC = '#8E939E';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'o', 'MarkerSize', 10,...
            'MarkerFaceColor','#8E939E', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text, 'displayname','Power Plants' );% old red color FF513D
    case "Cement Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#073090';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 's', 'MarkerSize', 10,...
            'MarkerFaceColor','#073090', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Cement Plants' );% old blue color 3D6AFF

    case "Ethanol Plants"

        if filter_flag
            MEC ='#000000';
        else
            MEC ='#288B28';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'p', 'MarkerSize', 10,...
            'MarkerFaceColor','#288B28', 'MarkerEdgeColor',MEC,...%FAAE17
            'Tag', nodes.Text, 'displayname','Ethanol Plant' );% old yellow color fc6f03
    case "Iron and Steel Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#1E6868';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', '^', 'MarkerSize', 10,...
            'MarkerFaceColor','#1E6868', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Iron and Steel Plants'  );% old green color 00A300
    case "Injection Sites"
        geoplot(ax, nodes.NodeData,...
            'Marker', 'o', 'MarkerSize', 7,...
            'MarkerFaceColor','#25BE8B', 'MarkerEdgeColor','#25BE8B',...
            'Tag', nodes.Text,'displayname','Injection Sites' );


end


end

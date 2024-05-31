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


% function pointLayer(ax, nodes,states_2_plot,emmissions_min,dist_max,inject_lat_lon)
function pointLayer(ax, nodes,ids2plt)

if nargin<3
ids2plt = true(size(nodes.NodeData,1),1);
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
            'Tag', nodes.Text, 'displayname','Power Plants' );
    case "Cement Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#073090';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 's', 'MarkerSize', 10,...
            'MarkerFaceColor','#073090', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Cement Plants' );

    case "Ethanol Plants"

        if filter_flag
            MEC ='#000000';
        else
            MEC ='#288B28';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'p', 'MarkerSize', 10,...
            'MarkerFaceColor','#288B28', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text, 'displayname','Ethanol Plant' );
    case "Iron and Steel Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#1E6868';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', '^', 'MarkerSize', 10,...
            'MarkerFaceColor','#1E6868', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Iron and Steel Plants'  );
    case "Injection sites"
        geoplot(ax, nodes.NodeData,...
            'Marker', 'o', 'MarkerSize', 7,...
            'MarkerFaceColor','#25BE8B', 'MarkerEdgeColor','#25BE8B',...
            'Tag', nodes.Text,'displayname','Injection Sites' );
    case 'TCTAC Awardees'
        IDs = strcmp(nodes.NodeData.R_or_N,"R");
        geoplot(ax,nodes.NodeData(IDs,:),'Marker','diamond',...
            'MarkerFaceColor',"k","MarkerEdgeColor","k",...
            'displayname','Regional TCTAC Awardee','Tag',nodes.Text)

        geoplot(ax,nodes.NodeData(~IDs,:),'Marker','diamond',...
            'MarkerFaceColor','#f798fa',"MarkerEdgeColor","#f798fa",...
            'displayname','National TCTAC Awardee','Tag',nodes.Text)
    case 'TCTAC Partners'
        geoplot(ax,nodes.NodeData,'Marker','^',...
            'MarkerFaceColor',[0.5 0.5 0.5],"MarkerEdgeColor",[0.25 0.25 0.25],...
            'displayname','TCTAC Awardee Partner','Tag',nodes.Text)


end


end

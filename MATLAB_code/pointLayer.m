function pointLayer(ax, nodes,states_2_plot,emmissions_min)

ids2plt = true(size(nodes.NodeData,1),1);

if nargin>2 && ~isempty(states_2_plot)
    ids2plt = ids2plt & ismember(nodes.NodeData.STATE,states_2_plot);
end

if nargin>3
    ids2plt = ids2plt & (nodes.NodeData.GHGQUANTITY_METRICTONSCO2e_>emmissions_min);
end

filter_flag = sum(ids2plt) < size(nodes.NodeData,1);

switch string(nodes.Text)
    case "Power Plants"

        if  filter_flag% if there was a filter
            MEC = '#FFC300';
        else
            MEC = '#FF513D';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'o', 'MarkerSize', 7,...
            'MarkerFaceColor','#FF513D', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text, 'displayname','Power Plants' );
    case "Cement Plants"

        if filter_flag
            MEC = '#FFC300';
        else
            MEC = '#3D6AFF';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 's', 'MarkerSize', 7,...
            'MarkerFaceColor','#3D6AFF', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Cement Plants' );

    case "Ethanol Plants"

        if filter_flag
            MEC ='#FFC300';
        else
            MEC ='#FFD23F';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'p', 'MarkerSize', 7,...
            'MarkerFaceColor','#FFD23F', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text, 'displayname','Ethanol Plant' );
    case "Iron and Steel Plants"

        if filter_flag
            MEC = '#FFC300';
        else
            MEC = '#00A300';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', '^', 'MarkerSize', 7,...
            'MarkerFaceColor','#00A300', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Iron and Steel Plants'  );
    case "Injection Sites"
        geoplot(ax, nodes.NodeData,...
            'Marker', 'o', 'MarkerSize', 10,...
            'MarkerFaceColor','#25BE8B', 'MarkerEdgeColor','#25BE8B',...
            'Tag', nodes.Text,'displayname','Injection Sites' );
end


end

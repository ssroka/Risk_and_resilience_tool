function pointLayer(ax, nodes)


        switch string(nodes.Text)
            case "Power Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 'o', 'MarkerSize', 7, 'Tag', nodes.Text, MarkerFaceColor = '#FF513D', MarkerEdgeColor = '#FF513D');
            case "Cement Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 's', 'MarkerSize', 7, 'Tag', nodes.Text, MarkerFaceColor = '#3D6AFF', MarkerEdgeColor = '#3D6AFF');
            case "Ethanol Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 'p', 'MarkerSize', 7, 'Tag', nodes.Text, MarkerFaceColor = '#FFD23F', MarkerEdgeColor = '#FFD23F');
            case "Iron and Steel Plant"
                geoplot(ax, nodes.NodeData, 'Marker', '^', 'MarkerSize', 7, 'Tag', nodes.Text, MarkerFaceColor = '#00A300', MarkerEdgeColor = '#FFD23F');
            case "Injection Sites"
                geoplot(ax, nodes.NodeData, 'Marker', 'o', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#25BE8B', MarkerEdgeColor = '#25BE8B');
        end


end

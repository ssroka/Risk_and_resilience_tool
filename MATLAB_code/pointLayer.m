function pointLayer(ax, nodes, event)

for t = 1:size(event.Source.CheckedNodes)

    if any(event.Source.CheckedNodes(t) == event.Source.Children(1).Children)

        switch string(nodes.Text)
            case "Power Plant"
                geoplot(ax, nodes.NodeData, 'Marker', '.', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#FF513D', MarkerEdgeColor = '#FF513D');
            case "Cement Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 's', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#3D6AFF', MarkerEdgeColor = '#3D6AFF');
            case "Ethanol Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 'h', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#FFD23F', MarkerEdgeColor = '#FFD23F');
        end
    elseif any(event.Source.CheckedNodes(t) == event.Source.Children(2).Children)

        switch string(nodes.Text)
            case "Injection Sites"
                geoplot(ax, nodes.NodeData, 'Marker', '.', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#25BE8B', MarkerEdgeColor = '#25BE8B');
        end

    end


end

end

function pointLayer(ax, nodes, event)

for t = 1:size(event.Source.CheckedNodes)

    if any(event.Source.CheckedNodes(t) == event.Source.Children(1).Children)

        switch string(nodes.Text)
            case "Power Plant"
                geoplot(ax, nodes.NodeData, 'Marker', '.', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#303638', MarkerEdgeColor = '#303638');
            case "Cement Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 's', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#303638', MarkerEdgeColor = '#303638');
            case "Ethanol Plant"
                geoplot(ax, nodes.NodeData, 'Marker', 'h', 'MarkerSize', 10, 'Tag', nodes.Text, MarkerFaceColor = '#303638', MarkerEdgeColor = '#303638');
        end

    end


end

end

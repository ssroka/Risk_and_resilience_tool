function lineLayer(ax, checkedNode, event)

for t = 1:size(event.Source.CheckedNodes)

    if any(event.Source.CheckedNodes(t) == event.Source.Children(2).Children)

        switch string(event.Source.CheckedNodes(t).Text)
            case "Pipelines"
                geoplot(ax, checkedNode.NodeData, 'linewidth', 2,...
                    'Tag', checkedNode.Text,'displayname','Pipelines',...
                    Color = '#0EAD69');
        end

    end


end

end

function riskLayer(ax, nodeData, event)

for t = 1:size(event.Source.CheckedNodes)

    if any(event.Source.CheckedNodes(t) == event.Source.Children(5))

        for s = 1:10

            switch string(nodeData{s, end})
                case "Very High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#9341B3');
                case "Relatively High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#9D4ABE');
                case "Relatively Moderate"
                    geoplot(ax, nodeData(s, :), FaceColor = '#A458C3');
                case "Relatively Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#AC66C8');
                case "Very Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#B474CD');
                case "No Rating"
                    geoplot(ax, nodeData(s, :), FaceColor = '#BB82D2');
                case "Not Applicable"
                    geoplot(ax, nodeData(s, :), FaceColor = '#C390D7');
                case "Insufficient Data"
                    geoplot(ax, nodeData(s, :), FaceColor = '#CA9EDC');
            end

        end

    elseif any(event.Source.CheckedNodes(t) == event.Source.Children(6))

        for s = 1:10

            switch string(nodeData{s, end})
                case "Very High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#469374');
                case "Relatively High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#4EA280');
                case "Relatively Moderate"
                    geoplot(ax, nodeData(s, :), FaceColor = '#57AE8B');
                case "Relatively Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#65B595');
                case "Very Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#73BC9E');
                case "No Rating"
                    geoplot(ax, nodeData(s, :), FaceColor = '#81C2A8');
                case "Not Applicable"
                    geoplot(ax, nodeData(s, :), FaceColor = '#8FC9B2');
                case "Insufficient Data"
                    geoplot(ax, nodeData(s, :), FaceColor = '#9DD0BB');
            end

        end

    else

        for s = 1:10

            switch string(nodeData{s, end})
                case "Very High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#E3427D');
                case "Relatively High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#E54E85');
                case "Relatively Moderate"
                    geoplot(ax, nodeData(s, :), FaceColor = '#E75B8E');
                case "Relatively Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#E96998');
                case "Very Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#EB77A1');
                case "No Rating"
                    geoplot(ax, nodeData(s, :), FaceColor = '#ED84AB');
                case "Not Applicable"
                    geoplot(ax, nodeData(s, :), FaceColor = '#EF92B4');
                case "Insufficient Data"
                    geoplot(ax, nodeData(s, :), FaceColor = '#F1A0BD');
            end

        end

    end
end

end
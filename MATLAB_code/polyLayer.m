function polyLayer(ax, nodeData, event)
n_polys = size(nodeData,1);
for t = 1:size(event.Source.CheckedNodes)


    % Social vulnerability
    if any(event.Source.CheckedNodes(t) == event.Source.Children(5))

        for s = 1:n_polys

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

        % Community resilience
    elseif any(event.Source.CheckedNodes(t) == event.Source.Children(6))

        for s = 1:n_polys

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

        % Sinks
    elseif any(event.Source.CheckedNodes(t) == event.Source.Children(2).Children(3))
        geoplot(ax, nodeData, FaceColor = '#3BCEAC');

        % eGrid Subregions
    elseif any(event.Source.CheckedNodes(t) == [event.Source.Children(7);event.Source.Children(7).Children(:)])
        % make a colorbar based on the most recent year
        % 2020 is the most recent year in the data
        scl_clr = (nodeData.CO2e_2020-min(nodeData.CO2e_2020))./(max(nodeData.CO2e_2020)-min(nodeData.CO2e_2020));
        for s = 1:n_polys
            geoplot(ax, nodeData(s,:), 'FaceColor',[0 0 scl_clr(s)])
        end
%         legend(ax,'Location','southwest')

        % for loop for natural hazards
    else

        for s = 1:n_polys

            switch string(nodeData{s, end})
                case "Very High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#900C3F');
                case "Relatively High"
                    geoplot(ax, nodeData(s, :), FaceColor = '#C70039');
                case "Relatively Moderate"
                    geoplot(ax, nodeData(s, :), FaceColor = '#FF5733');
                case "Relatively Low"
                    geoplot(ax, nodeData(s, :), FaceColor = '#FFC300');
%                 case "Very Low"
%                     geoplot(ax, nodeData(s, :), FaceColor = '#DAF7A6');
%                 case "No Rating"
%                     geoplot(ax, nodeData(s, :), FaceColor = '#E8E8E8');
%                 case "Not Applicable"
%                     geoplot(ax, nodeData(s, :), FaceColor = '#E8E8E8');
%                 case "Insufficient Data"
%                     geoplot(ax, nodeData(s, :), FaceColor = '#E8E8E8');
            end



        end

    end
end

end
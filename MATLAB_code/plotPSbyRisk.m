function plotPSbyRisk(ax, T, app, riskType, index)
switch string(index)
    case "Very High"
        for state = 1:51

            if riskType.NodeData{state, end} == "Very High";
                indx_state = string(T{:, 'STATE'}) == app.Node3.NodeData{:, 'STATEABBRV'}{state};
                geoplot(ax, T{indx_state, 6}, T{indx_state, 7}, "om", MarkerFaceColor = "m");
            end
        end
end
end
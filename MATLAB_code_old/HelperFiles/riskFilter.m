function riskFilter(ax, T, app, risk_type, risk_level, ii)

% for avalanches, check the index value entered by user and plot the first point
% source if it is in a very high risk avalanche area
switch string(risk_level)

    % the user said "very high"
    case "Very High"

        % create table selecting the states that have a very high avalanche
        % rating
        state_risk_level = string(risk_type.NodeData{:, end}) == "Very High";

        % assign state abbreviations to statess
        states = string(app.Node3.NodeData{state_risk_level, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == states)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#E3427D")
        end

    case "Relatively High"

        % create table selecting the states that have a very high avalanche
        % rating
        state_risk_level = string(risk_type.NodeData{:, end}) == "Relatively High";

        % assign state abbreviations to statess
        states = string(app.Node3.NodeData{state_risk_level, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == states)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = '#E54E85')
        end

    case "Relatively Moderate"

        % create table selecting the states that have a very high avalanche
        % rating
        state_risk_level = string(risk_type.NodeData{:, end}) == "Relatively Moderate";

        % assign state abbreviations to statess
        states = string(app.Node3.NodeData{state_risk_level, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == states)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#E75B8E")
        end

    case "Relatively Low"

        % create table selecting the states that have a very high avalanche
        % rating
        state_risk_level = string(risk_type.NodeData{:, end}) == "Relatively Low";

        % assign state abbreviations to statess
        states = string(app.Node3.NodeData{state_risk_level, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == states)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#540D6E", MarkerEdgeColor = "#540D6E")
        end

    case "Very Low"

        % create table selecting the states that have a very high avalanche
        % rating
        state_risk_level = string(risk_type.NodeData{:, end}) == "Very Low";

        % assign state abbreviations to statess
        states = string(app.Node3.NodeData{state_risk_level, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == states)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#EB77A1")
        end

end
end
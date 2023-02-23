function plotPSbyRisk(ax, T, app, riskType, indx, ii)

% for avalanches, check the index value entered by user and plot the first point
% source if it is in a very high risk avalanche area
switch string(indx)

    % the user said "very high"
    case "Very High"

        % create table selecting the states that have a very high avalanche
        % rating
        indx_state_risk = string(riskType.NodeData{:, end}) == "Very High";

        % assign state abbreviations to indx_states
        indx_state = string(app.Node3.NodeData{indx_state_risk, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == indx_state)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#a63603")
        end

    case "Relatively High"

        % create table selecting the states that have a very high avalanche
        % rating
        indx_state_risk = string(riskType.NodeData{:, end}) == "Relatively High";

        % assign state abbreviations to indx_states
        indx_state = string(app.Node3.NodeData{indx_state_risk, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == indx_state)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = '#e6550d')
        end

    case "Relatively Moderate"

        % create table selecting the states that have a very high avalanche
        % rating
        indx_state_risk = string(riskType.NodeData{:, end}) == "Relatively Moderate";

        % assign state abbreviations to indx_states
        indx_state = string(app.Node3.NodeData{indx_state_risk, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == indx_state)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#fd8d3c")
        end

    case "Relatively Low"

        % create table selecting the states that have a very high avalanche
        % rating
        indx_state_risk = string(riskType.NodeData{:, end}) == "Relatively Low";

        % assign state abbreviations to indx_states
        indx_state = string(app.Node3.NodeData{indx_state_risk, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == indx_state)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#fdbe85")
        end

    case "Very Low"

        % create table selecting the states that have a very high avalanche
        % rating
        indx_state_risk = string(riskType.NodeData{:, end}) == "Very Low";

        % assign state abbreviations to indx_states
        indx_state = string(app.Node3.NodeData{indx_state_risk, 'STATEABBRV'});

        % see if the state of the first point source matches any of the
        % states with a very high avalanche rating
        if any(string(T{ii, 'STATE'}) == indx_state)
            geoplot(ax, T{ii, 'LATITUDE'}, T{ii, 'LONGITUDE'}, "o", MarkerFaceColor = "#feedde")
        end

end
end
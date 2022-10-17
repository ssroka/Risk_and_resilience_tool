%{
CARBON Tool

This is an auxiliary file to plot line data

Author: Abigail Idiculla
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------

function lineLayer(ax, checkedNode, event)

        switch string(checkedNode.Text)
            case "Operational Pipelines"
                geoplot(ax, checkedNode.NodeData, 'linewidth', 2, 'linestyle', '-',...
                    'Tag', checkedNode.Text,'displayname','Operational Pipelines',...
                    Color = '#0f0e0d');
            case "Planned Pipelines"
                % possible transcription error, removing first 2 lines
                geoplot(ax, checkedNode.NodeData(3:end,:), 'linewidth', 2, 'linestyle', ':',...
                    'Tag', checkedNode.Text,'displayname','Planned Pipelines',...
                    Color = '#0f0e0d');

        end


end

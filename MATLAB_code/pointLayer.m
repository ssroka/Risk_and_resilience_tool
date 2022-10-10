%{
CARBON Tool

This is an auxiliary file to plot point data

Author: Abigail Idiculla
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------


function pointLayer(ax, nodes,states_2_plot,emmissions_min,dist_max,inject_lat_lon)

ids2plt = true(size(nodes.NodeData,1),1);

if nargin>2 && ~isempty(states_2_plot)
    ids2plt = ids2plt & ismember(nodes.NodeData.STATE,states_2_plot);
end

if nargin>3 && ~isnan(emmissions_min)
    ids2plt = ids2plt & (nodes.NodeData.GHGQUANTITY_METRICTONSCO2e_>emmissions_min);
end

if nargin>4
    deg2mi = @(x)69*x; % convert degrees to miles

    N_pt_src = size(nodes.NodeData,1);
    N_inj= size(inject_lat_lon,1);

    inds_dist = false(N_pt_src,1);

    for i = 1:N_pt_src
        dist_deg = distance([ones(N_inj,1)*nodes.NodeData.LATITUDE(i),ones(N_inj,1)*nodes.NodeData.LONGITUDE(i)],inject_lat_lon);
        inds_dist(i) = any(deg2mi(dist_deg)<dist_max);
    end

    ids2plt = ids2plt & inds_dist;
end

filter_flag = sum(ids2plt) < size(nodes.NodeData,1);

switch string(nodes.Text)
    case "Power Plants"

        if  filter_flag% if there was a filter
            MEC = '#000000';
        else
            MEC = '#FF513D';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'o', 'MarkerSize', 4,...
            'MarkerFaceColor','#FF513D', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text, 'displayname','Power Plants' );
    case "Cement Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#3D6AFF';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 's', 'MarkerSize', 5,...
            'MarkerFaceColor','#3D6AFF', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Cement Plants' );

    case "Ethanol Plants"

        if filter_flag
            MEC ='#000000';
        else
            MEC ='#FFD23F';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
            'Marker', 'p', 'MarkerSize', 5,...
            'MarkerFaceColor','#FFD23F', 'MarkerEdgeColor',MEC,...%FAAE17
            'Tag', nodes.Text, 'displayname','Ethanol Plant' );
    case "Iron and Steel Plants"

        if filter_flag
            MEC = '#000000';
        else
            MEC = '#00A300';
        end
        geoplot(ax, nodes.NodeData(ids2plt,:),...
<<<<<<< HEAD
            'Marker', '^', 'MarkerSize', 10,...
=======
            'Marker', '^', 'MarkerSize', 5,...
>>>>>>> ae1ec9ee98447664bebd4f579cc3bb3883c8a691
            'MarkerFaceColor','#00A300', 'MarkerEdgeColor',MEC,...
            'Tag', nodes.Text,'displayname','Iron and Steel Plants'  );
    case "Injection Sites"
        geoplot(ax, nodes.NodeData,...
            'Marker', 'o', 'MarkerSize', 7,...
            'MarkerFaceColor','#25BE8B', 'MarkerEdgeColor','#25BE8B',...
            'Tag', nodes.Text,'displayname','Injection Sites' );
end


end

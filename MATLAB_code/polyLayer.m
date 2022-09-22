function polyLayer(ax, nodes, event)
% n_polys = size(nodes.NodeData,1);


switch string(nodes.Text)
    case 'Social Vulnerability'
        [IDs] = getNRI_IDs(nodes.NodeData.SOVI_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData)

    case  'Community Resilience'
        [IDs] = getNRI_IDs(nodes.NodeData.RESL_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Drought'
        [IDs] = getNRI_IDs(nodes.NodeData.DRGT_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Hurricane'
        [IDs] = getNRI_IDs(nodes.NodeData.HRCN_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Riverine Flooding'
        [IDs] = getNRI_IDs(nodes.NodeData.RFLD_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Strong Wind'
        [IDs] = getNRI_IDs(nodes.NodeData.SWND_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Wildfire'
        [IDs] = getNRI_IDs(nodes.NodeData.WFIR_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData)

    case 'Emissions [lbs CO2_e / MWh]'
        [IDs] = geteGRID_IDs(nodes.NodeData.lbspMWh_2020);

        geoplot(ax, nodes.NodeData(IDs(:,1), :), FaceColor = '#FEFFFF');
        geoplot(ax, nodes.NodeData(IDs(:,2), :), FaceColor = '#E3FFE8');
        geoplot(ax, nodes.NodeData(IDs(:,3), :), FaceColor = '#a3ffb4');
        geoplot(ax, nodes.NodeData(IDs(:,4), :), FaceColor = '#2cba00');
        geoplot(ax, nodes.NodeData(IDs(:,5), :), FaceColor = '#a3ff00');
        geoplot(ax, nodes.NodeData(IDs(:,6), :), FaceColor = '#fff400');
        geoplot(ax, nodes.NodeData(IDs(:,7), :), FaceColor = '#ffa700');
        geoplot(ax, nodes.NodeData(IDs(:,8), :), FaceColor = '#ff0000');
    case 'Emissions Reduction'


end


    function [] = plot_NRI(ax,IDs,data)
        % "Very Low"
        geoplot(ax, data(IDs(:,1), :), FaceColor = '#DAF7A6');
        % "Relatively Low"
        geoplot(ax, data(IDs(:,2), :), FaceColor = '#FFC300');
        % "Relatively Moderate"
        geoplot(ax, data(IDs(:,3), :), FaceColor = '#FF5733');
        % "Relatively High"
        geoplot(ax, data(IDs(:,4), :), FaceColor = '#C70039');
        % "Very High"
        geoplot(ax, data(IDs(:,5), :), FaceColor = '#900C3F');
        %             % "Empty"
        %                 geoplot(ax, nodes.NodeData(IDs(:,6), :), FaceColor = '#E8E8E8');

    end


    function [IDs] = getNRI_IDs(rating)
        IDs = false(size(rating,1),8);
        IDs(:,1) = strcmp(rating,'Very Low');
        IDs(:,2) = strcmp(rating,'Relatively Low');
        IDs(:,3) = strcmp(rating,'Relatively Moderate');
        IDs(:,4) = strcmp(rating,'Relatively High' );
        IDs(:,5) = strcmp(rating,'Very High');

%         IDs(:,6) = strcmp(rating,'Empty');

%         IDs(:,7) = strcmp(rating,'No Rating');
%         IDs(:,8) = strcmp(rating,'Not Applicable');
%         IDs(:,9) = strcmp(rating,'Insufficient Data');
    end

    function [IDs] = geteGRID_IDs(rating)
        IDs = false(size(rating,1),5);
        IDs(:,1) = rating<250;
        IDs(:,2) = (rating>=250).*(rating<500);
        IDs(:,3) = (rating>=500).*(rating<750);
        IDs(:,4) = (rating>=750).*(rating<1000);
        IDs(:,5) = (rating>=1000).*(rating<1250);
        IDs(:,6) = (rating>=1250).*(rating<1500);
        IDs(:,7) = (rating>=1500).*(rating<1750);
        IDs(:,8) = rating>=1750;
    end

end
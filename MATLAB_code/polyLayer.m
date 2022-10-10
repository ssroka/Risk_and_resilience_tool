%{
CARBON Tool

This is an auxiliary file to plot polygon data

Author: Abigail Idiculla
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function polyLayer(ax, nodes)


switch string(nodes.Text)
    case 'Sequestration Reservouir'
        geoplot(ax, nodes.NodeData,...
            'Tag', nodes.Text,'displayname','Sequestration Reservoir',...
            FaceColor = '#25BE8B');

    case 'Social Vulnerability'
        [IDs] = getNRI_IDs(nodes.NodeData.SOVI_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case  'Community Resilience'
        [IDs] = getNRI_IDs(nodes.NodeData.RESL_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Drought'
        [IDs] = getNRI_IDs(nodes.NodeData.DRGT_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Hurricane'
        [IDs] = getNRI_IDs(nodes.NodeData.HRCN_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Riverine Flooding'
        [IDs] = getNRI_IDs(nodes.NodeData.RFLD_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Strong Wind'
        [IDs] = getNRI_IDs(nodes.NodeData.SWND_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Wildfire'
        [IDs] = getNRI_IDs(nodes.NodeData.WFIR_RISKR);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Power Sector Carbon Intensity [lbs CO2_e / MWh]'
        [IDs] = geteGRID_IDs(nodes.NodeData.lbspMWh_2020);

        geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','< 250 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#FEFFFF');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','250-500 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#E3FFE8');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','500-1000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#a3ffb4');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','1000-1500 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#2cba00');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','1500-2000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#a3ff00');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','>2000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#fff400');
    case 'Population'
        [IDs] = getPop_IDs(nodes.NodeData.POPULATION);
        geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','<4m',...
            'Tag', nodes.Text,...
            FaceColor = '#a3ff00');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','4m-8m',...
            'Tag', nodes.Text,...
            FaceColor = '#fff400');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','8m-10m',...
            'Tag', nodes.Text,...
            FaceColor = '#ffa700');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','>10m',...
            'Tag', nodes.Text,...
            FaceColor = '#ff0000');

end


    function [] = plot_NRI(ax,IDs,data,TagText)
        % "Very Low"
        geoplot(ax, data(IDs(:,1), :),'Tag', TagText,...
            'displayname',"Very Low", FaceColor = '#DAF7A6');
        % "Relatively Low"
        geoplot(ax, data(IDs(:,2), :),'Tag', TagText,...
            'displayname',"Relatively Low", FaceColor = '#FFC300');
        % "Relatively Moderate"
        geoplot(ax, data(IDs(:,3), :),'Tag', TagText,...
            'displayname',"Relatively Moderate", FaceColor = '#FF5733');
        % "Relatively High"
        geoplot(ax, data(IDs(:,4), :),'Tag', TagText,...
            'displayname',"Relatively High", FaceColor = '#C70039');
        % "Very High"
        geoplot(ax, data(IDs(:,5), :),'Tag', TagText,...
            'displayname',"Very High", FaceColor = '#900C3F');
        % "Empty"
        %  geoplot(ax, nodes.NodeData(IDs(:,6), :), FaceColor = '#E8E8E8');

    end

    function [IDs] = getNRI_IDs(rating)
        % other possible ratings that are not plotted are
        % 'No Rating', 'Not Applicable', 'Insufficient Data'
        % all of which are denoted with 'Empty' in this data
        IDs = false(size(rating,1),8);
        IDs(:,1) = strcmp(rating,'Very Low');
        IDs(:,2) = strcmp(rating,'Relatively Low');
        IDs(:,3) = strcmp(rating,'Relatively Moderate');
        IDs(:,4) = strcmp(rating,'Relatively High' );
        IDs(:,5) = strcmp(rating,'Very High');
    end

    function [IDs] = geteGRID_IDs(rating)
        IDs = false(size(rating,1),5);
        IDs(:,1) = rating<250;
        IDs(:,2) = (rating>=250).*(rating<500);
        IDs(:,3) = (rating>=500).*(rating<1000);
        IDs(:,4) = (rating>=1000).*(rating<1500);
        IDs(:,5) = (rating>=1500).*(rating<2000);
        IDs(:,6) = rating>=2000;
    end

    function [IDs] = getPop_IDs(rating)
        IDs = false(size(rating,1),5);
        IDs(:,1) = rating<4e6;
        IDs(:,2) = (rating>=4e6).*(rating<8e6);
        IDs(:,3) = (rating>=8e6).*(rating<10e6);
        IDs(:,4) = rating>=10e6;
    end

end
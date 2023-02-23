%{
CARBON Tool

This is an auxiliary file to plot polygon data

Author: Abigail Idiculla
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function polyLayer(ax, nodes, states_2_plot)

ids2plt = true(size(nodes.NodeData,1),1);

if nargin>2 && ~isempty(states_2_plot)
    ids2plt = ids2plt & ismember(nodes.NodeData.COUNTYNS,states_2_plot);
end

filter_flag = sum(ids2plt) < size(nodes.NodeData,1);

switch string(nodes.Text)
    case 'Sequestration Reservouir'
        geoplot(ax, nodes.NodeData,...
            'Tag', nodes.Text,'displayname','Sequestration Reservoir',...
            FaceColor = '#ec03fc');

    case 'Social Vulnerability'
        [IDs] = getNRI_IDs(nodes.NodeData.SOVI_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case  'Community Resilience'
        [IDs] = getNRI_IDs(nodes.NodeData.RESL_RATNG);
        plot_NRI(ax,IDs,nodes.NodeData,nodes.Text)

    case 'Earthquake'
        [IDs] = getNRI_IDs(nodes.NodeData.ERQK_RISKR);
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

    case 'NDVI'
        NDVI_filtered = nodes.NodeData(ids2plt,:);
        [IDs] = getNDVI_IDs(NDVI_filtered.NDVI);

        geoplot(ax, NDVI_filtered(IDs(:,1), :),...
            'displayname','NDVI < 0',...
            'Tag', nodes.Text,...
            'FaceColor','#FF8300');
        geoplot(ax, NDVI_filtered(IDs(:,2), :),...
            'displayname','NDVI 0-0.25',...
            'Tag', nodes.Text,...
            'FaceColor', '#FEDE00');
        geoplot(ax, NDVI_filtered(IDs(:,3), :),...
            'displayname','NDVI 0.25-0.5',...
            'Tag', nodes.Text,...
            'FaceColor', '#C8DF52');
        geoplot(ax, NDVI_filtered(IDs(:,4), :),...
            'displayname','NDVI 0.5-0.75',...
            'Tag', nodes.Text,...
            'FaceColor','#B7AC44');
        geoplot(ax, NDVI_filtered(IDs(:,5), :),...
            'displayname','NDVI 0.75-1',...
            'Tag', nodes.Text,...
            'FaceColor', '#0A7029');

    case '2021'
        [IDs] = geteGRID_IDs(nodes.NodeData.CI_2021);

        geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','< 500 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#0A7029');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','500-600 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#B7AC44');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','600-700 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#C8DF52');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','700-800 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#FEDE00');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','800-900 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#FF8300');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','900-1000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#FF4500');
        geoplot(ax, nodes.NodeData(IDs(:,7), :),...
            'displayname','>1000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#DF362D');

    case '2050 projection'
        [IDs] = geteGRID_IDs(nodes.NodeData.CI_2050);

        geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','< 500 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#0A7029');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','500-600 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#B7AC44');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','600-700 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#C8DF52');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','700-800 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#FEDE00');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','800-900 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor', '#FF8300');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','900-1000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#FF4500');
        geoplot(ax, nodes.NodeData(IDs(:,7), :),...
            'displayname','>1000 lbs/MWh',...
            'Tag', nodes.Text,...
            'FaceColor','#DF362D');
    case 'Population'
        [IDs] = getPop_IDs(nodes.NodeData.POPULATION);
        geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','<10k population',...
            'Tag', nodes.Text,...
            FaceColor = '#a3ff00');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','10k-100k population',...
            'Tag', nodes.Text,...
            FaceColor = '#fff400');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','100k-1m population',...
            'Tag', nodes.Text,...
            FaceColor = '#ffa700');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','>1m population',...
            'Tag', nodes.Text,...
            FaceColor = '#ff0000');
    case 'RCP 4.5'


        if strcmp(nodes.Parent.Text,'Consecutive Days without Precipitation')
            [IDs] = getNoPrecip_IDs(nodes.NodeData.no_prec_45);
       geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','No Precip <20 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#028EC9');          
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','No Precip 20-30 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#6986C4');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','No Precip 30-40 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#DC7EBE');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','No Precip 40-50 days',...
            'Tag', nodes.Text,...
            'FaceColor','#EE757C');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','No Precip > 50 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#FF6D3C');

        elseif strcmp(nodes.Parent.Text,'Total Annual Precipitation [in]')
            [IDs] = getPrecipInches_IDs(nodes.NodeData.prec_45);
           geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','Precip < 10 in',...
            'Tag', nodes.Text,...
            'FaceColor','#E9FAA0');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','Precip 10-20 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#A0DE77');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','Precip 20-30 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#5BC350');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','Precip 30-40 in',...
            'Tag', nodes.Text,...
            'FaceColor','#2EA753');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','Precip 40-50 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#178A84');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','Precip >50 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#006CB5');
        end
    case 'RCP 8.5'
        if strcmp(nodes.Parent.Text,'Max Daily Summer Avg Temperature')
            [IDs] = getMaxTemp_IDs(nodes.NodeData.T_max_85);
            geoplot(ax, nodes.NodeData(IDs(:,1), :),...
                'displayname','Max Temp < 60 F',...
                'Tag', nodes.Text,...
                'FaceColor', '#23BEB6');
            geoplot(ax, nodes.NodeData(IDs(:,2), :),...
                'displayname','Max Temp 60-70 F',...
                'Tag', nodes.Text,...
                'FaceColor','#FEF7C2');
            geoplot(ax, nodes.NodeData(IDs(:,3), :),...
                'displayname','Max Temp 70-80 F',...
                'Tag', nodes.Text,...
                'FaceColor','#FDE74C');
            geoplot(ax, nodes.NodeData(IDs(:,4), :),...
                'displayname','Max Temp 80-90 F',...
                'Tag', nodes.Text,...
                'FaceColor', '#F85A12');
            geoplot(ax, nodes.NodeData(IDs(:,5), :),...
                'displayname','Max Temp 90-100 F',...
                'Tag', nodes.Text,...
                'FaceColor', '#FF0000');
            geoplot(ax, nodes.NodeData(IDs(:,6), :),...
                'displayname','Max Temp > 100 F',...
                'Tag', nodes.Text,...
                'FaceColor', '#911229');

        elseif strcmp(nodes.Parent.Text,'Consecutive Days without Precipitation')
        [IDs] = getNoPrecip_IDs(nodes.NodeData.no_prec_85);
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','No Precip <20 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#028EC9');          
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','No Precip 20-30 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#6986C4');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','No Precip 30-40 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#DC7EBE');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','No Precip 40-50 days',...
            'Tag', nodes.Text,...
            'FaceColor','#EE757C');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','No Precip > 50 days',...
            'Tag', nodes.Text,...
            'FaceColor', '#FF6D3C');

        elseif strcmp(nodes.Parent.Text,'Total Annual Precipitation [in]')
        [IDs] = getPrecipInches_IDs(nodes.NodeData.prec_85);
                geoplot(ax, nodes.NodeData(IDs(:,1), :),...
            'displayname','Precip < 10 in',...
            'Tag', nodes.Text,...
            'FaceColor','#E9FAA0');
        geoplot(ax, nodes.NodeData(IDs(:,2), :),...
            'displayname','Precip 10-20 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#A0DE77');
        geoplot(ax, nodes.NodeData(IDs(:,3), :),...
            'displayname','Precip 20-30 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#5BC350');
        geoplot(ax, nodes.NodeData(IDs(:,4), :),...
            'displayname','Precip 30-40 in',...
            'Tag', nodes.Text,...
            'FaceColor','#2EA753');
        geoplot(ax, nodes.NodeData(IDs(:,5), :),...
            'displayname','Precip 40-50 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#178A84');
        geoplot(ax, nodes.NodeData(IDs(:,6), :),...
            'displayname','Precip >50 in',...
            'Tag', nodes.Text,...
            'FaceColor', '#006CB5');
        end
end


    function [] = plot_NRI(ax,IDs,data,TagText)
        % "Very Low"
        geoplot(ax, data(IDs(:,1), :),'Tag', TagText,...
            'displayname',sprintf('Very Low %s',TagText), FaceColor = '#DAF7A6');
        % "Relatively Low"
        geoplot(ax, data(IDs(:,2), :),'Tag', TagText,...
            'displayname',sprintf('Relatively Low %s',TagText), FaceColor = '#FFC300');
        % "Relatively Moderate"
        geoplot(ax, data(IDs(:,3), :),'Tag', TagText,...
            'displayname',sprintf('Relatively Moderate %s',TagText), FaceColor = '#FF5733');
        % "Relatively High"
        geoplot(ax, data(IDs(:,4), :),'Tag', TagText,...
            'displayname',sprintf('Relatively High %s',TagText), FaceColor = '#C70039');
        % "Very High"
        geoplot(ax, data(IDs(:,5), :),'Tag', TagText,...
            'displayname',sprintf('Very High %s',TagText), FaceColor = '#702963');
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
        IDs(:,1) = rating<500;
        IDs(:,2) = (rating>=500).*(rating<600);
        IDs(:,3) = (rating>=600).*(rating<700);
        IDs(:,4) = (rating>=700).*(rating<800);
        IDs(:,5) = (rating>=800).*(rating<900);
        IDs(:,6) = (rating>=900).*(rating<1000);
        IDs(:,7) = rating>=1000;
    end

    function [IDs] = getPop_IDs(rating)
        IDs = false(size(rating,1),5);
        IDs(:,1) = rating<1e4;
        IDs(:,2) = (rating>=1e4).*(rating<1e5);
        IDs(:,3) = (rating>=1e5).*(rating<1e6);
        IDs(:,4) = rating>=1e6;
    end

    function [IDs] = getNDVI_IDs(NDVI_val)
        %NDVI_val = cell2mat(NDVI_val);
        IDs = false(size(NDVI_val,1),6);
        IDs(:,1) = NDVI_val<0;
        IDs(:,2) = (NDVI_val>=0).*(NDVI_val<0.25);
        IDs(:,3) = (NDVI_val>=0.25).*(NDVI_val<0.5);
        IDs(:,4) = (NDVI_val>=0.5).*(NDVI_val<0.75);
        IDs(:,5) = (NDVI_val>=0.75).*(NDVI_val<1);
        IDs(:,6) = NDVI_val>=1;
    end

    function [IDs] = getPrecipInches_IDs(prec_val)
        %NDVI_val = cell2mat(NDVI_val);
        IDs = false(size(prec_val,1),6);
        IDs(:,1) = (prec_val>0).*(prec_val<10);
        IDs(:,2) = (prec_val>=10).*(prec_val<20);
        IDs(:,3) = (prec_val>=20).*(prec_val<30);
        IDs(:,4) = (prec_val>=30).*(prec_val<40);
        IDs(:,5) = (prec_val>=40).*(prec_val<50);
        IDs(:,6) = prec_val>=50;
    end

    function [IDs] = getNoPrecip_IDs(noprec_val)
        %NDVI_val = cell2mat(NDVI_val);
        IDs = false(size(noprec_val,1),6);
        IDs(:,1) = (noprec_val>0).*(noprec_val<10);
        IDs(:,2) = (noprec_val>0).*(noprec_val<20);
        IDs(:,3) = (noprec_val>=20).*(noprec_val<30);
        IDs(:,4) = (noprec_val>=30).*(noprec_val<40);
        IDs(:,5) = (noprec_val>=40).*(noprec_val<50);
        IDs(:,6) = noprec_val>=50;
    end

    function [IDs] = getMaxTemp_IDs(T_max_val)
        %NDVI_val = cell2mat(NDVI_val);
        IDs = false(size(T_max_val,1),6);
        IDs(:,1) = (T_max_val>0).*(T_max_val<60);
        IDs(:,2) = (T_max_val>=60).*(T_max_val<70);
        IDs(:,3) = (T_max_val>=70).*(T_max_val<80);
        IDs(:,4) = (T_max_val>=80).*(T_max_val<90);
        IDs(:,5) = (T_max_val>=90).*(T_max_val<100);
        IDs(:,6) = T_max_val>=100;
    end

end
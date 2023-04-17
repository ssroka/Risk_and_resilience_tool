%{
%%%%%%%%%%%%
%
% Copyright (c) 2023 Sydney Sroka, Abigail Idiculla, and the MIT Climate and Sustainability Consortium
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
% IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
%
% Created 2022-2023 for the MIT Climate and Sustainability Consortium
% Resilience Pathway 
%
%%%%%%%%%%%%

This is an auxiliary file to plot line data

Developers: Abigail Idiculla, Sydney Sroka
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
            case 'Roads'

                Roads_filtered = checkedNode.NodeData;
                [IDs] = getRoad_IDs(checkedNode.NodeData.Refactored);

                geoplot(ax, Roads_filtered(IDs(:,1), :),...
                    'LineWidth', 0.5,'Color','k',...
                    'displayname','Roads < 1000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,2), :),...
                    'LineWidth', 0.75,'Color','k',...
                    'displayname','Roads 1000-2000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,3), :),...
                    'LineWidth', 1,'Color','k',...
                    'displayname','Roads 2000-3000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,4), :),...
                    'LineWidth', 1.25,'Color','k',...
                    'displayname','Roads 3000-4000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,5), :),...
                    'LineWidth', 1.5,'Color','k',...
                    'displayname','Roads 4000-5000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,6), :),...
                    'LineWidth', 1.75,'Color','k',...
                    'displayname','Roads 5000-6000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,7), :),...
                    'LineWidth', 2,'Color','k',...
                    'displayname','Roads 6000-7000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,8), :),...
                    'LineWidth', 2.25,'Color','k',...
                    'displayname','Roads 7000-8000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,9), :),...
                    'LineWidth', 2.5,'Color','k',...
                    'displayname','Roads 8000-9000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,10), :),...
                    'LineWidth', 2.75,'Color','k',...
                    'displayname','Roads 9000-10000',...
                    'Tag', checkedNode.Text);

                geoplot(ax, Roads_filtered(IDs(:,11), :),...
                    'LineWidth', 3,'Color','k',...
                    'displayname','Roads >= 1000',...
                    'Tag', checkedNode.Text);
    end
 

    function [IDs] = getRoad_IDs(refactor)
        IDs = false(size(refactor,1),11);        
        IDs(:,1) = refactor<1000;
        IDs(:,2) = (refactor>=1000).*(refactor<2000);
        IDs(:,3) = (refactor>=2000).*(refactor<3000);
        IDs(:,4) = (refactor>=3000).*(refactor<4000);
        IDs(:,5) = (refactor>=4000).*(refactor<5000);
        IDs(:,6) = (refactor>=5000).*(refactor<6000);
        IDs(:,7) = (refactor>=6000).*(refactor<7000);
        IDs(:,8) = (refactor>=7000).*(refactor<8000);
        IDs(:,9) = (refactor>=8000).*(refactor<9000);
        IDs(:,10) = (refactor>=9000).*(refactor<10000);
        IDs(:,11) = refactor>=10000;
    end

end
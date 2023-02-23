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
            case "Interstates"
                geoplot(ax, checkedNode.NodeData, 'linewidth', 2, 'linestyle', '-',...
                    'Tag', checkedNode.Text,'displayname','Transportation Routes',...
                    Color = '#0f0e0d');
        end


end

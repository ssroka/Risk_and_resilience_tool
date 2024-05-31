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

This is an auxiliary file to filter point sources by distance

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------
function [ids_2_plot] = filter_by_distance(pt_src_text,dist_max)


            switch pt_src_text
                case "Power Plants"
                    load('pwrplnt_D_inj.mat','pwrplnt_D_inj')
                    T = pwrplnt_D_inj;
                    clear pwrplnt_D_inj
                case "Cement Plants"
                    load('cmntplnt_D_inj.mat','cmntplnt_D_inj')
                    T = cmntplnt_D_inj;
                    clear cmntplnt_D_inj
                case "Ethanol Plants"
                    load('ethnlplnt_D_inj.mat','ethnlplnt_D_inj')
                    T = ethnlplnt_D_inj;
                    clear ethnlplnt_D_inj
                case "Iron and Steel Plants"
                    load('steelplnt_D_inj.mat','steelplnt_D_inj')
                    T = steelplnt_D_inj;
                    clear steelplnt_D_inj
            end
            ids_2_plot = any(T<dist_max,2);



end
















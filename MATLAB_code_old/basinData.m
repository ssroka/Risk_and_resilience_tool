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

This is an auxiliary file that loads in CO2 sink data

Developers: Abigail Idiculla, Sydney Sroka
Project Supervisor: Sydney Sroka
MIT Climate and Sustainability Consortium

%}
% -------------------------------------------------------------------------

function [basinTable] = basinData()

% This function reads in shape files of saline basins and outputs a
% concatenated table of all basins

% The files are in the format SAU_CXXXXXXXX.shp
% fn is a 1xn vector of all of the file numbers

fn = horzcat(50010101:50010114,...
    50020101:50020102,...
    50620101:50620103,...
    50700101:50700102,...
    50340101:50340112,...
    50040101,...
    50050101:50050102,...
    50390101:50390105,...
    50680101:100:50680301,...
    50360101:50360108,...
    50370101:50370114,...
    50490101:50490117,...
    50300101:50300112,...
    50430101:50430103,...
    50440101:50440103,...
    50450101:50450102,...
    50330101:50330110,...
    50500101:50500105,...
    50190101:50190102,...
    50200101:50200105,...
    50210101,...
    50220101:50220104,...
    50410101,...
    50310101:50310109);

N = length(fn);

% initialize array
basinCellArray = cell(N,1);

% initialize table
basinTable = readgeotable(sprintf('SAU_C%d.shp',fn(1)));

% populate cell array with shape files

for i = 2:N
    basinTable = cat(1,basinTable,readgeotable(sprintf('SAU_C%d.shp',fn(i))));
end

basinTable = basinTable(:, 1);
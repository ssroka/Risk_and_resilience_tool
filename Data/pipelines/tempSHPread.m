clear;clc;close all
% pplnes = shapeinfo('OHWVPA_PotentialCO2PipelineRoutes_051022.shp');

T = readgeotable("concord_roads.shp")
mapshow(T)
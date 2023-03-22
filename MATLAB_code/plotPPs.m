ccc
%%
addpath ../Data/biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/WDPA_WDOECM_Mar2023_Public_USA_shp_0
addpath ../Data/biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/WDPA_WDOECM_Mar2023_Public_USA_shp_1
addpath ../Data/biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/WDPA_WDOECM_Mar2023_Public_USA_shp_2
shp_file_str ="../Data/biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/WDPA_WDOECM_Mar2023_Public_USA_shp_1/WDPA_WDOECM_Mar2023_Public_USA_shp-polygons.shp";

s = shaperead(shp_file_str);
crs_info = shapeinfo(shp_file_str);
crs = crs_info.CoordinateReferenceSystem;
try
s_GT = struct2geotable(s,'geographic',["Y" "X"],CoordinateReferenceSystem = crs);
catch
s_GT = struct2geotable(s,CoordinateReferenceSystem = crs);
end
%%
geoplot(s_GT(1:10,:))

ids = s_GT.IUCN_CAT;

% PP_id = find(s_GT.DACSTS);
% 
% geoplot(s_GT(PP_id,:))
%%
% DAC_GT = s_GT;
% save('../Data/DAC Shapefiles (v2022c)/DAC.mat','DAC_GT')
%%
ids = s_GT.IUCN_CAT;

PP_GT_Ia = s_GT(strcmp(ids,'Ia'),:);

tic 
geoplot(PP_GT_Ia.Shape)
hold on
drawnow
% toc
% 
% PP_GT_Ib = s_GT(strcmp(ids,'Ib'),:);
% 
% tic 
geoplot(PP_GT_Ib.Shape)
drawnow
% toc
% 
% PP_GT_II = s_GT(strcmp(ids,'II'),:);
% 
% tic 
geoplot(PP_GT_II.Shape)
drawnow
% toc
% 
% PP_GT_III = s_GT(strcmp(ids,'III'),:);
% 
% tic 
geoplot(PP_GT_III.Shape)
drawnow
% toc

% PP_GT_IV = s_GT(strcmp(ids,'IV'),:);
% 
% tic 
geoplot(PP_GT_IV.Shape)
drawnow
% toc

% PP_GT_V = s_GT(strcmp(ids,'V'),:);
% 
% tic 
% geoplot(PP_GT_V.Shape)
% drawnow
% toc

% PP_GT_VI = s_GT(strcmp(ids,'VI'),:);


geoplot(PP_GT_VI.Shape)
drawnow
toc

%%

tic
geoplot(PP_GT_not_V.Shape)
drawnow
toc

%%
lat = 48;
lon = -125;
d = 100;

% L = cellfun(@(x)x(1,1)<lon,s_CT_V.BoundingBox);
% R = cellfun(@(x)x(2,1)>lon,s_CT_V.BoundingBox);
% B = cellfun(@(x)x(1,2)<lat,s_CT_V.BoundingBox);
% T = cellfun(@(x)x(2,2)>lat,s_CT_V.BoundingBox);


d1 = cellfun(@(x)pdist([x(1,1) x(1,2); lon lat],'euclidean'),s_CT_V.BoundingBox);
d2 = cellfun(@(x)pdist([x(1,1) x(2,2); lon lat],'euclidean'),s_CT_V.BoundingBox);
d3 = cellfun(@(x)pdist([x(2,1) x(1,2); lon lat],'euclidean'),s_CT_V.BoundingBox);
d4 = cellfun(@(x)pdist([x(2,1) x(2,2); lon lat],'euclidean'),s_CT_V.BoundingBox);

d = find((d1<d)|(d2<d)|(d3<d)|(d4<d))

%%


PP_GT_not_V = [PP_GT_Ia;PP_GT_Ib;PP_GT_II;PP_GT_III;PP_GT_IV;PP_GT_VI];
save('../Data/biodiversity/WDPA_WDOECM_Mar2023_Public_USA_shp/IBAT.mat','PP_GT_Ia','PP_GT_Ib',...
     'PP_GT_II',"PP_GT_III","PP_GT_IV","PP_GT_V","PP_GT_VI","PP_GT_not_V");

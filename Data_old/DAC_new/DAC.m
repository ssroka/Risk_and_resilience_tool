m = shaperead('DAC Shapefiles (v2022c)(2)/DAC Shapefiles (v2022c).shp');
info = shapeinfo('DAC Shapefiles (v2022c)(2)/DAC Shapefiles (v2022c).shp');
DOE_DAC = struct2geotable(m,'CoordinateReferenceSystem',info.CoordinateReferenceSystem);
DOE_DAC = DOE_DAC(DOE_DAC.DACSTS==1,:);
y1 = cellfun(@(x)x(1,2),DOE_DAC.BoundingBox);
y2 = cellfun(@(x)x(2,2),DOE_DAC.BoundingBox);
x1 = cellfun(@(x)x(1,1),DOE_DAC.BoundingBox);
x2 = cellfun(@(x)x(2,1),DOE_DAC.BoundingBox);
[lat1, lon1] = projinv(info.CoordinateReferenceSystem,x1,y1);
[lat2, lon2] = projinv(info.CoordinateReferenceSystem,x2,y2);
DOE_DAC.lat1 = lat1;
DOE_DAC.lat2 = lat2;
DOE_DAC.lon1 = lon1;
DOE_DAC.lon2 = lon2;
save('DOE_DAC','DOE_DAC');

clear m_GT DOE_DAC m info

p = shaperead('1.0-shapefile-codebook/usa/usa.shp');
p_GT = struct2geotable(p,'geographic',["Y","X"],'CoordinateReferenceSystem',geocrs(4326));% using WGS 84 from https://epsg.org/search/by-name?sessionkey=wvoik7m2sc&searchedTerms=WGS+84#crs

DAC_ids = p_GT.SN_C>0;
CJEST_DAC_C = p_GT(DAC_ids,:);
CJEST_DAC_C.lat1 = cellfun(@(x)x(1,2),CJEST_DAC_C.BoundingBox);
CJEST_DAC_C.lat2 = cellfun(@(x)x(2,2),CJEST_DAC_C.BoundingBox);
CJEST_DAC_C.lon1 = cellfun(@(x)x(1,1),CJEST_DAC_C.BoundingBox);
CJEST_DAC_C.lon2 = cellfun(@(x)x(2,1),CJEST_DAC_C.BoundingBox);
save('CJEST_DAC_C','CJEST_DAC_C');

clear CJEST_DAC_C 

% DAC_T_ids = logical(cell2mat(cellfun(@(x)str2num(x),p_GT.SN_T,'UniformOutput',false)));
% CJEST_DAC_T = p_GT(DAC_T_ids,:);
% CJEST_DAC_T.lat1 = cellfun(@(x)x(1,2),CJEST_DAC_T.BoundingBox);
% CJEST_DAC_T.lat2 = cellfun(@(x)x(2,2),CJEST_DAC_T.BoundingBox);
% CJEST_DAC_T.lon1 = cellfun(@(x)x(1,1),CJEST_DAC_T.BoundingBox);
% CJEST_DAC_T.lon2 = cellfun(@(x)x(2,1),CJEST_DAC_T.BoundingBox);
% save('CJEST_DAC_T','CJEST_DAC_T');

TL = shaperead('tribal_lands_complete.shp');
TL_GT = struct2geotable(TL,'geographic',["Y","X"],'CoordinateReferenceSystem',geocrs(4326));% using WGS 84 from https://epsg.org/search/by-name?sessionkey=wvoik7m2sc&searchedTerms=WGS+84#crs
CJEST_DAC_T = TL_GT;
CJEST_DAC_T.lat1 = cellfun(@(x)x(1,2),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T.lat2 = cellfun(@(x)x(2,2),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T.lon1 = cellfun(@(x)x(1,1),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T.lon2 = cellfun(@(x)x(2,1),CJEST_DAC_T.BoundingBox);
save('CJEST_DAC_T','CJEST_DAC_T');









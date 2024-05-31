
ccc


% roads_0_3148 = shaperead('network_links_0.0_3148.06.shp');
% roads_0_3148_crs = shapeinfo("network_links_0.0_3148.06.shp");
% crs = roads_0_3148_crs.CoordinateReferenceSystem;
% roads_0_3148_GT = struct2geotable(roads_0_3148, CoordinateReferenceSystem=crs);
% tic
% geoplot(roads_0_3148_GT)
% toc
% 
% n = size(roads_0_3148_GT,1);
% 
% roads_0_3148_GT.low_bnd = 0*ones(n,1);
% roads_0_3148_GT.up_bnd = 3148*ones(n,1);
% 
% roads_GT = roads_0_3148_GT(:,["Shape","low_bnd","up_bnd"]);

%%

roads_3148_11281 = shaperead('network_links_3148.06_11281.65.shp');
roads_3148_11281_crs = shapeinfo("network_links_3148.06_11281.65.shp");
crs = roads_3148_11281_crs.CoordinateReferenceSystem;
roads_3148_11281_GT = struct2geotable(roads_3148_11281, CoordinateReferenceSystem=crs);
tic
geoplot(roads_3148_11281_GT,'r','linewidth',3)
toc

n = size(roads_3148_11281_GT,1);

roads_3148_11281_GT.low_bnd = 3148*ones(n,1);
roads_3148_11281_GT.up_bnd = 11281*ones(n,1);

roads_GT = roads_3148_11281_GT(:,["Shape","low_bnd","up_bnd"]);

%%

roads_11281_23453 = shaperead('network_links_11281.65_23453.2.shp');
roads_11281_23453_crs = shapeinfo("network_links_11281.65_23453.2.shp");
crs = roads_11281_23453_crs.CoordinateReferenceSystem;
roads_11281_23453_GT = struct2geotable(roads_11281_23453, CoordinateReferenceSystem=crs);
tic
geoplot(roads_11281_23453_GT,'b','linewidth',3)
drawnow
toc

n = size(roads_11281_23453_GT,1);

roads_11281_23453_GT.low_bnd = 11281*ones(n,1);
roads_11281_23453_GT.up_bnd = 23453*ones(n,1);

roads_GT = vertcat(roads_GT, roads_11281_23453_GT(:,["Shape","low_bnd","up_bnd"]));

%%

roads_23453_56088 = shaperead('network_links_23453.2_56088.53.shp');
roads_23453_56088_crs = shapeinfo("network_links_23453.2_56088.53.shp");
crs = roads_23453_56088_crs.CoordinateReferenceSystem;
roads_23453_56088_GT = struct2geotable(roads_23453_56088, CoordinateReferenceSystem=crs);
tic
geoplot(roads_23453_56088_GT,'k','linewidth',3)
drawnow
toc

n = size(roads_23453_56088_GT,1);

roads_23453_56088_GT.low_bnd = 23453*ones(n,1);
roads_23453_56088_GT.up_bnd = 56088*ones(n,1);

roads_GT = vertcat(roads_GT, roads_23453_56088_GT(:,["Shape","low_bnd","up_bnd"]));

%%

roads_56088_121197 = shaperead('network_links_56088.53_121197.38.shp');
roads_56088_121197_crs = shapeinfo("network_links_56088.53_121197.38.shp");
crs = roads_56088_121197_crs.CoordinateReferenceSystem;
roads_56088_121197_GT = struct2geotable(roads_56088_121197, CoordinateReferenceSystem=crs);
tic
geoplot(roads_56088_121197_GT,'g','linewidth',3)
drawnow
toc

n = size(roads_56088_121197_GT,1);

roads_56088_121197_GT.low_bnd = 56088*ones(n,1);
roads_56088_121197_GT.up_bnd = 121197*ones(n,1);

roads_GT = vertcat(roads_GT, roads_56088_121197_GT(:,["Shape","low_bnd","up_bnd"]));







roads_s = shaperead('tl_2021_us_primaryroads.shp');
roads_info = shapeinfo('tl_2021_us_primaryroads.shp');

roads_t = struct2geotable(roads_s, 'geographic', ["Y", "X"], CoordinateReferenceSystem=roads_info.CoordinateReferenceSystem);
roads_GT_I = roads_t(strcmp(roads_t.RTTYP, 'I'), :);

save('roads_GT_I.mat', 'roads_GT_I')

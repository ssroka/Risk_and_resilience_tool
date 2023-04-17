faf5_s = shaperead('network_links_56088.53_121197.38.shp');
x = [faf5_s.X];
y = [faf5_s.Y];
faf5_info = shapeinfo("network_links_56088.53_121197.38.shp");
faf5_crs = faf5_info.CoordinateReferenceSystem;
[lat,lon] = projinv(faf5_crs,x,y);

allroads = length(faf5_s(:,1));
xprevious = 0;
yprevious = 0;
for roadindx = 1:allroads

    if roadindx == 1
        xindx = length(faf5_s(roadindx).X);
        lonvalues = lon(1:xindx);
        [faf5_s(roadindx).X] = lonvalues;

        yindx = length(faf5_s(roadindx).Y);
        latvalues = lat(1:yindx);
        [faf5_s(roadindx).Y] = latvalues;
    else
        xprevious = length(faf5_s(roadindx - 1).X) + xprevious;
        xindx = xprevious + length(faf5_s(roadindx).X);
        lonvalues = lon((xprevious+1):xindx);
        [faf5_s(roadindx).X] = lonvalues;

        yprevious = length(faf5_s(roadindx - 1).Y) + yprevious;
        yindx = yprevious + length(faf5_s(roadindx).Y);
        latvalues = lat((yprevious+1):yindx);
        [faf5_s(roadindx).Y] = latvalues;

    end
        

end

faf5_GT = struct2geotable(faf5_s, "geographic", ["Y" "X"], CoordinateReferenceSystem = faf5_crs.GeographicCRS);
faf5_GT = faf5_GT(:, {'Shape', 'Geometry', 'Refactored'});
save('faf5_GT_5.mat', 'faf5_GT')
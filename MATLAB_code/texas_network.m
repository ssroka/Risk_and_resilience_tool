texas_s = shaperead('texas_networks_with_linewidths.shp'); %...,'UseGeoCoords',true)
x = [texas_s.X];
y = [texas_s.Y];
texas_info = shapeinfo("texas_networks_with_linewidths.shp");
texas_crs = texas_info.CoordinateReferenceSystem;
[lat,lon] = projinv(texas_crs,x,y);

allroads = length(texas_s(:,1));
xprevious = 0;
yprevious = 0;
for roadindx = 1:10

    if roadindx == 1
        xindx = length(texas_s(roadindx).X);
        lonvalues = lon(1:xindx);
        [texas_s(roadindx).X] = lonvalues;

        yindx = length(texas_s(roadindx).Y);
        latvalues = lat(1:yindx);
        [texas_s(roadindx).Y] = latvalues;
    else
        xprevious = length(texas_s(roadindx - 1).X) + xprevious;
        xindx = xprevious + length(texas_s(roadindx).X);
        lonvalues = lon(xprevious:xindx);
        [texas_s(roadindx).X] = lonvalues;

        yprevious = length(texas_s(roadindx - 1).Y) + yprevious;
        yindx = yprevious + length(texas_s(roadindx).Y);
        latvalues = lat(yprevious:yindx);
        [texas_s(roadindx).Y] = latvalues;

    end
        

end

texas_GT = struct2geotable(texas_s, "geographic", ["Y" "X"], CoordinateReferenceSystem = texas_crs.GeographicCRS);
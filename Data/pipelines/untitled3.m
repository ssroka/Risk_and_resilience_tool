gx = geoaxes
pplns_GT = readgeotable("OHWVPA_PotentialCO2PipelineRoutes_051022.shp")
T_4 = geotable2table(pplns_GT,["Latitude","Longitude"])
                        for jj = 1:size(T_4)
                            T2 = T_4(jj, :)
                            [x, y] = polyjoin(T2.Latitude', T2.Longitude')
                            shape = pplns_GT.Shape;
                            line = shape(jj, :);
                            h2 = geoplot(gx, line);
                        end
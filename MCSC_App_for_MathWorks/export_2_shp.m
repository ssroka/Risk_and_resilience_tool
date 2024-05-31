ccc

d = dir;

cell_list = {d.name};

for i = 1:length(cell_list)
    fn  = cell_list{i};
    if length(fn)>4 && strcmp(fn(end-3:end),'.mat')
        vn  = fn(1:end-4);
        try 
        eval(sprintf('load(''%s'',''%s'');',fn,vn))
        eval(sprintf('%s_GT = table2geotable(%s);',vn,vn))
        eval(sprintf('shapewrite(%s_GT,''%s.shp'');',vn,vn))
        eval(sprintf('zip(''%s_shp.zip'',{''%s.dbf'',''%s.shx'',''%s.shp''})',vn,vn,vn,vn))
        catch
            % just keep going since the var name is probably different than
            % the mat file
            fprintf('%s didn''t work\n',vn)
        end
    end
end











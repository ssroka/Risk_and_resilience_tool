function resetMapSize(app, event)
if isempty(app.ax)
    if ~isempty(app.Panel.Children)
        for i = 1:length(app.Panel.Children)
            if isa(app.Panel.Children(i),'matlab.graphics.axis.GeographicAxes')
                app.ax = app.Panel.Children(i);
            end
        end
    end
else
    app.ax.Units = 'normalized';
    app.ax.Position = [0.1 0.1 0.8 0.8];
end

end

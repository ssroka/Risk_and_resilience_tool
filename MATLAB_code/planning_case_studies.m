% case studies

data_layers = {
    'Point Sources',
    'CCUS',
    'Natural Hazards',
    'Grid Carbon Intensity',
    'NDVI',
    'Social Vulnerability',
    'Population',
    'Transportation Routes',
    };

c = nchoosek(data_layers,3);

for i = 1:size(c,1)
    fprintf('%s \t %s \t %s\n\n',c{i,1},c{i,2},c{i,3})
    stop_or_go = input('type ''stop'' or hit ''enter''\n','s');
    if strcmp(stop_or_go,'stop')
        break
    end
end


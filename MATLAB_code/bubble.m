% file will make table of population centers

%alabama
readtable('alabama.txt')
opts = detectImportOptions('alabama.txt'); 
opts.DataLines = [11];
opts.VariableNames = {'STATEFP','COUNTYFP',...
                      'COUNAME','STNAME','POPULATION', 'LATITUDE', 'LONGITUDE'};
T = readtable('alabama.txt',opts) 

%
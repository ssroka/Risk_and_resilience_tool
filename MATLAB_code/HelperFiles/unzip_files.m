d = dir;
n = length(d);

for i = 1:n
    if length(d(i).name)>4 && strcmp(d(i).name(end-3:end),'.zip')
        unzip(d(i).name,d(i).name(1:end-4))
    end
end




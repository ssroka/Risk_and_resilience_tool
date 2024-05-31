ccc
f = figure;
gx = geoaxes(f);

load('CJEST_DAC_C.mat')
CJEST_DAC_T = CJEST_DAC_C;

CJEST_DAC_T_BB = CJEST_DAC_T;
CJEST_DAC_T_BB.BB1 = cellfun(@(x)x(1,2),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T_BB.BB2 = cellfun(@(x)x(2,2),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T_BB.BB3 = cellfun(@(x)x(1,1),CJEST_DAC_T.BoundingBox);
CJEST_DAC_T_BB.BB4 = cellfun(@(x)x(2,1),CJEST_DAC_T.BoundingBox);

f.WindowButtonMotionFcn = @(~,~) hover(CJEST_DAC_T_BB,gx);

geoplot(CJEST_DAC_T)

function hover(CJEST_DAC_T_BB,gx)

x = gx.CurrentPoint(1,1);
y = gx.CurrentPoint(1,2);

mouse = geopointshape(x,y);

regions_ind = (CJEST_DAC_T_BB.BB1<x) & (CJEST_DAC_T_BB.BB2>x) &...
    (CJEST_DAC_T_BB.BB3<y) & (CJEST_DAC_T_BB.BB4>y);
regions = find(regions_ind);
n = length(regions);
if n==1
    title(CJEST_DAC_T_BB(regions,:).DF_PFS)
else

    for i = 1:n
        inside = isinterior(CJEST_DAC_T_BB(regions(i),:).Shape,mouse);
        if inside
            title(CJEST_DAC_T_BB(regions(i),:).DF_PFS)
            break
        end
    end
end
end

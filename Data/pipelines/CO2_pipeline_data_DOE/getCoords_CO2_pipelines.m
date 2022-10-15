ccc

pb_xy=[
    37.77907, -110.00143
    29.69724, -109.05661
    38.16015, -99.16891
    30.66591, -99.34469];

pb_img = 'PermianBasin.png';

xmin = min(pb_xy(:,2));
xmax = max(pb_xy(:,2));
ymin = min(pb_xy(:,1));
ymax = max(pb_xy(:,1));

A = imread(pb_img);

xl = size(A,2);
yl = size(A,1);

x = linspace(xmin,xmax,xl);
y = fliplr(linspace(ymin,ymax,yl));

image(x,y,A)

set(gca,'Visible','on','ydir','normal','position',[-1542         -76        1302        1175])

redpm = [...
     -102.9480   32.5145
 -101.1111  32.4085
 -102.5904   30.7572
 -103.1514   32.6651
 -104.2171   33.1282
 -107.9611   36.1518
 -108.1434   37.4684
 -108.9497   37.5409
 -108.8656   37.9649];

bluepm = [...
     -102.9130   32.1351
 -103.3757   33.5521
 -103.5370   34.2216
 -104.2451   36.5591
 -104.2381   37.1392
 -104.7640   37.6358
 -105.2057   37.6358];

redGreenpm = [ -103.0672   32.7376
 -102.9060   33.0445
 -102.8849   33.4461
 -103.3757   34.1100
 -103.4949   35.6832
 -101.7631   36.5925];

%%

pb_xy=[
    37.77907, -110.00143
    29.69724, -109.05661
    38.16015, -99.16891
    30.66591, -99.34469];

pb_img = 'PermianBasin.png';

xmin = min(pb_xy(:,2));
xmax = max(pb_xy(:,2));
ymin = min(pb_xy(:,1));
ymax = max(pb_xy(:,1));

A = imread(pb_img);

xl = size(A,2);
yl = size(A,1);

x = linspace(xmin,xmax,xl);
y = fliplr(linspace(ymin,ymax,yl));

image(x,y,A)

set(gca,'Visible','on','ydir','normal','position',[-1542         -76        1302        1175])




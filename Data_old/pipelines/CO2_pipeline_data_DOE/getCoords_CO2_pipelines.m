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

set(gca,'Visible','on','ydir','normal')
set(gcf,'position',[-1542         -76        1302        1175])

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
    28.174051, -97.519841
   34.224324, -97.444693
   34.155569, -86.325090];

pb_img = 'GulfCoast.png';

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

p1 = [
  -88.3043   32.2043
  -89.0785   32.3070
  -89.3158   32.7276
  -89.7403   31.8815
  -90.0275   31.0158
  -90.3460   30.3653
  -90.5582   30.4924
  -90.7143   30.7468
  -91.9381   30.5707
  -92.9433   30.2479
  -93.8299   29.7343
  -94.5479   29.3381
  -94.7851   29.4017];

p2 = [
      -89.3158   32.7081
  -90.0088   32.9380
  -90.5208   32.6249
  -91.1764   32.5467];

%%
ccc
pb_xy=[
    45.317953, -103.596710
    45.347572, -111.545900
    40.014948, -111.293099];

pb_img = 'rockymountain.png';

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

rm1 = [ -105.1451   44.9714
 -105.6817   44.3774
 -106.1664   43.9520
 -106.2276   43.6286
 -106.5100   43.3579
 -106.9524   43.0556
 -107.0607   42.7674
 -107.9078   42.3913
 -108.7738   42.0854
 -109.8986   41.8148
 -109.4515   41.6566
 -109.3433   41.4527
 -109.3904   41.1890
 -109.2680   40.5598
 -108.8444   40.3594];

%%
ccc
pb_xy=[
    37.211504, -103.352246
    37.090003, -93.875631
    33.546214, -94.155102];

pb_img = 'MidContinent.png';

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

m1 = [ -101.3931   37.1273
 -100.3981   36.3620];
m2=[
 -100.8342   36.0215
  -95.5462   36.9076];
m3=[
  -96.7008   36.4389
  -97.4010   34.4689];
m4 = [
  -97.7387   36.2705
 -101.0798   36.3474];
m5=[
 -101.6510   35.7139
 -101.7493   36.7355
 -103.3092   36.1313];
%%
ccc
pb_xy=[
    37.029179, -109.017889
    46.801683, -111.249455
    47.060685, -101.720014];

pb_img = 'DenburyRot.png'; % add some rotation

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

PLANNED1 = [
 -106.8834   40.2301
 -107.4276   40.0586
 -107.7566   39.5871];
PLANNED2 = [
 -107.5921   39.2727
 -109.4271   38.4010
 -109.6675   38.4582
 -110.1484   38.8154
 -104.4282   45.9604
 -104.3650   45.3173
 -104.9345   43.5311];

%%
ccc
pb_xy=[
    29.601877, -94.949044
    29.386883, -94.946380
    29.596582, -95.341055];

pb_img = 'Webster.png'; % add some rotation

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])


PLANNED3 = [  -94.9501   29.4485
  -95.1168   29.4124
  -95.1193   29.4644
  -95.2671   29.4569
  -95.2783   29.4945];

%%
ccc
pb_xy=[
    29.594447, -95.582498
   30.092424, -95.585067
    29.650272, -94.294275];

pb_img = 'Conroe.png'; % add some rotation

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

PLANNED4 = [-94.3081   29.8461
  -94.8267   29.5980];


%%
ccc
pb_xy=[
    31.861864, -102.929415
   36.265688, -102.876230
  36.408496, -109.737059];

pb_img = 'Lobos.png'; % add some rotation

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

PLANNED5 = [ -103.9415   33.4965
 -104.3047   33.8362
 -105.8557   35.0109
 -106.4393   34.5120
 -107.1658   34.6818
 -107.5290   34.7031
 -108.0433   34.4943];
PPLANNED6 = [
 -109.0106   34.3563
 -109.1248   34.4200];



%%
ccc
pb_xy=[
   48.254698, -83.651001
  48.717499, -107.333525
  39.838285, -104.664515];

pb_img = 'SummitCarbonSolutions.png'; % add some rotation

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

set(gca,'ydir','normal')

set(gcf,'position',[-1542         -76        1302        1175])

PLANNED7 = [  -100.0580   40.8337
  -99.2626   41.0789
  -98.3505   42.1104
  -97.1414   42.4638
  -97.0036   43.2284
  -97.9793   43.6900
  -98.6369   44.6277
  -99.7505   45.7457
 -101.4686   47.4192];

PLANNED8 = [  -98.0748   47.2172
  -97.8414   46.1785
  -99.7929   45.7746];


PLANNED9 = [  -95.3703   45.4139
  -96.2824   44.8080
  -95.8900   43.8920
  -95.6991   43.0697
  -97.1733   43.2933];

PLANNED10 = [  -92.6977   43.1707
  -95.7945   43.0914
  -97.0036   43.2284];

PLANNED11 = [  -94.0022   41.9950
  -93.3764   42.5215];

PLANNED12 = [  -94.5324   43.1130
  -94.8612   42.0383
  -96.5900   43.0914
  -96.2188   40.8914];













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
PLANNED3 = [  -94.9501   29.4485
  -95.1168   29.4124
  -95.1193   29.4644
  -95.2671   29.4569
  -95.2783   29.4945];
PLANNED4 = [-94.3081   29.8461
  -94.8267   29.5980];
PLANNED5 = [ -103.9415   33.4965
 -104.3047   33.8362
 -105.8557   35.0109
 -106.4393   34.5120
 -107.1658   34.6818
 -107.5290   34.7031
 -108.0433   34.4943];
PLANNED6 = [
 -109.0106   34.3563
 -109.1248   34.4200];
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

%% DenburyRot

denburyRot1 = geolineshape(PLANNED1(:, 2), PLANNED1(:, 1));
denburyRot2 = geolineshape(PLANNED2(:,2), PLANNED2(:,1));

%% Webster
lon = [PLANNED3(:, 1)];
lat = [PLANNED3(:, 2)];
webster = geolineshape(lat, lon);

%% Conroe
lon = [PLANNED4(:, 1)];
lat = [PLANNED4(:, 2)];
conroe = geolineshape(lat, lon);

%% Lobos

lobos5 = geolineshape(PLANNED5(:, 2), PLANNED5(:, 1));
lobos6 = geolineshape(PLANNED6(:,2), PLANNED6(:,1));

%% SCM

scm7 = geolineshape(PLANNED7(:, 2), PLANNED7(:, 1));
scm8 = geolineshape(PLANNED8(:, 2), PLANNED8(:, 1));
scm9 = geolineshape(PLANNED9(:, 2), PLANNED9(:, 1));
scm10 = geolineshape(PLANNED10(:, 2), PLANNED10(:, 1));
scm11 = geolineshape(PLANNED11(:, 2), PLANNED11(:, 1));
scm12 = geolineshape(PLANNED12(:, 2), PLANNED12(:, 1));

planned = array2table([denburyRot1; denburyRot2; webster; conroe; lobos5; lobos6; scm7; scm8; scm9; scm10; scm11; scm12], 'VariableNames', {'Shape'});
shapewrite(planned, 'planned_pipelines.shp')
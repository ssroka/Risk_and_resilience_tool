function [NDVI_GT] = getNDVIData()


% replace state shapes with more compact shape files from the census
state_struct = shaperead('cb_2018_us_state_20m.shp','Attributes',{'STUSPS'});
crs_info2 = shapeinfo("cb_2018_us_state_20m.shp");
crs2 = crs_info2.CoordinateReferenceSystem;
% this CRS is geographic so we need to ID the coords b/c they
% won't be recognized as geographic otherwise
state_GT = struct2geotable(state_struct,'geographic',["Y" "X"],CoordinateReferenceSystem = crs2);

StateAbbv = readtable('USA_STATE_ABBV.csv','ReadVariableNames', false);
StateAbbv.Properties.VariableNames = {'NAME', 'ABBV'};
StateAbbv.NAME = lower(StateAbbv.NAME);


NDVI_T = readtable('NDVI_threaded_2.csv');
STUSPS = cell(size(NDVI_T,1),1);
NDVI_T = [NDVI_T STUSPS];
NDVI_T = renamevars(NDVI_T,['Var7'],['STUSPS']);
% edit the key to resemble the StateAbbv table
for i = 1:size(NDVI_T,1)
    % remove the first 4 characters 'usa-'
    NDVI_T.key{i} = NDVI_T.key{i}(5:end);
    % swap remaining hyphens for spaces
    NDVI_T.key{i} = strrep(NDVI_T.key{i},'-',' ');
    row_id = find(strcmp(StateAbbv.NAME ,NDVI_T.key{i}));
    NDVI_T.STUSPS{i} = StateAbbv.ABBV{row_id};
end


NDVI_GT= state_GT(:,{'Shape','STUSPS'});
NDVI_GT = [NDVI_GT cell(size(NDVI_GT,1),1)];
NDVI_GT = renamevars(NDVI_GT,['Var3'],['NDVI']);


for i = 1:size(NDVI_GT,1)
    row_id = find(strcmp(NDVI_GT.STUSPS{i},NDVI_T.STUSPS));
    NDVI_GT.NDVI{i} = NDVI_T.NDVI(row_id);
end




end
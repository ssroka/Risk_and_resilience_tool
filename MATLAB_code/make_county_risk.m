
clear;close all;clc

cd('..')
add_rm_custom_paths('add');
cd('MATLAB_code')
% produces a table with OID_, NRI_ID, STATE, STATEFIPS, COUNTY, COUNTYTYPE,
% COUNTYFIPS..., AREA, RISK_SCORE, RISK_RATNG
sovi_resl = readtable("NRI_Table_Counties.csv");
% unique deletes repeated values and sorts the table
all_ratings = unique(sovi_resl.RISK_RATNG);

ratings_strings = {'Very Low','Relatively Low','Relatively Moderate','Relatively High','Very High','Empty'};


fields = {'RISK_SCORE', 'RISK_RATNG';...
    'SOVI_SCORE','SOVI_RATNG';...
    'RESL_SCORE','RESL_RATNG';...
    'DRGT_RISKS','DRGT_RISKR';...
    'HRCN_RISKS','HRCN_RISKR';...
    'RFLD_RISKS','RFLD_RISKR';...
    'SWND_RISKS','SWND_RISKR';...
    'WFIR_RISKS','WFIR_RISKR';...
    'ERQK_RISKS','ERQK_RISKR'};
% creates logical array of 0s with same number of rows as the county
% file (same number of counties) and 5 columns
IDs_risk = false(size(sovi_resl,1),6);

% The below will NOT match unique(sovi_resl.STATEABBRV) since the one in
% this comment is out of alphabetical order and includes D.C. as a state
nri_full = struct2table(shaperead("NRI_Shapefile_Counties.shp",'Attributes', {'COUNTYFIPS'}));
countyfips = nri_full(:,['COUNTYFIPS']);
% NRI_STATE_A_WEIGHTED = table(state_abbrv{:,1},'VariableNames',{'STATEABBRV'});

for k = 1:size(fields,1)
    %compares the county values for each of the field categories (like
    %RISK_RATNG) with the string 'Very Low', and replaces one of the
    %logical 0 columns with which logical 1s if the county has that risk
    %level rating
    IDs_risk(:,1) = strcmp(sovi_resl{:,[fields{k,2}]},'Very Low');
    IDs_risk(:,2) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively Low');
    IDs_risk(:,3) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively Moderate');
    IDs_risk(:,4) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively High');
    IDs_risk(:,5) = strcmp(sovi_resl{:,[fields{k,2}]},'Very High');

    r = zeros(5,2);
    for i = 1:5
        nri_risk  = sovi_resl{:,[fields{k,1}]}; %takes the values from column 1 of the fields array
        % that corresponds to the current row of column 2 we are analyzing
        % (RISK_SCORE for RISK_RATNG) for each county and makes table
        %pulls the true values for each risk column with the same string
        %('Very Low') and finds the corresponding value from the first
        %field column. Then finds the max and min values of this nri_risk
        %column and assigns the values to the first (and other rows until all strings are filled like very low, very high etc.) row of the 0 matrix r
        r(i,:) = [max(nri_risk(IDs_risk(:,i))) min(nri_risk(IDs_risk(:,i)))];
    end
% makes new table with rows the size of all the counties and the only
% variable name is the field we are on (first is 'RISK_RATNG')
    county_AREARISK = table('Size',[size(countyfips,1),1],'VariableTypes',{'string'},'VariableNames',{fields{k,2}});

    for j = 1:size(countyfips,1)
% finds locations where the state abbreviation matches the sovi_resl  state
% then for the counties where they are the same, it gets the RISK_SCORE
% value ans assigns that to S. Then, finds the area where the counties are
% the same and assigns to A. reates a weight score for the counties
        IDs_st = strcmp(string(sovi_resl.COUNTYFIPS),string(countyfips{j,1}));
        S = sovi_resl{IDs_st,[fields{k,1}]};
        A = sovi_resl.AREA(IDs_st);
        area_weight_score = sum(S.*A)/sum(A);
% if the score is less than the maximum value of each rating string (very
% low), assign the county in the empty table the value of the rating string
        if area_weight_score < r(1,1)
            county_AREARISK{j,1} = ratings_strings(1);
        elseif area_weight_score < r(2,1)
            county_AREARISK{j,1} = ratings_strings(2);
        elseif area_weight_score < r(3,1)
            county_AREARISK{j,1} = ratings_strings(3);
        elseif area_weight_score < r(4,1)
            county_AREARISK{j,1} = ratings_strings(4);
        elseif area_weight_score > r(4,1)
            county_AREARISK{j,1} = ratings_strings(5);
        else
            county_AREARISK{j,1} = ratings_strings(6);% does not distinguish between 'No Rating', 'Not Applicable', and 'Insufficient Data'
        end

    end
% if still on the first field row, make the once enpty table (now filled
% with the rating values) a new table. If we moved on to the second one,
% add the table to the existing table.
    if k == 1
        NRI_COUNTY_A_WEIGHTED = county_AREARISK;
    else
        NRI_COUNTY_A_WEIGHTED = [NRI_COUNTY_A_WEIGHTED county_AREARISK];
    end
end

writetable(NRI_COUNTY_A_WEIGHTED,'../Data/environmental_social_risks/NRI_COUNTY_A_WEIGHTED.csv')

% cd('..')
% add_rm_custom_paths('remove');
% cd('MATLAB_code')

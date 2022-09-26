
clear;close all;clc

cd('..')
add_rm_custom_paths('add');
cd('MATLAB_code')

sovi_resl = readtable("NRI_Table_Counties.csv");

all_ratings = unique(sovi_resl.RISK_RATNG);

ratings_strings = {'Very Low','Relatively Low','Relatively Moderate','Relatively High','Very High','Empty'};


fields = {'RISK_SCORE', 'RISK_RATNG';...
    'SOVI_SCORE','SOVI_RATNG';...
    'RESL_SCORE','RESL_RATNG';...
    'DRGT_RISKS','DRGT_RISKR';...
    'HRCN_RISKS','HRCN_RISKR';...
    'RFLD_RISKS','RFLD_RISKR';...
    'SWND_RISKS','SWND_RISKR';...
    'WFIR_RISKS','WFIR_RISKR'};

IDs_risk = false(size(sovi_resl,1),5);

% The below will NOT match unique(sovi_resl.STATEABBRV) since the one in
% this comment is out of alphabetical order and includes D.C. as a state
nri_full = struct2table(shaperead("NRI_Shapefile_States.shp",'Attributes', {'STATEABBRV'}));
state_abbrv = nri_full(:,['STATEABBRV']);
% NRI_STATE_A_WEIGHTED = table(state_abbrv{:,1},'VariableNames',{'STATEABBRV'});

for k = 1:size(fields,1)

    IDs_risk(:,1) = strcmp(sovi_resl{:,[fields{k,2}]},'Very Low');
    IDs_risk(:,2) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively Low');
    IDs_risk(:,3) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively Moderate');
    IDs_risk(:,4) = strcmp(sovi_resl{:,[fields{k,2}]},'Relatively High');
    IDs_risk(:,5) = strcmp(sovi_resl{:,[fields{k,2}]},'Very High');

    r = zeros(5,2);
    for i = 1:5
        nri_risk  = sovi_resl{:,[fields{k,1}]};
        r(i,:) = [max(nri_risk(IDs_risk(:,i))) min(nri_risk(IDs_risk(:,i)))];
    end

    state_AREARISK = table('Size',[size(state_abbrv,1),1],'VariableTypes',{'string'},'VariableNames',{fields{k,2}});

    for j = 1:size(state_abbrv,1)

        IDs_st = strcmp(sovi_resl.STATEABBRV,state_abbrv{j,1});
        S = sovi_resl{IDs_st,[fields{k,1}]};
        A = sovi_resl.AREA(IDs_st);
        area_weight_score = sum(S.*A)/sum(A);

        if area_weight_score < r(1,1)
            state_AREARISK{j,1} = ratings_strings(1);
        elseif area_weight_score < r(2,1)
            state_AREARISK{j,1} = ratings_strings(2);
        elseif area_weight_score < r(3,1)
            state_AREARISK{j,1} = ratings_strings(3);
        elseif area_weight_score < r(4,1)
            state_AREARISK{j,1} = ratings_strings(4);
        elseif area_weight_score > r(4,1)
            state_AREARISK{j,1} = ratings_strings(5);
        else
            state_AREARISK{j,1} = ratings_strings(6);% does not distinguish between 'No Rating', 'Not Applicable', and 'Insufficient Data'
        end

    end

    if k == 1
        NRI_STATE_A_WEIGHTED = state_AREARISK;
    else
        NRI_STATE_A_WEIGHTED = [NRI_STATE_A_WEIGHTED state_AREARISK];
    end
end

writetable(NRI_STATE_A_WEIGHTED,'../Data/environmental_social_risks/NRI_STATE_A_WEIGHTED.csv')

% cd('..')
% add_rm_custom_paths('remove');
% cd('MATLAB_code')

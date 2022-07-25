function add_rm_custom_paths(add_rm_string)

custom_paths = {
    ['.' filesep 'Data' filesep 'CCS infrastructure' filesep ],
    ['.' filesep 'Data' filesep 'CO2 storage' filesep ],
    ['.' filesep 'Data' filesep 'Environmental-social risks' filesep ],
    ['.' filesep 'Data' filesep 'Grid greeness' filesep ],
    ['.' filesep 'Data' filesep 'Member facilities' filesep ],
    ['.' filesep 'Data' filesep 'eGRID subregions' filesep ],
    ['.' filesep 'Data' filesep 'emissions' filesep ],
    ['.' filesep 'Data' filesep 'pipelines' filesep ] 
    };

switch add_rm_string

    case 'add'
        for i = 1:length(custom_paths)
            addpath(custom_paths{i});
        end

    case 'remove'

        for i = 1:length(custom_paths)
            rmpath(custom_paths{i});
        end

end

end
function add_rm_custom_paths(add_rm_string)

custom_paths = {
    "../Data/CCS Infrastructure",
    "../Data/CO2 Storage/"
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
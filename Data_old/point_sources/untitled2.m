% Create DropDown and label
            lbl_1 = uilabel(gl)
            lbl_1.Text = 'Power Plant Name:';
            lbl_1.Layout.Row = 1
            lbl_1.Layout.Column = [1 2]
            dd_1 = uidropdown(gl, 'Placeholder', 'Search...', 'Editable', 'on', 'Value', '');
            dd_1.Layout.Row = 1;
            dd_1.Layout.Column = [3 5];
            dd_1.Items = cellstr(pwrplnt.('FACILITYNAME'));

            lbl_2 = uilabel(gl)
            lbl_2.Text = 'Cement Plant Name:';
            lbl_2.Layout.Row = 2
            lbl_2.Layout.Column = [1 2]
            dd_2 = uidropdown(gl, 'Placeholder', 'Search...', 'Editable', 'on', 'Value', '');
            dd_2.Layout.Row = 2;
            dd_2.Layout.Column = [3 5];
            dd_2.Items = cellstr(cmntplnt.('FACILITYNAME'));

            lbl_3 = uilabel(gl)
            lbl_3.Text = 'Ethanol Plant Name:';
            lbl_3.Layout.Row = 3
            lbl_3.Layout.Column = [1 2]
            dd_3 = uidropdown(gl, 'Placeholder', 'Search...', 'Editable', 'on', 'Value', '');
            dd_3.Layout.Row = 3;
            dd_3.Layout.Column = [3 5];
            dd_3.Items = cellstr(ethnlplnt.('FACILITYNAME'));
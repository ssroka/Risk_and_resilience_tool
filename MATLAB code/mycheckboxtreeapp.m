    fig = uifigure;
    cbt = uitree(fig,'Position',[20 20 150 150], 'Multiselect', 'on');

    % callbacks
    cbt.SelectionChangedFcn = @graph;

    % First level nodes
    category1 = uitreenode(cbt,'Text','Vegetables','NodeData',[]);
  
    % Second level nodes.
    p1 = uitreenode(category1,'Text','Cucumber','NodeData', 1:10);
    p2 = uitreenode(category1,'Text','Carrot','NodeData',11:2:21);

function graph(src, event)
    cn = event.SelectedNodes;
        if ~isempty(cn)
            disp(cn)
            x = cn.NodeData
            plot(x, x)
        end
end



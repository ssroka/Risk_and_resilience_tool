function mycheckboxtreeapp

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
    sn = event.SelectedNodes;
        if ~isempty(sn)
            x = sn.NodeData;
            h = plot(x, x);
            psn = event.PreviousSelectedNodes;
                if isempty(psn)
                delete(h)
            end
   
        end
end

end

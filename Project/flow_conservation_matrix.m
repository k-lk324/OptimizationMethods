function flow_cons_mat = flow_conservation_matrix()

    num_nodes = 9;
    n_roads = 17;

    % Define the roads from each node
    roads_from = containers.Map('KeyType', 'int32', 'ValueType', 'any');
    roads_from(1) = [1, 2, 3, 4];  % Roads from node 1
    roads_from(2) = [5, 6];      % Roads from node 2
    roads_from(3) = [7, 8];      % Roads from node 3
    roads_from(4) = [9, 10];     % Roads from node 4
    roads_from(5) = [11, 12, 13]; % Roads from node 5
    roads_from(6) = [14, 15];    % Roads from node 6
    roads_from(7) = [16];        % Roads from node 7
    roads_from(8) = [17];        % Roads from node 8
    roads_from(9) = [];          % Roads from node 9

    % Define the roads to each node
    roads_to = containers.Map('KeyType', 'int32', 'ValueType', 'any');
    roads_to(1) = [];              % Roads to node 1
    roads_to(2) = [1];             % Roads to node 2
    roads_to(3) = [2];             % Roads to node 3
    roads_to(4) = [4];             % Roads to node 4
    roads_to(5) = [3, 8, 9];       % Roads to node 5
    roads_to(6) = [6, 7, 13];      % Roads to node 6
    roads_to(7) = [5, 14];         % Roads to node 7
    roads_to(8) = [10, 11];        % Roads to node 8
    roads_to(9) = [12, 15, 16, 17]; % Roads to node 9

    % Create the flow conservation matrix
    flow_cons_mat = zeros(num_nodes, n_roads);
    for i = 1:num_nodes
        % Roads from the current node
        from_roads = roads_from(i);
        
        % Roads to the current node
        to_roads = roads_to(i);
        
        % Update the flow conservation matrix
        for j = 1:length(from_roads)
            flow_cons_mat(i, from_roads(j)) = 1;
        end
        
        for j = 1:length(to_roads)
            flow_cons_mat(i, to_roads(j)) = -1;
        end
    end

end
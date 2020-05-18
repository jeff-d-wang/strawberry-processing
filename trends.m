number_entries = 150;
number_objects = 30;

totaliters = 5;

overall = zeros(1, number_entries); 

%for numberiters = 1:totaliters
%     adj = -1 * ones(number_objects);
    adjzeros = zeros(number_objects);

%     performance = zeros(1, number_entries);
    performancezeros = zeros(1, number_entries); % one row

    sub150 = malicious{1:150, (2:7)}; % change for different dataset.

    sub150 = sub150(randperm(size(sub150, 1)), :); 

    for iter = 1:150
        row = sub150(iter, :);

%         adj(row(1)+1, row(2)+1) = row(4);
%         adj(row(1)+1, row(3)+1) = row(5);
%         adj(row(2)+1, row(3)+1) = row(6);
% 
%         adj(row(2)+1, row(1)+1) = row(4);
%         adj(row(3)+1, row(1)+1) = row(5);
%         adj(row(3)+1, row(2)+1) = row(6);

        adjzeros(row(1)+1, row(2)+1) = row(4);
        adjzeros(row(1)+1, row(3)+1) = row(5);
        adjzeros(row(2)+1, row(3)+1) = row(6);

        adjzeros(row(2)+1, row(1)+1) = row(4);
        adjzeros(row(3)+1, row(1)+1) = row(5);
        adjzeros(row(3)+1, row(2)+1) = row(6);

%         results = spectralcluster(adj, 2);
%         indicator = (results~=sbdata.groundtruth);
%         performance(iter) = min(sum(indicator), number_objects-sum(indicator));

        disp(iter)
        resultszero = spectralcluster(adjzeros, 2);
        indicatorzeros = (resultszero~=sbdata.groundtruth);
        performancezeros(iter) =  min(sum(indicatorzeros ), number_objects-sum(indicatorzeros ));
        overall(iter) = overall(iter)+ performancezeros(iter);
        G = graph(adjzeros);
    end
%end

overall = overall/totaliters;





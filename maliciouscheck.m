number_entries = 150;
number_objects = 30;

adj = -1 * ones(number_objects);
adjzeros = zeros(number_objects);

performance = zeros(1, number_entries);
performancezeros = zeros(1, number_entries);

% todo: normalize

% 100\
for iter = 31:180
     
    disp(iter)
    
    row = malicious{iter, (2:7)};

    adj(row(1)+1, row(2)+1) = row(4);

    adj(row(1)+1, row(3)+1) = row(5);

    adj(row(2)+1, row(3)+1) = row(6);
    
    
    adj(row(2)+1, row(1)+1) = row(4);

    adj(row(3)+1, row(1)+1) = row(5);

    adj(row(3)+1, row(2)+1) = row(6);
    
    
    adjzeros(row(1)+1, row(2)+1) = row(4);

    adjzeros(row(1)+1, row(3)+1) = row(5);

    adjzeros(row(2)+1, row(3)+1) = row(6);
        
    
    adjzeros(row(2)+1, row(1)+1) = row(4);

    adjzeros(row(3)+1, row(1)+1) = row(5);

    adjzeros(row(3)+1, row(2)+1) = row(6);
    
    
    results = spectralcluster(adj, 2);

    indicator = (results~=sbdata.groundtruth);
    
    performance(iter) = sum(indicator);
    
    
    resultszero = spectralcluster(adjzeros, 2);

    indicatorzeros = (resultszero~=sbdata.groundtruth);
    
    performancezeros(iter) = sum(indicatorzeros); 

end



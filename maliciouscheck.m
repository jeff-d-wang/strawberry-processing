number_entries = 150;
number_objects = 30;

totaliters = 30;

overall = zeros(1, number_objects); 

for numberiters = 1:totaliters
    adjzeros = zeros(number_objects);

    sub150 = flowers{1+numberiters:150+numberiters, (2:7)}; % change for different dataset.

    sub150 = sub150(randperm(size(sub150, 1)), :); 

    overt = zeros(1, number_entries); 
    
    for iter = 1:150
        row = sub150(iter, :);

        adjzeros(row(1)+1, row(2)+1) = row(4);
        adjzeros(row(1)+1, row(3)+1) = row(5);
        adjzeros(row(2)+1, row(3)+1) = row(6);

        adjzeros(row(2)+1, row(1)+1) = row(4);
        adjzeros(row(3)+1, row(1)+1) = row(5);
        adjzeros(row(3)+1, row(2)+1) = row(6);
    end
    
    disp(numberiters)
    resultszero = spectralcluster(adjzeros, 2);
    indicatorzeros = (resultszero~=sbdata.groundtruth);
    performancezero =  min(sum(indicatorzeros), number_objects-sum(indicatorzeros ));
    overall(numberiters) = performancezero;
    G = graph(adjzeros);
end


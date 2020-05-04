load('sbdata.mat')

%{
sbdata.adj030(1:1+size(sbdata.adj030,1):end) = 1
sbdata.adj060(1:1+size(sbdata.adj060,1):end) = 1
sbdata.adj090(1:1+size(sbdata.adj090,1):end) = 1
sbdata.adj120(1:1+size(sbdata.adj120,1):end) = 1
sbdata.adj150(1:1+size(sbdata.adj150,1):end) = 1

save('sbdata.mat')

figure, imagesc(sbdata.adj030);
figure, imagesc(sbdata.adj060);
figure, imagesc(sbdata.adj090);
figure, imagesc(sbdata.adj120);
figure, imagesc(sbdata.adj150);


test = sbdata.adj030;

test(test<0) = [0];

G = graph(test);
A = adjacency(G)
%}

idx030 = spectralcluster(sbdata.adj030, 2)
idx060 = spectralcluster(sbdata.adj060, 2)
idx090 = spectralcluster(sbdata.adj090, 2)
idx120 = spectralcluster(sbdata.adj120, 2)
idx150 = spectralcluster(sbdata.adj150, 2)

% look at trends of accuracies
% -1 -> 0 to 1
% more datasets, more accuracy plots
% malicious user

figure, imagesc(sbdata.adj150);
colorbar

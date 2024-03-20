function result = ballot(popissuetable,canissuetable,pops,candidates,providePrecentages)

arguments
    popissuetable (:,:) table
    canissuetable (:,:) table
    pops (:,1) double
    candidates (:,1) double
    providePrecentages (1,1) double = false
end

% Number of POPs and candidates
popCount = length(pops); canCount = length(candidates);

% Generate support matrix
support = popSupport(popissuetable,canissuetable,pops,candidates);

% Sort support in descending order for each POP
[sortSupport,rankSupport] = sort(support,2,"descend");

% Initialize ballot count matrix
if providePrecentages == true
    canVotes = zeros(canCount,3);
else
    canVotes = zeros(canCount,2);
end
canVotes(:,1) = candidates;

for p = 1:popCount
    pp = pops(p);

    % Size of pop
    popSZ = min(lookupTable(popissuetable,"pop",pp).sz);
    
    % Total support the POP gives to all candidates
    totalSupport = sum(sortSupport(p,:));

    for c = 1:canCount
        % cc = candidates(c);

        % Candidate support from pop
        canSupport = sortSupport(p,rankSupport(p,:) == c);

        % Proportion of total support
        canSupportProp = canSupport / totalSupport;

        % Calculate number of votes
        votes = round(canSupportProp * popSZ);

        % Add to running total
        canVotes(c,2) = canVotes(c,2) + votes;
    end
end

% Provide percentages
if providePrecentages == true
    for c = 1:canCount
        canVotes(c,3) = canVotes(c,2) / sum(canVotes(:,2));
    end
end

% result = vote totals, sorted descending
result = sortrows(canVotes,2,"descend");

end
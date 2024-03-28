function [result1,result2,result3] = popSupport(pops,candidates,rankDepth)

arguments
    pops (:,1) double
    candidates (:,1) double
    rankDepth (1,1) double = 1
end

% Globals
global pIT cIT

% All issues, and the count
issues = unique(pIT{:,"iID"});
issueCount = length(issues);

% Number of pops and candidates, respectively
popCount = length(pops); canCount = length(candidates);

baseSupport = zeros(popCount,canCount,rankDepth);

for p = 1:popCount

    % Pull this pop's biases from the issue table
    opinions = lookupTable(pIT,"pop",pops(p));
    
    % Initialize pop bias and importance tables
    popPos = zeros(issueCount,1);
    issDiv = zeros(issueCount,1); demDiv = zeros(issueCount,1);

    %% For every issue, define bias and importance
    for i = 1:issueCount
        
        % Pop's sum of biases per issue
        popPos(i) = sum(opinions{opinions.iID == i,"skew"});

        % Pop's mean importance divisor for each personal demographic, and
        % how important this issue is to that demographic.  If unspecified,
        % default to 10.
        demDiv(i) = min([mean(opinions{opinions.iID == i,"importance_pop_dem"}), 10]);
        issDiv(i) = min([mean(opinions{opinions.iID == i,"importance_dem_iss"}), 10]);

    end
    

    %% For every candidate, calculate overall pop support
    for i = 1:issueCount

        merge = table(0,'VariableNames',"x");
        for c = 1:canCount

            % Pull the candidate's positions from the can issue table
            canOpinions = lookupTable(cIT,"cID",candidates(c));
            
            % Candidate's position on this issue
            issPos = canOpinions{canOpinions.iID == i,"position"};
            if isempty(issPos)
                issPos = 0; % If they have no listed position, assume 0
            end
            
            % Calculate base support, divide by how much they care, and
            % add to running total for candidate support
            [t1,t2] = dists(popPos(i),issPos,0,0);
            tt = table(t1',t2','VariableNames',["x",string(c)]);
            merge = outerjoin(merge,tt,"Keys","x","MergeKeys",true);
            % supportTemp = supportTemp + t1 / mean([demDiv(i) issDiv(i)]);
            
        end
        v = merge{:,2:end};
        x{p,i} = merge{:,1};

        [support{p,i},rank{p,i}] = sort(v,2,"descend","MissingPlacement","last");

        % Write to final matrix
        % baseSupport(p,c) = supportTemp;

    end

end

result1 = support;
result2 = rank;
result3 = x;

end
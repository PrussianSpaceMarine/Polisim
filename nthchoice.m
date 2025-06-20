function result = nthchoice(support,rank,x,n)
%% NTHCHOICE
% Proportion of every pop which considers each candidate their nth choice,
% to a level of rankDepth, where rankDepth <= count of candidates.

arguments
    support (:,:) cell
    rank (:,:) cell
    x (:,:) cell
    n (1,1) double = 1
end

% Count POPs, Issues & Candidates
pcount = height(support);
icount = width(support);
ccount = width(support{1,1});

sup = zeros(pcount,ccount);

% For each POP...
for p = 1:pcount

    % For each issue...
    for i = 1:icount

        % Define array locations
        ss = support{p,i};
        rr = rank{p,i};
        xx = x{p,i};

        % For each candidate...
        for c = 1:ccount
            sup = sup;
        end

    end

end

end
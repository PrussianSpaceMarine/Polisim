function result = overallSupport(support,rank,x)
%% OVERALLSUPPORT
% Combines support across issues into an overall ranking that considers
% everything the POPs care for, returning support for each candidate per
% POP, at each level of choice

arguments
    support (:,:) cell
    rank (:,:) cell
    x (:,:) cell
end

% Count POPs, Issues & Candidates
pcount = height(support);
icount = width(support);
ccount = width(support{1,1});

sup = zeros(pcount,ccount);

% For each POP...
for p = 1:pcount

    % Spectrum of care across all issues for this POP
    megaX = unique(vertcat(x{p,:}));

    % For each issue...
    for i = 1:icount

        % Pull support and ranks for this POP and issue
        ss = support{p,i};
        rr = rank{p,i};
        % head(ss)
        % head(rr)

        % For each level of support...
        for r = 1:ccount

            % For each candidate...
            for c = 1:ccount
                g = ss(rr(:,r) == c,r);
                g = fillmissing(g,"constant",0);
                s(p,i,r,c) = sum(g);
            end

        end

    end

end

for p = 1:pcount
    for c = 1:ccount
        for r = 1:ccount
            combine(p,c,r) = sum(s(p,:,r,c));
        end
    end
end

result = combine;

end
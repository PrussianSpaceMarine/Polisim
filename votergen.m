function output = votergen(pollLoc,genCount,issues,existingGen)
% Generate v voters in a given precinct with a stance across i issue dimensions

arguments
    pollLoc (1,1) double
    genCount (1,1)
    issues (1,1)
    existingGen (1,1) double = 0
end

voters = zeros(genCount,issues+2);
voters(:,2) = pollLoc; % Assign precinct

for v = 1:genCount
    voters(v,1) = existingGen + v; % Assign voter ID
    for i = 1:issues
        voters(v,i+2) = randn; % Assign stance on each issue
    end
end

output = voters;

end
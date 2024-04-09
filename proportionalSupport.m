function result = proportionalSupport(sup)
%% proportionalSupport
% Converts absolute support values from overallSupport.m to proportional

% Dimensions
sz = size(sup);

% Initialize
prop = zeros(sz);

% For each pop...
for p = 1:sz(1)

    for r = 1:sz(3)

        % Total support for this pop at this level
        totalSupport = sum(sup(p,:,r));

        % For each candidate...
        for c = 1:sz(2)

            % Proportion of each element
            prop(p,c,r) = sup(p,c,r) / totalSupport;

        end


    end

end

% Final result
result = prop;

end
function results = opine(issuematrix,pop)

% Filter issue matrix to this pop
f = lookupTable(issuematrix,"pop",pop);

% All relevant issues
iss = unique(f.iID);
baseSkew = zeros(length(iss),1);
importance = zeros(length(iss),1);
skew = zeros(length(iss),1);

% Create base table
issSkew = table(iss,baseSkew,importance,skew,'VariableNames',["iID","baseSkew","importance","skew"]);

% For every issue...
for i = 1:length(iss)
    o = f(f.iID == iss(i),["iID","skew","importance_dem_iss","importance_pop_dem"]);

    % Adjust issue importance according to Zipf's Law
    o.importance_dem_iss = 1./(o.importance_dem_iss(:));
    o.importance_pop_dem = 1./(o.importance_pop_dem(:));

    % The overall weight of this issue, according to how
    % important each demographic identity is to this pop
    avgImportance = mean(mean([o.importance_dem_iss, o.importance_pop_dem]));
    
    % Place information for this issue into the table
    issSkew(i,"baseSkew") = {sum(o.skew)};
    issSkew(i,"importance") = {avgImportance};
    issSkew(i,"skew") = {issSkew{i,"baseSkew"} .* issSkew{i,"importance"}};
end

results = issSkew;

end
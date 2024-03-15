function result = lookupTable(tableSearchIn,tableColName,searchFor)

% Filters a table based to all entries that match a n-by-1 array of search
% keys.

arguments
    tableSearchIn table
    tableColName string
    searchFor (:,1)
end

for i = 1:length(searchFor)
    if exist("compile","var")
        
        % If the "compile" table exists, add to that rather than creating a
        % new variable

        add = tableSearchIn(table2array(tableSearchIn(:,tableColName) == searchFor(i)),:);
        compile = [compile;add];

    else
        compile = tableSearchIn(table2array(tableSearchIn(:,tableColName) == searchFor(i)),:);
    end
end

result = compile;

end
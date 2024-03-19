%% Re-initialize Data

drive = "settings/datasets/";
dataset = "default";

% Demographics use placeholders from Democracy 4
dem = readtable(drive + dataset + "/demographics.csv","ReadVariableNames",true);

% Issues are on a simple 2-axis political compass
iss = readtable(drive + dataset + "/issues.csv","ReadVariableNames",true);

% Map demographics to their issues
dem_iss = readtable(drive + dataset + "/demographic_issues.csv","ReadVariableNames",true);

% Geographic/Polling Locations
polls = readtable(drive + dataset + "/polls.csv","ReadVariableNames",true);

% Placeholder political parties
par = readtable(drive + dataset + "/parties.csv","ReadVariableNames",true);

% Parties' positions on issues
par_iss = readtable(drive + dataset + "/party_issues.csv","ReadVariableNames",true);

% Placeholder pops
pop = readtable(drive + dataset + "/pop.csv","ReadVariableNames",true);

% Pops demographic assignment
pop_dem = readtable(drive + dataset + "/pop_dem.csv","ReadVariableNames",true);

% Placeholder candidates
can = readtable(drive + dataset + "/can.csv","ReadVariableNames",true);

% The issue table for pops to form opinions
issueTable = outerjoin(dem_iss,pop_dem,"Keys","dID","MergeKeys",true);
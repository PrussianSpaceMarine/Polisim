%% Pull demographics and issues

% Define which data set to use
dataset = "default";

% Demographics use placeholders from Democracy 4
dem = readtable("settings/datasets/" + dataset + "/demographics.csv","ReadVariableNames",true);

% Issues are on a simple 2-axis political compass
iss = readtable("settings/datasets/" + dataset + "/issues.csv","ReadVariableNames",true);

% Map demographics to their issues
dem_iss = readtable("settings/datasets/" + dataset + "/demographic_issues.csv","ReadVariableNames",true);

% Geographic/Polling Locations
polls = readtable("settings/datasets/" + dataset + "/polls.csv","ReadVariableNames",true);
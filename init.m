%% Pull demographics and issues

% Demographics use placeholders from Democracy 4
dem = readtable("/MATLAB Drive/Polisim/settings/demographics.csv","ReadVariableNames",true);

% Issues are on a simple 2-axis political compass
iss = readtable("/MATLAB Drive/Polisim/settings/issues.csv","ReadVariableNames",true);

% Map demographics to their issues
dem_iss = readtable("/MATLAB Drive/Polisim/settings/demographic_issues.csv","ReadVariableNames",true);

% Geographic/Polling Locations
polls = readtable("/MATLAB Drive/Polisim/settings/polls.csv","ReadVariableNames",true);
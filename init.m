%% Pull demographics and issues

% Demographics use placeholders from Democracy 4
dem = readtable("Polisim/settings/demographics.xlsx","ReadVariableNames",true);

% Issues are on a simple 2-axis political compass
iss = readtable("Polisim/settings/issues.xlsx","ReadVariableNames",true);

% Map demographics to their issues
dem_iss = readtable("Polisim/settings/demographic_issues.xlsx","ReadVariableNames",true);
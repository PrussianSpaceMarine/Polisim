function [result1,result2] = dists(pop,cand,vis,integrate)
% Calculates pop's support for a candidate based on their skew relative to
% the candidate's position, and optionally visualizes it.

arguments (Input)
    pop (1,1) double
    cand (1,1) double
    vis (1,1) double = false
    integrate (1,1) double = true
end

% Population opinion distribution
p = makedist('Normal','mu',pop,'sigma',1);
x = -4:.01:4;
pd = pdf(p,x);

% Distance from candidate factor
diff = -0.3.*((x-cand).^2)+1;

% For integration, only take positive values
valid = diff >= 0;

% Multiply distance factor by pop stance distribution element-wise
weight = pd.*diff;

% Optionally, visualize results
if vis == true
    plot(x,pd,"b-","LineWidth",3)
    hold on
    plot(x,diff,"g--","LineWidth",2.5)
    plot(x,weight,"r-","LineWidth",2.5)
    xline(0,"LineWidth",2)
    legend("Pop Distribution on Issue","Distance to Candidate Position","Support","0")
    
    ylim([0,1])
    xlabel("Issue Position")
    % grid on
    hold off
end

% Result is the integration of weight, where weight is positive
if integrate == true
    result1 = trapz(x(valid),weight(valid));
    result2 = NaN;
else
    result1 = x(valid);
    result2 = weight(valid);
end

end
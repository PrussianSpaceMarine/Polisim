p = makedist('Normal','mu',-1.5,'sigma',1);
pop = -0.5;
x = -4:.01:4;
pc = cdf(p,x);
pd = pdf(p,x);
diff = -0.3.*((x-pop).^2)+1;
weight = pd.*diff;
plot(x,pd,"b-","LineWidth",3)
hold on
plot(x,diff,"g--","LineWidth",2.5)
plot(x,weight,"r-","LineWidth",2.5)
xline(0,"LineWidth",2)
legend("Pop Distribution on Issue","Distance to Candidate Position","Support","0")
support = sum(weight(weight >= 0));
ylim([0,1])
xlabel("Issue Position")
% grid on
hold off
%alles loaden
load lengte.mat
load test1.mat
load test2.mat
load test3.mat

f = [f1; f2; f3];
lSI = l * 0.01;
figure(1)
hold on
legends = {};
vc = 0;
%for loop voor alle metingen te plotten
for j=1:3
    
    kracht = f(j,:);
    scatter(lSI,kracht,'x')
    fitj = fit(lSI',kracht', "poly1")
    plot(fitj)
    legends = [legends {"metingen reeks " + j, "fitted curve reeks " + j}];
    %plot(fitj, lSI, kracht)
    disp("de veerconstante is: ")
    disp(fitj.p1 + "N/m")
    vc = vc + fitj.p1;
end
%plot settings
ax = gca
xtickformat('%.3f');
ytickformat('%.1f' );
ax.FontSize = 8;
xlim([lSI(1)-0.01 lSI(end) + 0.01]);
legend(legends)
xlabel('Lengte elastiek L (m)' );
ylabel('Trekkracht F (N)' );
legend('Location' ,'northwest' );
legend('boxoff' );
vc = vc/height(f);
disp("de veerconstante(gem) is: ")
disp(vc + "N/m")
function [x1, tab] = newtonr (f, x0, tol, max, time)

% default arguments
if nargin < 3
    tol = 1e-4;
    max = 20;
    time = 1;
end

tab = (max);

y = sym(f);
fp = matlabFunction(diff(y));

x = linspace(x0-10, x0+10, 1000);

figure
set(gca,'DataAspectRatio',[1 1 1])
plot(x, f(x), "LineWidth",2)
axis([x0-10 x0+10 -50 50])
title("Newton-Raphson Method")
xlabel("𝑥")
ylabel("f(𝑥)")
grid on
hold on
shg

for i = 1:max
    
    % add element to the table 
    tab(i) = x0;

    h1 = plot(x0, f(x0), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 6, 'LineWidth',2);
    text(x0, f(x0)+0.5, "  𝑥_{"+ i + "}")
    pause(time)
    delete(h1)
    plot(x0, f(x0), 'bo', 'MarkerFaceColor', 'b', 'MarkerSize', 6, 'LineWidth',2)

    if fp(x0) == 0
        close all
        errordlg('x1 is local min/max','Error')
        return
    end
    x1 = x0 - f(x0)/fp(x0);
    h2 = plot(x, (-f(x0)).*(x-x0)/(x1-x0) + f(x0), '--k', 'LineWidth', 1);
    pause(time)
    delete(h2)

    if abs(x1 - x0) < tol
        return
    else
        x0 = x1;
    end
end
end
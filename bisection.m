function [c, tab] = bisection (f, x0, x1, tol, max, time)

% catch errors
if (x0 > x1)
    errordlg('x1 must be bigger than x0','Error')
    error('x1 must be bigger than x0')
end

if f(x0)*f(x1) > 0
    errordlg('The interval does not contain a root','Error')
    error('The interval does not contain a root')
end

% default arguments
if nargin < 4
    tol = 1e-4;
    max = 20;
    time = 1;
end

tab = (max);

x = linspace(x0-1, x1+1, 100);

figure
set(gca,'DataAspectRatio',[1 1 1])
plot(x, f(x), "LineWidth", 1)
axis([x0-1 x1+1 -4 f(x1+1)])
title("Bisection Method")
xlabel("𝑥")
ylabel("f(𝑥)")
text(x0, 0, "  𝑥_0")
text(x1, 0, "  𝑥_1")
grid on
hold on

shg



for i = 1:max

    c = (x0+x1)/2;

    % add element to the table
    tab(i) = c;

    % animation
    plot(x0, 0, 'rx', 'MarkerFaceColor', 'r', 'MarkerSize', 8, 'LineWidth',2);
    plot(x1, 0, 'bx', 'MarkerFaceColor', 'b', 'MarkerSize', 8, 'LineWidth',2);
    hc = plot(c, 0, 'gx', 'MarkerFaceColor', 'g', 'MarkerSize', 8, 'LineWidth',2);
    pause(time);
    
    if f(c) == 0 
        return
    end

    if (x1-x0)/2 < tol
        return
    end

    if f(x1)*f(c) > 0
        x1 = c;
        
    else 
        x0 = c;
    end
    delete(hc);
end

end

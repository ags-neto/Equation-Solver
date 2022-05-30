clear, clc, close all;

% menu interface
title = 'Miniproject MCEE 21/21';
str = {'Numerical solving of equations', 'Select a Method'};
list = {'Bisections', 'Newton-Raphson', 'Secant'};
method = listdlg('Name', title, 'PromptString', str, ...
    'ListSize', [270 45], 'ListString', list, 'SelectionMode', 'single');
if isempty(method)
    return
end
    
% fetch equation
prompt = {'Type an Equation in function of x:'};
definput = {'exp(x-3/2)-1'};
fun = inputdlg(prompt, title, [1 50], definput);
if isempty(fun)
    return
end
eq = str2func(['@(x)' vectorize(fun{:})]);
   
switch method
    case 1
        while true
            prompt = {'x0:','x1:','tolerance:','maximum iterations:', ...
                'time between frames (sec)'};
            definput = {'0', '4', '1e-4', '20', '0.5'};
            k = inputdlg(prompt, title, [1 50], definput);
            if isempty(k)
                return
            end
            try
                [result, tab] = bisection(eq, str2double(k{1}), str2double(k{2}), ...
                    str2double(k{3}), str2double(k{4}), str2double(k{5}));
            catch ME
                disp("Error Message: " + ME.message)
                continue
            end
            break
        end
    case 2
        while true
            prompt = {'x0:','tolerance:','maximum iterations:', ...
                'time between frames (sec)'};
            definput = {'0', '1e-4', '20', '0.5'};
            k = inputdlg(prompt, title, [1 50], definput);
            if isempty(k)
                return
            end
            try
                [result, tab] = newtonr(eq, str2double(k{1}), str2double(k{2}), ...
                    str2double(k{3}), str2double(k{4}));
            catch ME
                disp("Error Message: " + ME.message)
                continue
            end
            break
        end
    case 3
        while true
            prompt = {'x0:','x1:','tolerance:','maximum iterations:', ...
                'time between frames (sec)'};
            definput = {'0', '4', '1e-4', '20', '0.5'};
            k = inputdlg(prompt, title, [1 50], definput);
            if isempty(k)
                return
            end
            try
                [result, tab] = secant(eq, str2double(k{1}), str2double(k{2}), ...
                    str2double(k{3}), str2double(k{4}), str2double(k{5}));
            catch ME
                disp("Error Message: " + ME.message)
                continue
            end
            break
        end
end

f = figure;
uit = uitable(f);
uit.ColumnName = {'Value'};
uit.Data = tab(:);

msgbox("Result = " + result);

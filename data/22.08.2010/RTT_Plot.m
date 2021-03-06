function RTT_Plot(X1, Y1)
%CREATEFIGURE(X1, Y1)
%  X1:  scatter x
%  Y1:  scatter y

%  Auto-generated by MATLAB on 22-Jun-2018 10:40:32

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,'Position',[0.13 0.5675 0.775 0.3575]);
hold(axes1,'on');

% Create scatter
scatter1 = scatter(X1,Y1,'DisplayName','data1','Parent',axes1);

% Get xdata from plot
xdata1 = get(scatter1, 'xdata');
% Get ydata from plot
ydata1 = get(scatter1, 'ydata');
% Make sure data are column vectors
xdata1 = xdata1(:);
ydata1 = ydata1(:);


% Get axes ylim
axXLim1 = get(axes1,'xlim');

% Find the mean
ymean1 = mean(ydata1);
% Get coordinates for the mean line
meanValue1 = [ymean1 ymean1];
% Plot the mean
statLine1 = plot(axXLim1,meanValue1,'DisplayName','   y mean',...
    'Tag','mean y',...
    'Parent',axes1,...
    'LineStyle','-.',...
    'Color',[0 0.5 0]);

% Set new line in proper position
setLineOrder(axes1,statLine1,scatter1);

% Remove NaN values and warn
nanMask1 = isnan(xdata1(:)) | isnan(ydata1(:));
if any(nanMask1)
    warning('GeneratedCode:IgnoringNaNs', ...
        'Data points with NaN coordinates will be ignored.');
    xdata1(nanMask1) = [];
    ydata1(nanMask1) = [];
end

% Find x values for plotting the fit based on xlim
axesLimits1 = xlim(axes1);
xplot1 = linspace(axesLimits1(1), axesLimits1(2));

% Prepare for plotting residuals
set(axes1,'position',[0.1300    0.5811    0.7750    0.3439]);
residAxes1 = axes('position', [0.1300    0.1100    0.7750    0.3439], ...
    'parent', gcf);
savedResids1 = zeros(length(xdata1), 1);
% Sort residuals
[sortedXdata1, xInd1] = sort(xdata1);

% Find coefficients for polynomial (order = 1)
fitResults1 = polyfit(xdata1,ydata1,1);
% Evaluate polynomial
yplot1 = polyval(fitResults1,xplot1);

% Calculate and save residuals - evaluate using original xdata
Yfit1 = polyval(fitResults1,xdata1);
resid1 = ydata1 - Yfit1(:);
savedResids1(:,1) = resid1(xInd1);
% Plot the fit
fitLine1 = plot(xplot1,yplot1,'DisplayName','   linear','Tag','linear',...
    'Parent',axes1,...
    'Color',[0.929 0.694 0.125]);

% Set new line in proper position
setLineOrder(axes1,fitLine1,scatter1);

% Plot residuals in a scatter plot
residPlot1 = plot(sortedXdata1,savedResids1,'.','parent', residAxes1);
% Set colors to match fit lines
set(residPlot1(1), 'color', [0.929 0.694 0.125]);
% Set residual plot axis title
title(residAxes1, 'residuals');

% Create title
title({'Scatterplot of Latency vs Time'});

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0 100]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 900]);
% Create legend
legend(axes1,'show');

%-------------------------------------------------------------------------%
function setLineOrder(axesh1, newLine1, associatedLine1)
%SETLINEORDER(AXESH1,NEWLINE1,ASSOCIATEDLINE1)
%  Set line order
%  AXESH1:  axes
%  NEWLINE1:  new line
%  ASSOCIATEDLINE1:  associated line

% Get the axes children
hChildren = get(axesh1,'Children');
% Remove the new line
hChildren(hChildren==newLine1) = [];
% Get the index to the associatedLine
lineIndex = find(hChildren==associatedLine1);
% Reorder lines so the new line appears with associated data
hNewChildren = [hChildren(1:lineIndex-1);newLine1;hChildren(lineIndex:end)];
% Set the children:
set(axesh1,'Children',hNewChildren);


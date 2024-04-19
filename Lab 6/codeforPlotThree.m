function createfigure(X1, Y1, Size1)
%CREATEFIGURE(X1, Y1, Size1)
%  X1:  vector of scatter x data
%  Y1:  vector of scatter y data
%  SIZE1:  vector of scatter size data

%  Auto-generated by MATLAB on 06-Mar-2024 06:52:37

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create scatter
scatter(X1,Y1,Size1,'MarkerEdgeColor',[0 0 0],'LineWidth',1.5,...
    'MarkerFaceColor',[1 0 0]);

% Create ylabel
ylabel('Y-axis');

% Create xlabel
xlabel('X-axis');

% Create title
title('Scatter Plot of Position of TARGET Color');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[1 700]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[1 467]);
hold(axes1,'off');

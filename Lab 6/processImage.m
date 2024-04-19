function [middleY, middleX] = processImage(fileName)
clf;
%{
% Prompt the user to select an image file
[fileName, filePath] = uigetfile({'*.jpg;*.png;*.bmp;*.gif;*.tif', 'Image files (*.jpg, *.png, *.bmp, *.gif, *.tif)'; '*.*', 'All files (*.*)'}, 'Select an image file');

% Check if the user clicked 'Cancel'
if isequal(fileName, 0)
    disp('User canceled the operation.');
else
    % Display the selected file information
    disp(['Selected file: ', fullfile(filePath, fileName)]);
%}
    %read image
ball = imread(fileName);

%get layers/color channels
Red   = ball(:,:,1);
Green = ball(:,:,2);
Blue  = ball(:,:,3);

%target rgb values for the type of green tennis ball tend to be
ballindex = (Red >= 70 & Red <= 250)  & (Green >= 180 & Green <= 260) & (Blue >= 5 & Blue <= 150);


%change every pixel that matches the target rgb values to white
Red(ballindex)   = 255;
Green(ballindex) = 255;
Blue(ballindex)  = 255;

% Set pixels that do not meet the condition to black (0)
Red(~ballindex) = 0;
Green(~ballindex) = 0;
Blue(~ballindex) = 0;

%update image (white = target pixels, black = non-target pixels) 
convertTestRGB = cat(3, Red, Green, Blue);

% get x and y  positions of targeted pixels
[averageY, averageX] = find(Red == 255);


% Calculate the average position
averagePosition = [mean(averageY), mean(averageX)];

disp('Average position of target pixels [Y, X]:');
disp(averagePosition);

%show altered image
imshow(convertTestRGB);

%%%%%%%%%%Debugging%%%%%%%%%%%%
gridSpacing = 50; 

% Get image size
[height, width, ~] = size(ball);

% Draw vertical grid lines
for x = 1:gridSpacing:width
   hold on;
   plot([x, x], [1, height], 'r-', 'LineWidth', 1);
end

% Draw horizontal grid lines
for y = 1:gridSpacing:height
   hold on;
   plot([1, width], [y, y], 'r-', 'LineWidth', 1);
end

%marker
hold on;
plot( mean(averageX)  , mean(averageY), 'ro', 'LineWidth', 2);
hold off;

axis equal;
axis tight;

title('Location of the Ball');
xlabel('X Position');
ylabel('Y Position');
%%%%%%%%%%Debugging%%%%%%%%%%%%

% Get x and y values based on the boolean index
[y_values, x_values] = find(ballindex);

% Create scatter plot
figure;

scatter(x_values, y_values, 50, 'Marker', 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k', 'LineWidth', 1.5);

% Set axis limits based on the image size
axis([1, size(ball, 2), 1, size(ball, 1)]);

title('Scatter Plot of Position of TARGET Color');
xlabel('X-axis');
ylabel('Y-axis');

middleY =  mean(averageY);
middleX =  mean(averageX);

end%end of if-else statement
%end%end of function


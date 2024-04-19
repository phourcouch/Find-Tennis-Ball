clf;
ballone = imread("tennis-ball-3.jpg");

Red   = ballone(:,:,1);
Green = ballone(:,:,2);
Blue  = ballone(:,:,3);

ballindex = (Red >= 70 & Red <= 250)  & (Green >= 180 & Green <= 260) & (Blue >= 5 & Blue <= 150);

Red(ballindex)   = 255;
Green(ballindex) = 255;
Blue(ballindex)  = 255;

% Create the converted RGB image
convertTestRGB = ballone;
convertTestRGB(:,:,1) = Red;
convertTestRGB(:,:,2) = Green;
convertTestRGB(:,:,3) = Blue;

% Assuming Red is your modified red channel
[averageXRed, averageYRed] = find(Red == 255);

% Calculate the average position
averagePositionRED = [mean(averageXRed), mean(averageYRed)];

disp('Average position of RED pixels with value 255:');
disp(averagePositionRED);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assuming Red is your modified red channel
[averageXGreen, averageYGreen] = find(Green == 255);

% Calculate the average position
averagePositionGREEN = [mean(averageXGreen), mean(averageYGreen)];

disp('Average position of GREEN pixels with value 255:');
disp(averagePositionGREEN);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Assuming Red is your modified red channel
[averageXBlue, averageYBlue] = find(Blue == 255);

% Calculate the average position
averagePositionBLUE = [mean(averageXBlue), mean(averageYBlue)];

disp('Average position of BLUE pixels with value 255:');
disp(averagePositionBLUE);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure; 

imshow(convertTestRGB); 


gridSpacing = 50;  % Adjust the spacing of grid lines as needed

% Get image size
[height, width, ~] = size(ballone);

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


avgX = (mean(averageXRed) + mean(averageXGreen) + mean(averageXBlue))/3;
avgY =(mean(averageYRed) + mean(averageYGreen) + mean(averageYBlue))/3;


hold on;
scatter(avgY, avgX, 'ro', 'LineWidth', 2);
hold off;

axis equal; 
axis tight;

title('Location of the Ball');
xlabel('X Position');
ylabel('Y Position');



%return;




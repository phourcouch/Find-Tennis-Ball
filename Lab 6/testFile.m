failedTests = 0;

[middleY, middleX] = processImage("tennis-ball-1.jpg");


if( (middleY >= 259 && middleY <= 607) && (middleX >= 751 && middleX <= 1099))
    disp("Test Case 1 Passed");
else
      disp("Test Case 1 Failed");
failedTests = failedTests +1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[middleY, middleX] = processImage("tennis-ball-2.jpg");


if( (middleY >= 158 && middleY <= 340) && (middleX >= 74 && middleX <= 262))
    disp("Test Case 2 Passed");
else
      disp("Test Case 2 Failed");
failedTests = failedTests +1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[middleY, middleX] = processImage("tennis-ball-3.jpg");

if( (middleY >= 175 && middleY <= 378) && (middleX >= 136 && middleX <= 345))
    disp("Test Case 3 Passed");
else
      disp("Test Case 3 Failed");
failedTests = failedTests +1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n');
disp("Number of failed test cases: " + failedTests);